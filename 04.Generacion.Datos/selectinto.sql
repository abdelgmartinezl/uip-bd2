/*
SELECT INTO
-----------
La sentencia SELECT INTO permite copiar información de una tabla en otra.

Sintaxis:
-- Opcion 1
SELECT *
INTO tabla_nueva [IN basedatos_externa]
FROM tabla_vieja;
-- Opcion 2
SELECT nombre_columna(s)
INTO tabla_nueva [IN basedatos_externa]
FROM tabla_vieja;
*/

/*
-----------------------   -----------------------
| cliente             |   | cliente_backup      |
-----------------------   -----------------------
| id INT PK           |   | id INT PK           |
| nombre VARCHAR(100) |   | nombre VARCHAR(100) |
-----------------------   ----------------------|
*/

CREATE TABLE IF NOT EXISTS cliente
(
   id INT NOT NULL AUTO_INCREMENT,
   nombre VARCHAR(100) NOT NULL,
   PRIMARY KEY (id)
);

INSERTO INTO cliente
VALUES (NULL, 'Juana'), (NULL, 'Angel'), (NULL, 'Juan'), (NULL, 'Tomas');

CREATE TABLE IF NOT EXISTS cliente_backup
(
   id INT NOT NULL AUTO_INCREMENT,
   nombre VARCHAR(100) NOT NULL,
   PRIMARY KEY (id)
);

SELECT *
INTO cliente_backup
FROM cliente;

SELECT id, nombre
INTO cliente_backup
FROM cliente
WHERE nombre LIKE '%Ju%';
