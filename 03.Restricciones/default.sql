/*
RESTRICCIÓN DEFAULT
-------------------
La restricción es utilizada para insertar un valor por defecto en una
columna. El valor por defecto será añadido en todos los registros si no
se indica otro valor.
*/

/*
-----------------------
| persona             |
----------------------- 
| id INT PK           |
| nombre VARCHAR(255) |
| ciudad VARCHAR(255) |
-----------------------
*/

-- Creación de DEFAULT al crear una tabla
CREATE TABLE persona
(
id INT NOT NULL,
nombre VARCHAR(255) NOT NULL,
ciudad VARCHAR(255) DEFAULT 'Panama',
PRIMARY KEY (id)
);

-- Eliminación de DEFAULT
ALTER TABLE persona
ALTER ciudad DROP DEFAULT;

-- Modificando una tabla
ALTER TABLE persona
ALTER ciudad SET DEFAULT 'Panama';
