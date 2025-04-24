EJERCICIOS:
1. Crear un Stored Procedure que tenga como parámetros de entrada una fecha y un código de
marca. El resultado de su ejecución debe ser un listado de autos pertenecientes a las
campañas vigentes a la fecha pasada por parámetro y debe mostrar sólo los autos cuya
marca haya sido pasada por parámetro, o todos si no se ingresó ese parámetro.
 El listado debe respetar el siguiente formato:
CAMPAÑA / MARCA / MODELOCOD / DESCRIPCION MODELO / PRECIO.
Ordenar el listado por CAMPAÑA / MARCA / MODELOCOD / DESCRIPCION MODELO.
Notas:

• El precio a mostrar en el listado, es el precio final del auto (es decir, con el descuento
aplicado de la campaña asociada, si lo hubiere).
• Puede haber dos o más campañas en el listado que tenga asociado el mismo modelo de
auto.


3. Crear un Stored Procedure que tenga como parámetro de entrada una fecha y liste los
préstamos vigentes (no cancelados) junto con su correspondiente valor de cancelación para
esa fecha.
El listado debe respetar el siguiente formato:
NRO PRESTAMO / NRO CLIENTE / MARCA / DESCRIPCION MODELO / VIN / VALOR
DE CANCELACION.
Ordenar el listado por NRO PRESTAMO.
Notas:

• El valor de cancelación se considera como el capital del préstamo más el interés diario.
• INTERES DIARIO = (CAPITAL * %Tasa / cantidad de días totales) * Nro. de días desde el alta
* (1 + %IVA)).
• IVA: Tomar de la tabla ParametrosGenerales

3. La AFIP le ha enviado una interface que se almacenó en la tabla "ImpuestoSolidario" e indica
el incremento de precio en concepto de impuesto en determinados modelos de auto. La
interface está compuesta de registros, con el siguiente formato:

• XXXXXXXXXX (10 caracteres) --> Código de modelo de automóvil
• YYYY (4 caracteres) --> Alícuota a aplicar en concepto de impuesto, donde los últimos 2
caracteres representan una cifra decimal (la alícuota está comprendida entre 0 y 100)
Realizar un script de actualización que modifique el valor de los modelos de auto de acuerdo
a la información enviada, sobre los modelos donde aplique.
