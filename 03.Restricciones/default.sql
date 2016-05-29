/*
RESTRICCI�N DEFAULT
-------------------
La restricci�n es utilizada para insertar un valor por defecto en una
columna. El valor por defecto ser� a�adido en todos los registros si no
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

-- Creaci�n de DEFAULT al crear una tabla
CREATE TABLE persona
(
id INT NOT NULL,
nombre VARCHAR(255) NOT NULL,
ciudad VARCHAR(255) DEFAULT 'Panama',
PRIMARY KEY (id)
);

-- Eliminaci�n de DEFAULT
ALTER TABLE persona
ALTER ciudad DROP DEFAULT;

-- Modificando una tabla
ALTER TABLE persona
ALTER ciudad SET DEFAULT 'Panama';
