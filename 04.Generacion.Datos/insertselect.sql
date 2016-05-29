/*
INSERT INTO SELECT
-------------------
La sentencia INSERT INTO SELECT seleccionada data de una tabla y la
inserta en una tabla existente. Cualquier fila existente en la tabla
destino permanece intacta.

Sintaxis:
# Opcion 1
INSERT INTO nombre_tabla
SELECT * FROM otra_tabla;
# Opcion 2
INSERT INTO nombre_tabla (columna1, columna2,...)
SELECT nombre_columna(s) FROM otra_tabla;
*/

/*
-----------------------   ----------------------
| cliente             |   | proveedor          |
-----------------------   ----------------------
| id INT PK           |   | id INT PK          |
| nombre VARCHAR(100) |   | nombre VARCHAR(50) |
-----------------------   ---------------------|
*/

CREATE TABLE IF NOT EXISTS cliente
(
   id INT NOT NULL AUTO_INCREMENT,
   nombre VARCHAR(100) NOT NULL,
   PRIMARY KEY (id)
);

INSERTO INTO cliente
VALUES (NULL, 'Juana'), (NULL, 'Angel'), (NULL, 'Jose'), (NULL, 'Tomas');

CREATE TABLE IF NOT EXISTS proveedor
(
   id INT NOT NULL AUTO_INCREMENT,
   nombre VARCHAR(100) NOT NULL,
   PRIMARY KEY (id)
);

INSERT INTO proveedor (id, nombre)
SELECT id, nombre FROM cliente;

INSERT INTO proveedor (id, nombre)
SELECT id, nombre FROM cliente WHERE nombre LIKE '%se';
