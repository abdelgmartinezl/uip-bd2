/*
Vistas
------
Una vista es una tabla virtual basada en el conjunto resultado de una consulta SQL. Las
vistas contienen filas y columnas, como una tabla real. Los campos de una vista forman
parte de una o más tablas reales en la base de datos.

Sintaxis:
CREATE OR REPLACE VIEW nombre_vista AS
SELECT nombre_columna, nombre_columna
FROM nombre_tabla
WHERE condicion;
*/

/*
----------------------
| cliente            |
----------------------
| id INT PK          |
| nombre VARCHAR(25) |
| estado VARCHAR(2)  |
----------------------
*/

CREATE TABLE cliente
(
id INT PRIMARY KEY,
nombre VARCHAR(25),
estado VARCHAR(2)
);

CREATE VIEW cliente_si AS
SELECT id, nombre
FROM cliente
WHERE estado='SI';

SELECT * FROM cliente_si;

CREATE OR REPLACE VIEW cliente_si AS
SELECT id, nombre
FROM cliente
WHERE estado='Si';

SELECT * FROM cliente_si;

