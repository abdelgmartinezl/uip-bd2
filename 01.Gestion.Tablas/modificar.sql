/*
Modificación de Tablas
----------------------
Para cambiar la estructura de una tabla existete se utiliza la sentencia ALTER TABLE.
Permite agregar, eliminar, cambiar una columna, agregar una llave primaria, renombrar
una tabla y mucho más.

Sintaxis:
ALTER TABLE nombre_tabla accion1[,accion2,...]
*/

/*
----------------------------
| tarea                    |
----------------------------
| id INT     PK            |
| tema VARCHAR(45)         |
| fecha_inicio DATE        |
| fecha_final DATE         |
| descripcion VARCHAR(200) |
----------------------------
*/

CREATE TABLE IF NOT EXISTS tarea 
(
   id INT NOT NULL,
   tema VARCHAR(45) NULL,
   fecha_inicio DATE NULL,
   fecha_final DATE NULL,
   descripcion VARCHAR(200) NULL,
   PRIMARY KEY (id),
   UNIQUE INDEX tarea_id_unique (id ASC)
);

-- Establecer una secuencia para una columna
ALTER TABLE tarea
CHANGE COLUMN id id INT(11) NOT NULL AUTO_INCREMENT;

-- Agregar una nueva columna a la tabla
ALTER TABLE tarea
ADD COLUMN completado DECIMAL(2,1) NULL
AFTER descipcion;

-- Eliminar una columna de la tabla
ALTER TABLE tarea
DROP COLUMN descripcion;

-- Eliminar varias columnas de la tabla
ALTER TABLE tarea
DROP COLUMN fecha_inicio,
DROP COLUMN fecha_final;

-- Agregar varias columnas en la tabla
ALTER TABLE tarea
ADD COLUMN fecha_inicio DATE NOT NULL,
ADD COLUMN fecha_final DATE NOT NULL;

-- Renombrar una tabla
ALTER TABLE tarea
RENAME TO elementos;
