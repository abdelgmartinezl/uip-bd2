/*
Funciones Escalares
-------------------
Estas funcionesn retornan un único valor, dependiendo del valor de entrada. A 
continuación la lista de funciones:
- UPPER(): Convierte el campo a mayúsculas.
- LOWER(): Convierte el campo a minúsuclas.
- MID(): Extra caracteres del campo de texto.
- LEN(): Retorna el largo de un campo de texto.
- FLOOR(): Redondea un valor numérico a un entero.
- ROUND(): Redondea un valor numérico a decimales específicos.
- CONCAT(): Concatena cadenas de texto.
*/

/*
-----------------------------------------------------
| ventas                                            |
-----------------------------------------------------
| id | idProducto | cantidad | descripcion          |
-----------------------------------------------------
| 1  | 11         | 6        | Venta sencilla       |
| 2  | 17         | 45       | Cliente complicado   |
| 3  | 20         | 12       | Pendiente pago       |
| 4  | 16         | 18       | Cliente insatisfecho |
| 5  | 29         | 7        | Venta sencilla       |
-----------------------------------------------------
*/

CREATE TABLE ventas
(
id INT AUTO_INCREMENT PRIMARY KEY;
idProducto INT NOT NULL,
cantidad INT NOT NULL,
descripcion VARCHAR(150) NOT NULL
);

INSERT INTO ventas
VALUES(NULL,11,6,'Venta sencilla'),(NULL,17,45,'Cliente complicado'),
(NULL,20,12,'Pendiente pago'),(NULL,16,18,'Cliente insatisfecho'),
(NULL,29,7,'Venta sencilla');

SELECT UPPER(descripcion) FROM ventas;
SELECT LOWER(descripcion) FROM ventas;
SELECT MID(descripcion,1,5) FROM ventas;
SELECT LEN(descripcion) FROM ventas;
SELECT ROUND(AVG(cantidad)) FROM ventas;
SELECT CONCAT('Producto No.',idProducto,' en la venta ',id,'.');
