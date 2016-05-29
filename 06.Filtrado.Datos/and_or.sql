/*
AND & OR
--------
Los operadores AND y OR son utlizados para filtrar registros basados
en más de una condición. El operador AND muestra un registro si la
primera condición y la segunda condición son verdaderas. El operador
OR muestra un registro si la primera condición o la segunda condición
es verdadera.

Sintaxis:
-- AND
SELECT nombre_columna, nombre_columna
FROM nombre_tabla
WHERE nombre_columna operador valor
AND nombre_columna operador valor;
-- OR
SELECT nombre_columna, nombre_columna
FROM nombre_tabla
WHERE nombre_columna operador valor
OR nombre_columna operador valor;
*/

/*
---------------------------------
| personajes                    |
---------------------------------
| id | nombre            | edad |
---------------------------------
| 1  | Sherlock Holmes   | 35   |
| 2  | John Watson       | 30   |
| 3  | James Moriarty    | 42   |
| 4  | Mycroft Holmes    | 56   |
| 5  | Irene Adler       | 27   |
| 6  | Mary Morstan      | 30   |
| 7  | Philip Andersen   | 29   |
| 8  | Charles Magnussen | 24   |
| 9  | Greg Lestrade     | 40   |
| 10 | Anthea            | 30   |
---------------------------------
*/

CREATE TABLE IF NOT EXISTS personajes
(
   id INT NOT NULL AUTO_INCREMENT,
   nombre VARCHAR(100) NOT NULL,
   edad INT NOT NULL,
   PRIMARY KEY (id)
);

INSERT INTO personaje
VALUES (NULL,'Sherlock Holmes',35),
VALUES (NULL,'John Watson',30),
VALUES (NULL,'James Moriarty',42),
VALUES (NULL,'Mycroft Holmes',56),
VALUES (NULL,'Irene Adler',27),
VALUES (NULL,'Mary Morstan',30),
VALUES (NULL,'Philip Andersen',29),
VALUES (NULL,'Charles Magnussen',24),
VALUES (NULL,'Greg Lestrade',40),
VALUES (NULL,'Anthea',30);

SELECT *
FROM personajes
WHERE edad > 25 AND edad < 30;

SELECT nombre
FROM personajes
WHERE edad >= 30 OR nombre LIKE '%Holmes%';
