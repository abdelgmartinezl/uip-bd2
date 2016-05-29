/*
Restricción FOREIGN KEY
-----------------------
Una llave foráneaen una tabla apunta a una llave primaria de otra tabla.Es
utilizado para prevenir acciones que puedan destruir enlaces entre tablas.
También previene que data inválida sea insertada en la columna de llave
foránea, porque debe tener un valor contenido en la tabla cual apunta.
*/

/*
-----------------------       ----------------------------
| persona             |       | orden                    |
-----------------------       ----------------------------
| id INT PK           | <-.   | id INT PK                |
| nombre VARCHAR(255) |   |   | descripcion VARCHAR(255) |
| ciudad VARCHAR(255) |   `-> | id_persona INT FK        |
-----------------------       ----------------------------
*/

-- Creación de FOREIGN KEY al crear una tabla
CREATE TABLE persona
(
id INT NOT NULL,
nombre VARCHAR(255) NOT NULL,
ciudad VARCHAR(255),
PRIMARY KEY (id)
);

CREATE TABLE orden 
(
id INT NOT NULL,
descripcion VARCHAR(255) NOT NULL,
id INT,
CONSTRAINT pk_orden PRIMARY KEY (id,nombre),
CONSTRAINT fk_orden_persona FOREIGN KEY (id_persona) 
REFERENCES persona(id)
);

-- Eliminación de FOREIGN KEY
ALTER TABLE orden
DROP FOREIGN KEY fk_orden_persona;

-- Modificando una tabla
ALTER TABLE orden
ADD CONSTRAINT fk_orden_persona
FOREIGN KEY (id_persona)
REFERENCES persona(id);
