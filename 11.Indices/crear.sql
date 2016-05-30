/*
Indices
-------
Un índice puede ser creado en una tabla para encontrar data más rápida y eficientemente.
Los usuarios no pueden ver los índices, ellos solamente sienten las mejoras para hacer
búsquedas y consultas.

Nota: Realizar una actualización a una tabla indexada toma más tiempo que actualizar una
tabla sin índices. Por lo tanto, se deben crear índices en columnas y tablas que son
frecuentemente consultadas.

Sintaxis:
CREATE UNIQUE INDEX nombre_indice
ON nombre_tabla (nombre_columna);
*/

/*
----------------------
| cliente            |
----------------------
| id INT PK          |
| nombre VARCHAR(50) |
----------------------
*/

CREATE TABLE cliente
(
id INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

CREATE UNIQUE INDEX nombreIndice
ON cliente(nombre);
