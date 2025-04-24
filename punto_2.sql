/*
Crear un Stored Procedure que tenga como parámetro de entrada una fecha y liste los
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
*/



--DROP PROCEDURE SP_LISTADO_PRESTAMOS;

CREATE PROCEDURE SP_LISTADO_PRESTAMOS
    @p_fecha DATE = NULL
    
AS
BEGIN

    DECLARE @v_error VARCHAR(500);
	DECLARE @IVA DECIMAL(5,2)
    DECLARE @imp_nombre VARCHAR(50);
    DECLARE @v_fechaHoy DATE;

    SET @v_fechaHoy	= CAST(GETDATE() AS DATE);

	IF @p_fecha IS NULL
    BEGIN
        SET @v_error = 'El parametro p_fecha no puede ser nulo.';
            THROW 50001, @v_error, 1;
		RETURN;
    END

	IF @p_fecha > @v_fechaHoy
    BEGIN
        SET @v_error = 'La fecha ingresada debe ser menor a la de hoy.';
            THROW 50002, @v_error, 1;
		RETURN;
    END

    SELECT  @IVA = Valor, 
            @imp_nombre = Nombre 
    FROM ParametrosGenerales 
    WHERE UPPER(Nombre) = 'IVA'

    IF @IVA IS NULL 
	BEGIN
        SET @v_error = 'No se pudo recuperar el valor de ' + @imp_nombre + ' desde la tabla ParametrosGenerales.' ;
            THROW 50003, @v_error, 1;
		RETURN;
	END

    IF NOT EXISTS (
        SELECT 1
        FROM Prestamos p
        JOIN Autos a ON p.modeloCod = a.modeloCod
        JOIN Marcas m ON m.id = a.marcaCod
        WHERE p.fechaCancelacion IS NULL
        AND @p_fecha BETWEEN p.fechaAlta AND p.fechaVencimiento
        )
    BEGIN
        SET @v_error = 'No se encontraron préstamos vigentes para la fecha ingresada.';
        THROW 50004, @v_error, 1;
        RETURN;
    END

    SELECT 
        p.nroPrestamo   AS [NRO PRESTAMO],
        p.nroCliente    AS [NRO CLIENTE],
        m.nombre        AS MARCA,
        a.descripcion   AS [DESCRIPCION MODELO],
        p.VIN           AS VIN,
        --capital + interes
        CAST( p.capital + 
        ((p.capital * p.tasa / 100) / DATEDIFF(DAY, p.fechaAlta, p.fechaVencimiento) ) * DATEDIFF(DAY, p.fechaAlta, @p_fecha) * (1 + (ISNULL (@IVA, 1) / 100)) AS MONEY)       
                        AS [VALOR DE CANCELACION]

    FROM Prestamos p
    JOIN Autos a ON p.modeloCod = a.modeloCod
    JOIN Marcas m ON m.id = a.marcaCod
    WHERE p.fechaCancelacion IS NULL
    AND @p_fecha BETWEEN p.fechaAlta AND p.fechaVencimiento
    ORDER BY p.nroPrestamo

END;
GO

--EXEC SP_LISTADO_PRESTAMOS @p_fecha = '2022/01/01';
