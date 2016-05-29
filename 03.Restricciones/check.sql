/*
Restricción CHECK
-----------------------
Esta restricción limita el rango del valor que puede ser ubicado en la
columna, permitiendo ciertos valores para dicha columna. En MySQL/MariaDB
esta restricción es admitida pero ignorada. La forma de implementarlo
sería a través de un trigger.

NOTA: Esta restricción no funciona en MySQL/MariaDB.
*/

/*
-----------------------
| persona             |
-----------------------
| id INT PK           |
| edad INT            |
| nombre VARCHAR(255) |
-----------------------
*/

-- Creación de CHECK al crear una tabla
CREATE TABLE persona
(
id INT NOT NULL,
edad INT,
nombre VARCHAR(255),
PRIMARY KEY (id),
CHECK (edad>=18)
);

CREATE TABLE empleado
(
id INT NOT NULL,
edad INT,
nombre VARCHAR(255),
PRIMARY KEY (id),
CONSTRAINT chk_edad CHECK (edad>=18)
);

-- Eliminación de CHECK
ALTER TABLE empleado
DROP CHECK chk_edad;

-- Modificando una tabla
ALTER TABLE empleado
ADD CONSTRAINT chk_edad
CHECK (edad>=18);
