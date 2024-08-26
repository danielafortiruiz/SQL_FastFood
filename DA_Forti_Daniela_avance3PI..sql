use FastfoodDB


--Pregunta: �Cu�l es el total de ventas (TotalCompra) a nivel global? 
select * from Ordenes

SELECT SUM(TotalCompra) AS Total_ventas
FROM Ordenes;

-- Cu�l es el precio promedio de los productos dentro de cada categor�a?
SELECT * FROM Productos

SELECT CategoriaID, 
CAST(AVG(Precio) AS DECIMAL(10,2)) AS Precio_promedio 
FROM Productos
GROUP BY CategoriaID
ORDER BY Precio_promedio DESC;


--  �Cu�l es el valor de la orden m�nima y m�xima por cada sucursal? 
select  * from Ordenes

SELECT 
    SucursalID,
    MIN(TotalCompra) AS ValorOrdenMinimo,
    MAX(TotalCompra) AS ValorOrdenMaximo
FROM 
    Ordenes
GROUP BY 
    SucursalID;

--cual es el Mayor n�mero de kil�metros recorridos para una entrega? 
select * from Ordenes

SELECT MAX(kilometrosRecorrer) AS Max_kilometrosRecorrer
FROM Ordenes;



--Cu�l es la cantidad promedio de productos por orden?
SELECT * FROM DetalleOrdenes

SELECT OrdenID, AVG(Cantidad) AS Promedio_cantidad
FROM DetalleOrdenes
GROUP BY OrdenID;


--Cu�l es el total de ventas por cada tipo de pago? 
SELECT * FROM Ordenes

SELECT 
    TipoPagoID,
    SUM(TotalCompra) AS Total_ventas
FROM 
    Ordenes
GROUP BY 
    TipoPagoID
ORDER BY Total_ventas DESC; 



--Cu�l sucursal tiene la venta promedio m�s alta?
select * from Ordenes

SELECT TOP 1 WITH TIES
    SucursalID,
    AVG(TotalCompra) AS Promedio_venta
FROM 
    Ordenes
GROUP BY 
    SucursalID
ORDER BY 
    Promedio_venta DESC;

/* Cu�les son las sucursales que han generado ventas por orden por encima de $50,
y c�mo se comparan en t�rminos 
del total de ventas? */ 
select * from Ordenes

SELECT SucursalID,
    SUM(TotalCompra) AS Total_ventas,
	COUNT(OrdenID) AS NumeroOrdenes,
	CAST (SUM(TotalCompra) /COUNT(OrdenID) AS DECIMAL (10,2))AS VentaXOrden
FROM  Ordenes
GROUP BY  SucursalID
HAVING  SUM(TotalCompra) > 50
ORDER BY Total_ventas DESC;

--C�mo se comparan las ventas promedio antes y despu�s del 1 de julio de 2023? 
select * from Ordenes

	SELECT
    CASE
        WHEN FechaEntrega < '2023-07-01' THEN 'Antes del 1 de julio de 2023'
        ELSE 'Despu�s del 1 de julio de 2023'
    END AS Periodo,
    AVG(TotalCompra) AS PromedioVentas
FROM
    Ordenes
GROUP BY
    CASE
        WHEN FechaEntrega < '2023-07-01' THEN 'Antes del 1 de julio de 2023'
        ELSE 'Despu�s del 1 de julio de 2023'
    END;

	/*�Durante qu� horario del d�a (ma�ana, tarde, noche) se registra la mayor cantidad de ventas, 
	cu�l es el valor promedio de estas ventas, y cu�l ha sido la venta m�xima alcanzada? */ 
	select * from Ordenes

	SELECT HorarioVenta,
    COUNT(*) AS CantidadVentas,
    CAST (AVG(TotalCompra) AS DECIMAL (10,2)) ValorPromedioVenta,
    MAX(TotalCompra) AS VentaMaxima
FROM Ordenes
GROUP BY HorarioVenta
ORDER BY CantidadVentas;