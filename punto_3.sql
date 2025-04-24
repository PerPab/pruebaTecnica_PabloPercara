/*
La AFIP le ha enviado una interface que se almacenó en la tabla "ImpuestoSolidario" e indica 
el incremento de precio en concepto de impuesto en determinados modelos de auto. La 
interface está compuesta de registros, con el siguiente formato:
• XXXXXXXXXX (10 caracteres) --> Código de modelo de automóvil
• YYYY (4 caracteres) --> Alícuota a aplicar en concepto de impuesto, donde los últimos 2 
caracteres representan una cifra decimal (la alícuota está comprendida entre 0 y 100)
Realizar un script de actualización que modifique el valor de los modelos de auto de acuerdo
a la información enviada, sobre los modelos donde aplique
*/


UPDATE autos
SET autos.precio = autos.precio * ( 
    1 + ( ISNULL( CAST( LEFT(RIGHT(impuesto.linea, 4), 2)       -- valor entero
     + '.' + RIGHT(impuesto.linea, 2) AS DECIMAL(5,2) ) ,1)     -- valor decimal 
     / 100) 
    )
OUTPUT inserted.modeloCod AS Modelo, inserted.precio AS Precio 
FROM Autos autos
JOIN ImpuestoSolidario impuesto ON autos.modeloCod = LEFT(impuesto.linea, 10);  -- codigo del auto


