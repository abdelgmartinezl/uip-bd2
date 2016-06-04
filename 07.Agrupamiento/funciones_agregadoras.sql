/*
Funciones Agregadoras
---------------------
Estas funciones retornan un único valor que es calculado de múltiples valores de 
una columna. A continuación la lista de funciones:
- AVG(): Retorna el valor promedio.
  Sintaxis: SELECT AVG(nombre_columna) FROM nombre_tabla;
- COUNT(): Retorna el número de filas.
  Sintaxis: SELECT COUNT(nombre_columna) FROM nombre_tabla;      
- MAX(): Retorna el valor máximo.
  Sintaxis: SELECT MAX(nombre_columna) FROM nombre_tabla;
- MIN(): Retorna el valor mínimo.
  Sintaxis: SELECT MIN(nombre_columna) FROM nombre_tabla;
- SUM(): Retorna la suma total.
  Sintaxis: SELECT SUM(nombre_columna) FROM nombre_tabla;
*/

/*
------------------------------
| ventas                     |
------------------------------
| id | idProducto | cantidad |
------------------------------
| 1  | 11         | 6        |
| 2  | 17         | 45       |
| 3  | 20         | 12       |
| 4  | 16         | 18       |
| 5  | 29         | 7        |
------------------------------
*/

CREATE TABLE ventas
(
id INT AUTO_INCREMENT PRIMARY KEY;
idProducto INT NOT NULL,
cantidad INT NOT NULL
);

INSERT INTO ventas
VALUES(NULL,11,6),(NULL,17,45),
(NULL,20,12),(NULL,16,18),(NULL,29,7);

SELECT AVG(cantidad) AS PromedioCantidad FROM ventas;
SELECT COUNT(cantidad) AS CantidadVendida FROM ventas;
SELECT MAX(cantidad) AS MayorVentas FROM ventas;
SELECT MIN(cantidad) AS MenorVentas FROM ventas;
SELECT SUM(cantidad) AS VentasTotales FROM ventas;
