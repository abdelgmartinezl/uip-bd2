/*
Creación de Tablas
------------------
Para crear una nueva tabla dentro de una base de datos, se utiliza la
sentencia CREATE TABLE.

Sintaxis:
CREATE TABLE [IF NOT EXISTS] nombre_tabla
(
nombre_columna tipo_dato[tamaño] [NOT NULL | NULL] [DEFAULT valor] [AUTO_INCREMENT]
) ENGINE=tipo_tabla;

Notas:
- El nombre de la tabla tiene que ser único dentro de la base de datos.
- La sentencia IF NOT EXISTS es opcional, permite validar que la tabla a
crear no exista previamente en la base de datos. Si no encuentra la tabla,
la crea. Si la encuentra, entonces ignora la sentencia, preveniendo 
cualquier error.
- Pueden haber varias columnas, cada definición de columna debe estar 
separada por una coma (,).
- Se puede especificar el motor de almacenamiento para la tabla en la
claúsula ENGINE. Los motores disponibles son InnoDB, MyISAM, HEAP, CSV,
EXAMPLE, ARCHIVE, MERGE FEDERATED o NDBCLUSTER.
- Si no se especifica un motor, MySQL asignará InnoDB por defecto y MariaDB
asignará XtraDB por defecto.
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
