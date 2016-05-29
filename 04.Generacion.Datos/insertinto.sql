/*
INSERT INTO
-----------
La sentencia INSERT INTO es utilizada para ingresar nuevos registros en una
tabla.

Sintaxis:
# Opcion 1
INSERT INTO nombre_table
VALUES (valor1,valor2,...);
# Opcion 2
INSERT INTO nombre_table (columna1, columna2,...)
VALUES (valor1,valor2,...);
# Opcion 3
INSERT INTO nombre_table
VALUES (valor1,valor2,...),
(valor1,valor2,...);
*/

/*
-----------------------   ----------------------
| cliente             |   | empresa            |
-----------------------   ----------------------
| id INT PK           |   | nombre VARCHAR(50) |
| nombre VARCHAR(100) |   | ciudad VARCHAR(50) |
-----------------------   ---------------------|
*/

CREATE TABLE IF NOT EXISTS cliente
(
   id INT NOT NULL AUTO_INCREMENT,
   nombre VARCHAR(100) NOT NULL,
   PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS empresa
(
   nombre VARCHAR(50) NOT NULL,
   ciudad VARCHAR(50) NOT NULL
);

INSERT INTO cliente
VALUES (NULL,'Analida');

INSERT INTO empresa
VALUES ('ABC', 'Panama');

INSERT INTO cliente (nombre)
VALUES ('Carlos');

INSERTO INTO empresa
VALUES ('EFG', 'Italia'),
('HIJ', 'Panama');
