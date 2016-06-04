/*
Valores Nulos
-------------
Los valores NULL representan data desconocida faltante. Por defecto, una
columna de una tabla puede tener valores NULL. Estos valores se tratan de
forma distinta a los otros valores.

Nota: No es posible comparar un valor NULL con 0, o con ''. No son equivalentes.
*/

/*
---------------------------------------
| personas                            |
---------------------------------------
| id | nombre | apellido | direccion  |
---------------------------------------
| 1  | Juan   | Perez    |            |
| 2  | Ana    | Cortez   | PH Obarrio |
| 3  | Karla  | Pinillo  |            |
---------------------------------------
*/

CREATE TABLE personas
(
id INT PRIMARY KEY,
nombre VARCHAR(50),
apellido VARCHAR(50),
direccion VARCHAR(50) NULL
);

INSERT INTO personas
VALUES(1,'Juan','Perez'),
(2,'Ana','Cortez','PH Obarrio'),
(3,'Karla','Pinillo');

SELECT apellido, nombre, direccion
FROM personas
WHERE direccion IS NULL;

SELECT apellido, nombre, direccion
FROM personas
WHERE direccion IS NOT NULL;

SELECT nombre, apellido, IFNULL(direccion,'Sin definir')
FROM personas;
