-- Avance 4 Proyecto Integrador  -- 

USE FastfoodDB

 --1
-- LISTAR todos los productos y sus categorías
--¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?
SELECT*FROM Productos
SELECT * FROM Categorias

SELECT p.Nombre AS NombreProducto, c.Nombre AS NombreCategoria
FROM Productos AS p 
INNER JOIN Categorias AS c 
ON p.CategoriaID = c.CategoriaID;

--2
--Obtener empleados y su sucursal asignada
--¿Cómo puedo saber a qué sucursal está asignado cada empleado?
select * from Empleados
select * from Sucursales

SELECT e.Nombre as Empleado, s.Nombre as Sucursal
FROM Empleados as e
LEFT JOIN Sucursales as s 
ON s.SucursalID = e.SucursalID;


--3
-- Identificar productos sin categoría asignada
--¿Existen productos que no tienen una categoría asignada?

SELECT * FROM Productos

SELECT p.Nombre AS NombreProducto
FROM Productos AS p
LEFT JOIN Categorias AS c 
ON p.CategoriaID = c.CategoriaID
WHERE c.CategoriaID IS NULL;


--4
--Detalle completo de órdenes
--¿Cómo puedo obtener un detalle completo de las órdenes, 
--incluyendo cliente, empleado que tomó la orden, y el mensajero que la entregó?
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
--¿Cuántos productos de cada tipo se han vendido en cada sucursal?

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