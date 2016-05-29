/*
BETWEEN
-------
El operador BETWEEN es utilizado para seleccionar valores dentro de un rango. Los
valores pueden ser números, textos o fechas.

Sintaxis:
SELECT nombre_columna, nombre_columna
FROM nombre_tabla
WHERE nombre_columna BETWEEN valor1 AND valor2;
*/

/*
-----------------------------------
| participantes                   |
-----------------------------------
| id | nombre              | edad |
-----------------------------------
| 1  | Arya Stark          | 9    |
| 2  | Jon Snow            | 14   |
| 3  | Tommen Baratheon    | 7    |
| 4  | Daenerys Targaryen  | 13   |
-----------------------------------
*/

CREATE TABLE IF NOT EXISTS participantes
(
   id INT NOT NULL AUTO_INCREMENT,
   nombre VARCHAR(100) NOT NULL,
   edad INT NOT NULL,
   PRIMARY KEY (id)
);

INSERT INTO participantes
VALUES (NULL,'Arya Stark',9),
VALUES (NULL,'Jon Snow',14),
VALUES (NULL,'Tommen Baratheon',7),
VALUES (NULL,'Daenerys Targaryen',13);

SELECT nombre
FROM visitantes
WHERE edad BETWEEN 5 AND 10;

SELECT nombre
FROM visitantes
WHERE edad NOT BETWEEN 5 AND 10;

SELECT nombre
FROM visitantes
WHERE nombre BETWEEN 'A' AND 'M';
