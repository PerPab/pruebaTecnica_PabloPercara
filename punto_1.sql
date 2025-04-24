/*
Crear un Stored Procedure que tenga como parámetros de entrada una fecha y un código de
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
auto

*/

--DROP PROCEDURE SP_LISTADO_CAMP;

CREATE PROCEDURE SP_LISTADO_CAMP
    @p_fechaCamp DATE			= NULL,
    @p_modeloCod VARCHAR(10)		= NULL
AS
BEGIN

    DECLARE @v_error VARCHAR(500);
    DECLARE @fechaHoy DATE;
    SET @fechaHoy = CAST(GETDATE() AS DATE);

	IF @p_fechaCamp IS NULL
    BEGIN
          SET @v_error = 'El parametro p_fechaCamp no puede ser nulo.';
          THROW 50001, @v_error, 1;
		RETURN;
    END

	IF @p_fechaCamp > @fechaHoy
    BEGIN
        SET @v_error = 'La fecha ingresada debe ser menor a la de hoy.';
        THROW 50002, @v_error, 1;
		RETURN;
    END

    IF NOT EXISTS (
        SELECT 1
        FROM Campanias c
        JOIN CampaniasAutos ca ON c.Id = ca.campaniaId
        JOIN Autos a ON a.modeloCod = ca.modeloCod
        JOIN Marcas m ON m.id = a.marcaCod
        WHERE @p_fechaCamp BETWEEN c.fechaDesde AND c.fechaHasta
          AND (@p_modeloCod IS NULL OR a.modeloCod = @p_modeloCod)
    )
    BEGIN
        SET @v_error = 'No se encontraron resultados con los parametros ingresados';
        THROW 50003, @v_error, 1;
        RETURN;
    END

	SELECT 
        c.nombre                                AS CAMPAÑA,
        m.nombre                                AS MARCA,
        a.modeloCod                             AS MODELOCOD,
        a.descripcion                           AS [DESCRIPCION MODELO],
        a.precio - (a.precio * c.porcDescuento) AS PRECIO
		
    FROM Campanias c
    JOIN CampaniasAutos ca ON c.Id = ca.campaniaId
    JOIN Autos a ON a.modeloCod = ca.modeloCod
    JOIN Marcas m ON m.id = a.marcaCod

    WHERE @p_fechaCamp BETWEEN c.fechaDesde AND c.fechaHasta
      AND (@p_modeloCod IS NULL OR a.modeloCod = @p_modeloCod)
    ORDER BY 
        c.nombre,
        m.nombre,
        a.modeloCod,
        a.descripcion;
 
END;
GO


--EXEC SP_LISTADO_CAMP @P_FechaCamp = '2022/01/01', @P_modeloCod = '2021GXFAAA';

--EXEC SP_LISTADO_CAMP @P_FechaCamp = '2022/01/01';
