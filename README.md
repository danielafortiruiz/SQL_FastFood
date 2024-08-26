🥤 DESCUBRIENDO LA BASE DE DATOS DE FAST FOOD 🍔
Autor: Daniela María Forti Ruiz
Cohorte: DA-PT01
Institución: Woow Fastfood

📚 INTRODUCCIÓN
¡Bienvenido al PROYECTO DE ANÁLISIS DE DATOS para Woow Fastfood! 🎉 Este proyecto explora y aprovecha la información de órdenes, operaciones, empleados, clientes, mensajeros, sucursales, productos y tipos de pago. Nuestro objetivo es transformar estos datos en CONOCIMIENTOS VALIOSOS para mejorar las decisiones estratégicas y operativas de la empresa. 🍟📊

🛠️ DESARROLLO DEL PROYECTO
1️⃣ DISEÑO DEL ESQUEMA DE LA BASE DE DATOS
Se creó el esquema de la base de datos utilizando sentencias DDL para definir la estructura de las tablas. 🏗️

2️⃣ POBLACIÓN DE TABLAS Y GESTIÓN DE DATOS
Se definieron y poblaron tablas con información relevante como clientes, productos y transacciones. 🔢

3️⃣ CONSULTAS CON FUNCIONES DE AGREGACIÓN
Se realizaron consultas avanzadas utilizando funciones de agregación como SUM, AVG, MIN y MAX para obtener información clave. 📈

4️⃣ TRABAJO CON MÚLTIPLES TABLAS Y JOINs
Se combinaron datos de diferentes tablas usando JOINs y alias para obtener una visión más completa. 🔗

📊 RESULTADOS CLAVE DE 'FASTFOODDB'
Total de Ventas Globales: $520 💵
Precio Promedio por Categoría: La Categoría 10 (Pizzas) tiene el promedio más alto de $12,49. 🍕
Orden Mínima y Máxima por Sucursal: La sucursal [9] tiene la orden mínima y máxima de $95. 🏪
Mayor Número de Kilómetros Recorridos: 12,5 km 🚚
Cantidad Promedio de Productos por Orden: 3 unidades 🧩
Total de Ventas por Tipo de Pago: El tipo de pago con cupón de descuento generó el total más alto de ventas con $95. 🎫
Sucursal con Venta Promedio Más Alta: La sucursal [9] con $95. 🏆
📝 ANÁLISIS Y CONCLUSIONES
Optimización de Precios: Ajustar precios de categorías menos rentables. 📉
Fomento del Pago con Cupones: Continuar ofreciendo promociones. 🎟️
Análisis de Eficiencia en Entrega: Optimizar rutas y logística. 📍
Fomento de Ventas en Sucursales de Bajo Rendimiento: Implementar estrategias de marketing dirigidas. 📈
💡 SUGERENCIAS Y RECOMENDACIONES
Análisis de Precios por Categoría: Ajustar estrategias de precios. 💰
Programas de Fidelización: Basados en datos de ventas y fidelidad del cliente. 🏅
Monitoreo de Tendencias de Ventas: Ajustar estrategias operativas y de marketing. 📊
🔍 CONSULTAS FINALES
Eficiencia de los Mensajeros: Tiempo promedio de entrega es de 30 minutos. ⏱️

sql
Copiar código
SELECT AVG(DATEDIFF(MINUTE, FechaDespacho, FechaEntrega)) AS PromedioTiempoEntrega
FROM ORDENES
WHERE MensajeroID IS NOT NULL;
Análisis de Ventas por Origen de Orden: Canal 'Presencial' genera más ingresos. 🏬

sql
Copiar código
SELECT TOP 1 OO.Descripcion AS Canal, SUM(O.TotalCompra) AS TotalVenta
FROM Ordenes O
INNER JOIN OrigenesOrden OO ON O.OrigenID = OO.OrigenID
GROUP BY OO.Descripcion
ORDER BY TotalVenta DESC;
Productividad de los Empleados: Volumen de ventas promedio por empleado. 👥

sql
Copiar código
SELECT E.Nombre AS Empleado, CAST(AVG(TotalCompra) AS DECIMAL(10,2)) AS VolumenVentaPromedio
FROM Ordenes O
LEFT JOIN Empleados E ON O.EmpleadoID = E.EmpleadoID
GROUP BY E.Nombre
ORDER BY VolumenVentaPromedio DESC;
Análisis de Demanda por Horario y Día: Variación en la demanda de productos a lo largo del día. 🕒

sql
Copiar código
SELECT O.HorarioVenta AS Horario, P.Nombre AS Producto, SUM(DO.Cantidad) AS Demanda
FROM Ordenes O
INNER JOIN DetalleOrdenes DO ON O.OrdenID = DO.OrdenID
INNER JOIN Productos P ON DO.ProductoID = P.ProductoID
GROUP BY O.HorarioVenta, P.Nombre
ORDER BY O.HorarioVenta, Demanda DESC;
Comparación de Ventas Mensuales: No disponible para el año actual. 📅

sql
Copiar código
SELECT YEAR(FechaOrdenTomada) AS Año, MONTH(FechaOrdenTomada) AS Mes, SUM(TotalCompra) AS Venta
FROM Ordenes
WHERE YEAR(FechaOrdenTomada) >= 2023 AND YEAR(FechaOrdenTomada) <= 2024
GROUP BY YEAR(FechaOrdenTomada), MONTH(FechaOrdenTomada)
ORDER BY Venta DESC;
Análisis de Fidelidad del Cliente: Número de órdenes por cliente. 🛒

sql
Copiar código
SELECT C.Nombre, COUNT(*) AS NumeroOrdenes
FROM Ordenes O
INNER JOIN Clientes C ON O.ClienteID = C.ClienteID
GROUP BY C.Nombre
ORDER BY NumeroOrdenes DESC;
🎯 FINAL DEL PROYECTO
Este proyecto ha sido una excelente oportunidad para aplicar habilidades de análisis de datos y generar información valiosa para Woow Fastfood. ¡Gracias por seguir nuestro viaje de datos! 🚀🍔

¡No dudes en explorar los datos y aportar tus ideas para mejorar aún más la eficiencia y el rendimiento! 🌟

