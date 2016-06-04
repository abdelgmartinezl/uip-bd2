/*
Subconsultas
------------
Una subconsulta es una instrucción SELECT anidada dentro de una instrucción
SELECT, SELECT INTO, INSERT INTO, DELETE o UPDATE o dentro de otra subconsulta.

Se pueden utilizar tres formas de sintaxis para crear una subconsulta:
1. Comparación: es un expresión y un operador de comparación que compara
   la expresión con el resultado de la subconsulta (ANY|ALL|SOME).
2. Expresión: es una expresión por la que se busca el conjunto resultante
   de la subconsulta (NOT|IN)
3. Instrucción SQL: es una instrucción SELECT, que sigue el mismo formato y
   reglas que cualquier otra instrucción SELECT. Debe ir en paréntesis.
*/

/*
-------------------------------------------------------------------------
| cliente                                                               |
-------------------------------------------------------------------------
| id | nombre  | apellido | telefono | edad | fecha_ingreso | prioridad |
-------------------------------------------------------------------------
| 1  | Ramon   | Valdes   | 211-1233 | 29   | 2011-02-15    | A         |
| 2  | Maria   | Perez    | 390-5231 | 25   | 2013-04-01    | A         |
| 3  | Ernesto | Jimenez  | 415-2345 | 22   | 2009-11-29    | M         |
| 4  | Carlos  | Aponte   | 280-3414 | 23   | 2010-12-06    | B         |
| 5  | Sandra  | Cruz     | 442-3567 | 35   | 2015-01-01    | A         |
-------------------------------------------------------------------------
*/

CREATE TABLE cliente
(
id INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
telefono VARCHAR(15) NOT NULL,
edad INT NOT NULL,
fecha_ingreso DATE NOT NULL,
prioridad VARCHAR(1) NOT NULL
);

INSERT INTO cliente
VALUES(1,'Ramon','Valdes','211-1233',29,"2011-02-15",'A'),
(2,'Maria','Perez','390-5231',29,"2013-04-01",'A'),
(3,'Ernesto','Jimenez','415-2345',29,"2009-11-29",'M'),
(4,'Carlos','Aponte','280-3414',29,"2010-12-06",'B'),
(5,'Sandra','Cruz','442-3567',29,"2015-01-01",'A');

-- Ejemplo: obtener el nombre, apellido y telefono del cliente con mayor edad
SELECT nombre, apellido, telefono
FROM cliente
WHERE edad=(SELECT MAX(EDAD) FROM CLIENTE);

-- Ejemplo: obtener los clientes que tengan distanta edad de aquellos clientes
-- que tienen un código mayor que 5
SELECT id, nombre, apellido, telefono
FROM cliente
WHERE edad<>ALL(SELECT edad FROM cliente WHERE id>5);

-- Ejemplo: seleccionar clientes cuya edad está entre el mínimo y el promedio
-- de las edades (MIN,AVG)
SELECT id, nombre, apellido, edad
FROM cliente
WHERE edad > (SELECT MIN(edad) FROM cliente)
AND edad < ()
