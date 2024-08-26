-- Avance 4 Proyecto Integrador  -- 

USE FastfoodDB

 --1
-- LISTAR todos los productos y sus categor�as
--�C�mo puedo obtener una lista de todos los productos junto con sus categor�as?
SELECT*FROM Productos
SELECT * FROM Categorias

SELECT p.Nombre AS NombreProducto, c.Nombre AS NombreCategoria
FROM Productos AS p 
INNER JOIN Categorias AS c 
ON p.CategoriaID = c.CategoriaID;

--2
--Obtener empleados y su sucursal asignada
--�C�mo puedo saber a qu� sucursal est� asignado cada empleado?
select * from Empleados
select * from Sucursales

SELECT e.Nombre as Empleado, s.Nombre as Sucursal
FROM Empleados as e
LEFT JOIN Sucursales as s 
ON s.SucursalID = e.SucursalID;


--3
-- Identificar productos sin categor�a asignada
--�Existen productos que no tienen una categor�a asignada?

SELECT * FROM Productos

SELECT p.Nombre AS NombreProducto
FROM Productos AS p
LEFT JOIN Categorias AS c 
ON p.CategoriaID = c.CategoriaID
WHERE c.CategoriaID IS NULL;


--4
--Detalle completo de �rdenes
--�C�mo puedo obtener un detalle completo de las �rdenes, 
--incluyendo cliente, empleado que tom� la orden, y el mensajero que la entreg�?
SELECT * FROM Ordenes
SELECT * FROM Clientes
SELECT * FROM Mensajeros
select *from Empleados

SELECT 
    o.OrdenID, 
    c.Nombre AS NombreCliente,
    e.Nombre AS NombreEmpleado,
    m.Nombre AS NombreMensajero 
FROM 
    Ordenes AS o 
    LEFT JOIN Clientes AS c ON o.ClienteID = c.ClienteID
    LEFT JOIN Mensajeros AS m ON o.MensajeroID = m.MensajeroID
    LEFT JOIN Empleados AS e ON o.EmpleadoID = e.EmpleadoID;


--5 
-- productos vendidos por sucursal
--�Cu�ntos productos de cada tipo se han vendido en cada sucursal?

-- pregunta profe si hay que realizar count por que ya dice q cantidad se vendieron por productos en la tabla 
select * from DetalleOrdenes
select * from Sucursales
select * from Productos
select * from Ordenes


SELECT
S.Nombre as Sucursal, 
p.Nombre as NombreProducto, SUM(DO.Cantidad) as ProductosVendidos 
FROM Ordenes O
inner join DetalleOrdenes DO ON (O.OrdenID= DO.OrdenID)
inner join Productos P ON (DO.ProductoID = P.ProductoID)
inner join Sucursales S ON (O.SucursalID = S.SucursalID)
GROUP BY S.Nombre, p.Nombre
ORDER BY ProductosVendidos  DESC; 