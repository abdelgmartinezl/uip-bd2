/*
SQL Joins
---------
Los SQL Joins son utilizados para combinar filas de dos o más tablas, basado en
campos comunes entre las tablas.

El tipo de join más común es INNER JOIN. Este tipo de join retorna todas las filas
de múltiples tablas donde la condición del join se cumpla.

INNER JOIN selecciona todas las filas de ambas tablas siempre y cuando exista una
coincidencia entre las columnas. Si hay filas en la tabla1 que no tengan coincidencia
en la tabla2, entonces esos valores no serán listados.

Sintaxis:
SELECT nombre_columna, nombre_columna
FROM nombre_tabla1
INNER JOIN nombre_tabla2
ON nombre_tabla1.nombre_columna = nombre_tabla2.nombre_columna;
*/

/*
--------------------------------------------------------
| clientes                                             |
--------------------------------------------------------
| clienteID | clienteNombre  | contactoNombre | pais   |
-------------------------------------------------------|
| 1         | Alfredo Perez  | Maria Cruz     | Panama |
| 2         | Diana Ruiz     | Carlos Miranda | Canada |
| 3         | Antonio Moreno | Ana Moreno     | Panama |
--------------------------------------------------------

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

CREATE TABLE clientes
(
clienteID INT AUTO_INCREMENT PRIMARY KEY,
clienteNombre VARCHAR(50),
contactoNombre VARCHAR(50),
pais VARCHAR(50)
);

CREATE TABLE ordenes
(
ordenID INT PRIMARY KEY,
clienteID INT NOT NULL,
empleadoID INT NOT NULL,
fechaOrden DATE NOT NULL
);

INSERT INTO clientes
VALUES (NULL,'Alfredo Perez','Maria Cruz','Panama'),
(NULL,'Diana Ruiz','Carlos Miranda','Canada'),
(NULL,'Antonio Moreno','Ana Moreno','Panama');

INSERT INTO ordenes
VALUES (1010,2,10,"2016-05-26"),
(1011,3,3,"2016-05-27"),
(1012,7,21,"2016-05-29");

SELECT c.clienteNombre, o.ordenID
FROM clientes c
INNER JOIN ordenes o
ON c.clienteID = o.clienteID
ORDER BY c.clienteNombre;
