/*
SQL Joins
---------
Los SQL Joins son utilizados para combinar filas de dos o más tablas, basado en
campos comunes entre las tablas.

El tipo de join más común es INNER JOIN. Este tipo de join retorna todas las filas
de múltiples tablas donde la condición del join se cumpla.

FULL OUTER JOIN retorna todas las filas de la tabla de la izquierda (tabla1) y de
la tabla de la derecha (tabla2). Combiba los resultados de ambos joins, LEFT y
RIGHT.

Sintaxis:
SELECT nombre_columna, nombre_columna
FROM nombre_tabla1
RIGHT JOIN nombre_tabla2
ON nombre_tabla1.nombre_columna = nombre_tabla2.nombre_columna;

Importante: MySQL/MariaDB no soporta FULL OUTER JOIN. Lo que se puede hacer es
emularlo. Existen tres métodos posibles:
1. Dos JOIN y un UNION
2. UNION ALL y un JOIN exclusivo
3. Utilizar una tabla MUTEX
*/
