/*
HAVING
------
La cláusula HAVING fue añadido porque la palabra reservada WHERE no trabaja con
funciones de agregación. Las funciones de agregación son aquellas que realizan 
cálculos en un conjunto de valores y retorna un único valor.

Sintaxis:
SELECT nombre_columna, funcion_agregadora(nombre_columna)
FROM nombre_tabla
WHERE nombre_columna operador valor
GROUP BY nombre_columna
HAVING funcion_agregadora(nombre_columna operador valor;
*/

/*
-----------------------------------------------------------
| ordenes                                                 |
-----------------------------------------------------------
| idOrden | idCliente | idEmpleado | fechaOrden | idEnvio |
-----------------------------------------------------------
| 1       | 5         | 10         | 2016-05-12 | 3       |
| 2       | 6         | 11         | 2016-05-14 | 1       |
| 3       | 7         | 12         | 2016-05-18 | 2       |
-----------------------------------------------------------

---------------------------
| empleados               |
---------------------------
| idEmpleado | nombre     |
---------------------------
| 10         | Nancy Dull |
| 11         | Andres Lu  |
| 12         | Juana Wong |
---------------------------
*/

CREATE TABLE ordenes
(
idOrden INT AUTO_INCREMENT PRIMARY KEY,
idCliente INT NOT NULL,
idEmpleado INT NOT NULL,
fechaOrden DATE NOT NULL,
idEnvio INT NOT NULL
);

CREATE TABLE empleados
(
idEmpleado INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

INSERT INTO ordenes
VALUES(NULL,5,10,"2016-05-12",3),
(NULL,6,11,"2016-05-14",1),
(NULL,7,12,"2016-05-18",2);

INSERT INTO empleados
VALUES(10,'Nancy Dull'),
(11,'Andres Lu'),
(12,'Juana Wong');

SELECT empleados.nombre, COUNT(ordenes.idOrden) AS NumeroOrdenes
FROM (ordenes
INNER JOIN empleados
ON ordenes.idEmpleado = empleados.idEmpleado)
GROUP BY empleados.nombre
HAVING COUNT(ordenes.idOrden) > 10;

SELECT empleados.nombre, COUNT(ordenes.idOrden) AS NumeroOrdenes
FROM ordenes
INNER JOIN empleados
ON ordenes.idEmpleado = empleados.idEmpleado
WHERE nombre LIKE '%ana%'
GROUP BY nombre
HAVING COUNT(ordenes.idOrden) > 25;
