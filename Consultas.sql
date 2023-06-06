USE TIENDA;
-- 1. Clientes de Madrid mostrando todos los campos.
SELECT * FROM CLIENTE WHERE CIUDAD='MADRID';
SELECT NIF, NOMBRE, DOMICILIO FROM CLIENTE WHERE CIUDAD='MADRID';
-- 2. Clientes que no son de Madrid mostrando todos los campos.
SELECT * FROM CLIENTE WHERE CIUDAD<>'MADRID';
SELECT * FROM CLIENTE WHERE NOT CIUDAD='MADRID';
SELECT * FROM CLIENTE WHERE CIUDAD!='MADRID';
-- 3. Clientes con nombre de la M a la P mostrando todos los campos.
SELECT * FROM CLIENTE WHERE NOMBRE>='M' AND NOMBRE<='Pz';
SELECT * FROM CLIENTE WHERE NOMBRE BETWEEN 'M' AND 'Pz';
-- 4. Clientes cuyo nombre empieza con la letra M mostrando todos los campos.
SELECT * FROM CLIENTE WHERE NOMBRE LIKE 'M%';
-- 5. Mostrar toda la información del producto con código BI20.
SELECT * FROM PRODUCTO WHERE CODIGO='BI20';
-- 6. Productos por reponer y el dinero que hay que invertir en reponerlo. 
	-- Mostrar código, descripción, stock, cantidad a reponer e inversión.
SELECT CODIGO, DESCRIPCION, STOCK, MINIMO, MINIMO-STOCK AS REPONER, 
	(MINIMO-STOCK)*PRECIO AS INVERSION
FROM PRODUCTO
WHERE MINIMO>STOCK;
-- 7. Todas las líneas de detalle con el total por línea. 
   -- Mostrar número de factura, código artículo, descripción artículo, 
   -- unidades vendidas, precio de venta y total.
SELECT NUMERO, DETALLE.CODIGO, DESCRIPCION, UNIDADES, DETALLE.PRECIO,
	UNIDADES*DETALLE.PRECIO AS TOTAL
 FROM DETALLE INNER JOIN PRODUCTO
 ON PRODUCTO.CODIGO = DETALLE.CODIGO;
-- 8. Ver las líneas de detalle de la factura 5001.
SELECT NUMERO, DETALLE.CODIGO, DESCRIPCION, UNIDADES, DETALLE.PRECIO,
	UNIDADES*DETALLE.PRECIO AS TOTAL
 FROM DETALLE INNER JOIN PRODUCTO
 ON PRODUCTO.CODIGO = DETALLE.CODIGO
 WHERE NUMERO = 5001;
-- 9. Ver las ventas del artículo con código BAB5.
SELECT NUMERO, DETALLE.CODIGO, DESCRIPCION, UNIDADES, DETALLE.PRECIO,
	UNIDADES*DETALLE.PRECIO AS TOTAL
 FROM DETALLE INNER JOIN PRODUCTO
 ON PRODUCTO.CODIGO = DETALLE.CODIGO
 WHERE DETALLE.CODIGO = 'BAB5';
-- 10. Realizar un listado de todas las facturas mostrando Nif y nombre del cliente, 
	-- número y fecha de la factura, subtotal, iva y total a pagar. 
SELECT FACTURA.NUMERO, CLIENTE.NIF, NOMBRE, FECHA, 
SUM(UNIDADES*PRECIO) AS SUBTOTAL, SUM(UNIDADES*PRECIO*0.21) AS IVA,
 SUM(UNIDADES*PRECIO*1.21) as TOTAL
FROM CLIENTE INNER JOIN FACTURA
ON FACTURA.NIF = CLIENTE.NIF
INNER JOIN DETALLE 
ON DETALLE.NUMERO = FACTURA.NUMERO
GROUP BY FACTURA.NUMERO;
-- 11. Sólo las facturas del cliente ROSA PEREZ DELGADO.
SELECT FACTURA.NUMERO, CLIENTE.NIF, NOMBRE, FECHA, 
SUM(UNIDADES*PRECIO) AS SUBTOTAL, SUM(UNIDADES*PRECIO*0.21) AS IVA,
 SUM(UNIDADES*PRECIO*1.21) as TOTAL
FROM CLIENTE INNER JOIN FACTURA
ON FACTURA.NIF = CLIENTE.NIF
INNER JOIN DETALLE 
ON DETALLE.NUMERO = FACTURA.NUMERO
WHERE CLIENTE.NOMBRE = 'ROSA PEREZ DELGADO'
GROUP BY FACTURA.NUMERO;
-- 12. Sólo las facturas pagadas.
SELECT * FROM FACTURA WHERE PAGADO = TRUE;
SELECT * FROM FACTURA WHERE PAGADO;
SELECT * FROM FACTURA WHERE PAGADO=1;

SELECT FACTURA.NUMERO, CLIENTE.NIF, NOMBRE, FECHA, 
SUM(UNIDADES*PRECIO) AS SUBTOTAL, SUM(UNIDADES*PRECIO*0.21) AS IVA,
 SUM(UNIDADES*PRECIO*1.21) as TOTAL
FROM CLIENTE INNER JOIN FACTURA
ON FACTURA.NIF = CLIENTE.NIF
INNER JOIN DETALLE 
ON DETALLE.NUMERO = FACTURA.NUMERO
WHERE PAGADO = TRUE
GROUP BY FACTURA.NUMERO;

-- 13. Sólo las facturas pendientes de pago.
SELECT * FROM FACTURA WHERE PAGADO = FALSE;
SELECT * FROM FACTURA WHERE NOT PAGADO;
SELECT * FROM FACTURA WHERE PAGADO=0;

SELECT FACTURA.NUMERO, CLIENTE.NIF, NOMBRE, FECHA, 
SUM(UNIDADES*PRECIO) AS SUBTOTAL, SUM(UNIDADES*PRECIO*0.21) AS IVA,
 SUM(UNIDADES*PRECIO*1.21) as TOTAL
FROM CLIENTE INNER JOIN FACTURA
ON FACTURA.NIF = CLIENTE.NIF
INNER JOIN DETALLE 
ON DETALLE.NUMERO = FACTURA.NUMERO
WHERE PAGADO = FALSE
GROUP BY FACTURA.NUMERO;