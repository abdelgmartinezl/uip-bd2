/*
UNION
-----
El operador UNION combina el resultado de dos o más sentencias SELECT.

El operador UNION, por defecto, selecciona únicamente los valores distintos. Para
permitir valores duplicados, se debe utilizar la palabra reservada ALL con UNION.

Sintaxis:
-- UNION
SELECT nombre_columna, nombre_columna FROM nombre_tabla1
UNION
SELECT nombre_columna, nombre_columna FROM nombre_tabla2;
-- UNION ALL
SELECT nombre_columna, nombre_columna FROM nombre_tabla1
UNION ALL
SELECT nombre_columna, nombre_columna from nombre_tabla2;
*/

/*
---------------------------------------------
| clientes                                  |
---------------------------------------------
| clienteID  | clienteNombre   | pais       |
---------------------------------------------
| 1          | Ana Cortez      | Panama     |
| 2          | Carlos Martinez | Panama     |
| 3          | Jose Espinoza   | Costa Rica |
---------------------------------------------

---------------------------------------------
| proveedores                               |
---------------------------------------------
| proveedorID | proveedorNombre | pais      |
---------------------------------------------
| 1           | ABC             | China     |
| 2           | Tentempie       | Panama    |
| 3           | Textilindo      | Nicaragua |
---------------------------------------------
*/

CREATE TABLE clientes
(
clienteID INT AUTO_INCREMENT PRIMARY KEY,
clienteNombre VARCHAR(50),
pais VARCHAR(50)
);

CREATE TABLE proveedores
(
proveedorID INT PRIMARY KEY,
proveedorNombre VARACHAR(75)
pais VARCHAR(50)
);

INSERT INTO clientes 
VALUES (NULL,'Ana Cortez','Panama'),
(NULL,'Carlos Martinez','Panama'),
(NULL,'Jose Espinoza','Costa Rica');

INSERT INTO proveedores
VALUES (NULL,'ABC','China'),
(NULL,'Tentempie','Panama'),
(NULL,'Textilindo','Nicaragua');

SELECT pais FROM clientes
UNION
SELECT pais FROM proveedores
ORDER BY pais;

SELECT pais FROM clientes
UNION ALL
SELECT pais FROM proveedores
ORDER BY pais;

SELECT pais FROM clientes
WHERE clienteNombre LIKE 'A%'
UNION ALL
SELECT pais FROM proveedores
WHERE proveedorNombre LIKE 'A%';
