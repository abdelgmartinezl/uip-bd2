/*
Creación de Secuencias
----------------------
Es una lista de números enteros generados en forma ascendente. Son necesarias para
generar números únicos utilizados como identificadores dentro de una tabla.

Para crear una secuencia, se utiliza el atributo AUTO_INCREMENT en la columna, la
cual es usualmente la llave primaria de la tabla.

Importante:
1. Cada tabla puede tener una única columna de tipo de dato entero con AUTO_INCREMENT.
2. La columna con AUTO_INCREMENT debe tener un índice, ya sea PRIMARY KEY o UNIQUE.
3. La columna AUTO_INCREMENT debe ser NOT NULL. 

Sintaxis:
a) Creando una tabla:
CREATE TABLE nombre_tabla
(
nombre_columna tipo_dato AUTO_INCREMENT PRIMARY KEY
);

b) Modificando una tabla:
ALTER TABLE nombre_tabla
CHANGE COLUMN nombre_columna tipo_dato AUTO_INCREMENT;

Notas:
- El valor inicial de la columna AUTO_INCREMENT es 1 incrementado en 1 cuando se inserta
un valor NULL en la columna o se omite su valor en la sentencia INSERT.
- La función LAST_INSERT_ID() muestra el último valor de la secuencia insertado en la tabla.
- Si se inserta una nueva fila en la tabla y se especifica el valor de la columna con 
secuencia, entonces el gestor insertará el número de la secuencia si el número no existe
en la columna. El gestor tomará este valor como el nuevo valor de inicio de la secuencia.
Esto crea una brecha en la secuencia.
- Si se ejecuta una sentencia UPDATE a una columna AUTO_INCREMENT con un valor que ya
existe, entonces el gestor arrojará un error de duplicidad. A pesar que se pueden cambiar
los valores a uno mayor no utilizado en la secuencia, el gestor seguirá utilizando la última
secuencia insertada para la siguiente fila.
- Cuando se ejecuta una sentencia DELETE, el gestor de base de datos puede o no reiniciar la
secuencia. En caso del motor por defecto, no se reutliza las secuencias recicladas cuando se
eliminaron las filas.
*/

/*
----------------------
| empleado           |
----------------------
| id INT(11) PK      |
| nombre VARCHAR(45) |
| apellido DATE      |
----------------------
*/

-- Metodo 1: Creacion de Tabla
CREATE TABLE IF NOT EXISTS empleado 
(
   id INT(11) NOT NULL AUTO_INCREMENT,
   nombre VARCHAR(200) DEFAULT NULL,
   apellido VARCHAR(200) DEFAULT NULL,
   PRIMARY KEY (id)
);

DROP TABLE empleado;

-- Metodo 2: Alterando la Tabla
CREATE TABLE IF NOT EXISTS empleado
(
   id INT(11) NOT NULL,
   nombre VARCHAR(200) DEFAULT NULL,
   apellido VARCHAR(200) DEFAULT NULL,
   PRIMARY KEY (id)
);

ALTER TABLE empleado
CHANGE COLUMN id id(11) NOT NULL AUTO_INCREMENT;
