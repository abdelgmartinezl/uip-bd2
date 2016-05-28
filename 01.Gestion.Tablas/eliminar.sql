/*
Creación de Tablas
------------------
Para eliminar una tabla existente se utiliza la sentencia DROP TABLE. Elimina
la tabla con su data, permanentemente, de la base de datos.

Sintaxis:
DROP [TEMPORARY] TABLE [IF EXISTS] nombre_tabla [, nombre_tabla] ... 

Notas:
- Se pueden eliminar varias tablas separándolas por coma (,).
- La bandera TEMPORARY permite eliminar tablas temporales únicamente. Es útil para
asegurar que no se elimine accidentalmente una tabla no temporal.
- La bandera IF EXISTS ayuda a prevenir la eliminación de una tabla no existente.
- Esta sentencia sólo elimina la tabla y su data. Sin embargo, no elimina los privilegios
específicos de usuario asociados con la tabla. Por lo tanto, si se recrea una tabla con
el mismo nombre, entonces los privilegios existentes se aplicarán a la nueva tabla, el
cual sería un riesgo de seguridad.
- Se deben tener privilegios de tipo DROP para poder hacer la operación.
*/

/*
----------------------------
| tarea                    |
----------------------------
| id INT(11) PK            |
| tema VARCHAR(45)         |
| fecha_inicio DATE        |
| fecha_final DATE         |
| descripcion VARCHAR(200) |
----------------------------
*/

CREATE TABLE IF NOT EXISTS tarea 
(
   id INT(11) NOT NULL AUTO_INCREMENT,
   tema VARCHAR(45) DEFAULT NULL,
   fecha_inicio DATE DEFAULT NULL,
   fecha_final DATE DEFAULT NULL,
   descripcion VARCHAR(200) DEFAULT NULL,
   PRIMARY KEY (id)
) ENGINE=XtraDB;
