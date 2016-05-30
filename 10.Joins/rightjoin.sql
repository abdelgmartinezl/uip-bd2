/*
SQL Joins
---------
Los SQL Joins son utilizados para combinar filas de dos o más tablas, basado en
campos comunes entre las tablas.

El tipo de join más común es INNER JOIN. Este tipo de join retorna todas las filas
de múltiples tablas donde la condición del join se cumpla.

RIGHT JOIN retorna todas las filas de la tabla de la derecha (tabla2), que las
filas que coinciden en la tabla de la izquierda (tabla1). El resultado es NULL
en el lado izquierdo cuando no hay coincidencias.

Sintaxis:
SELECT nombre_columna, nombre_columna
FROM nombre_tabla1
RIGHT JOIN nombre_tabla2
ON nombre_tabla1.nombre_columna = nombre_tabla2.nombre_columna;
*/

/*
-------------------------------
| empleados                   |
-------------------------------
| empleadoID | empleadoNombre |
-------------------------------
| 1          | Juan Perez     |
| 2          | Jose Cruz      |
| 3          | Maria Nieves   |
-------------------------------

-------------------------------------------------
| ordenes                                       |
-------------------------------------------------
| ordenID | clienteID | empleadoID | fechaOrden |
-------------------------------------------------
| 1010    | 2         | 10         | 2016-05-26 |
| 1011    | 3         | 3          | 2016-05-27 |
| 1012    | 7         | 21         | 2016-05-29 |
-------------------------------------------------
*/

CREATE TABLE empleados
(
empleadoID INT AUTO_INCREMENT PRIMARY KEY,
empleadoNombre VARCHAR(50)
);

CREATE TABLE ordenes
(
ordenID INT PRIMARY KEY,
clienteID INT NOT NULL,
empleadoID INT NOT NULL,
fechaOrden DATE NOT NULL
);

INSERT INTO empleados
VALUES (NULL,'Juan Perez'),
(NULL,'Jose Cruz'),
(NULL,'Maria Nieves');

INSERT INTO ordenes
VALUES (1010,2,10,"2016-05-26"),
(1011,3,3,"2016-05-27"),
(1012,7,21,"2016-05-29");

SELECT o.ordenID, e.empleadoNombre
FROM ordenes o
RIGHT JOIN empleados e
ON o.empleadoID = e.empleadoID
ORDER BY o.ordenID;
