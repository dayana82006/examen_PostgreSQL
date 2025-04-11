--CONSULTAS

 --Listar los productos con stock menor a 5 unidades.
SELECT id,nombre, stock
FROM producto
WHERE stock < 5;

 --Calcular ventas totales de un mes específico.
SELECT SUM(precio_total) AS total_ventas_febrero
FROM venta
WHERE fecha BETWEEN '2025-02-01' AND '2025-02-28';

 --Obtener el cliente con más compras realizadas.
SELECT c.id, c.nombre, COUNT(cv.venta_id) AS compras_realizadas
FROM cliente c
JOIN cliente_venta cv ON c.id = cv.cliente_id
GROUP BY c.id
ORDER BY compras_realizadas DESC
LIMIT 1;
 --Listar los 5 productos más vendidos.
SELECT p.id, p.nombre, COUNT(v.id) AS total_vendido
FROM producto p
JOIN venta v ON p.id = v.producto_id
GROUP BY p.id
ORDER BY total_vendido DESC
LIMIT 5;
 --Consultar ventas realizadas en un rango de fechas de tres Días y un Mes.
SELECT *
FROM venta
WHERE fecha BETWEEN '2025-03-05' AND '2025-03-08';

 --Identificar clientes que no han comprado en los últimos 6 meses.
SELECT c.id, c.nombre
FROM cliente c
WHERE c.id NOT IN (
    SELECT DISTINCT cv.cliente_id
    FROM cliente_venta cv
    JOIN venta v ON cv.venta_id = v.id
    WHERE v.fecha >= CURRENT_DATE - INTERVAL '6 months'
);