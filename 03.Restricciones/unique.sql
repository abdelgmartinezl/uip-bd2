/*
Restricción UNIQUE
------------------
Esta restricción identifica un registro único en una tabla de base de datos. Además,
garantiza el nivel único de una columna o conjunto de columnas. Una llave primaria
automáticamente tiene una restricción UNIQUE definida. Se pueden tener varias restricciones
UNIQUE por tabla, pero sólo una restricción PRIMARY KEY por tabla.
*/

/*
-----------------------
| persona             |
-----------------------
| id INT              |
| nombre VARCHAR(255) |
| ciudad VARCHAR(255) |
-----------------------
*/

-- Creación de UNIQUE al crear una tabla
CREATE TABLE persona
(
id INT NOT NULL,
nombre VARCHAR(255) NOT NULL,
ciudad VARCHAR(255),
UNIQUE (id)
);

-- Eliminación de UNIQUE
ALTER TABLE persona
DROP INDEX uk_persona

-- Modificando una tabla
ALTER TABLE persona
ADD UNIQUE(id);

-- Modificando una tabla
ALTER TABLE persona
ADD CONSTRAINT uk_persona UNIQUE (id,nombre)
