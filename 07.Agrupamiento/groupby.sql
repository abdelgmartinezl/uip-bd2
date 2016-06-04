/*
GROUP BY
--------
La sentencia GROUP BY es utilizada en conjunto con funciones agregadas para agrupar
el conjunto de resultados por una o más columnas.

Sintaxis:
SELECT nombre_columna, function_agregadora(nombre_columna)
FROM nombre_tabla
WHERE nombre_columna operador valor
GROUP BY nombre_columna;
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

-------------------------
| envios                |
-------------------------
| idEnvio | nombre      |
-------------------------
| 1       | FedEx       |
| 2       | UPS         |
| 3       | UShip       |
-------------------------

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

CREATE TABLE envios
(
idEnvio INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
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

INSERT INTO envios
VALUES(1,'FedEx'),
(2,'UPS'),
(3,'UShip');

INSERT INTO empleados
VALUES(10,'Nancy Dull'),
(11,'Andres Lu'),
(12,'Juana Wong');

SELECT en.nombre,COUNT(or.idOrden) AS NumeroOrdenes
FROM ordenes or
LEFT JOIN envios en
ON or.idEnvio = en.idEnvio
GROUP BY en.nombre;

SELECT en.nombre, em.nombre, COUNT(or.idOrden) AS NumeroOrdenes
FROM ((ordenes or
INNER JOIN envios en
ON or.idEnvio = en.idEnvio)
INNER JOIN empleados em
ON or.idEmpleado = em.idEmpleado)
GROUP BY en.nombre, em.nombre;
