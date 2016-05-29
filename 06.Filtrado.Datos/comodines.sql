/*
Comodines
---------
Un caracter de comodín puede ser utilizado para sustituir por otro
caracter(es) en una cadena. Los comodines SQL son utilizados para
buscar data dentro de una tabla.

Sintaxis:
SELECT nombre_columna, nombre_columna
FROM nombre_tabla
WHERE nombre_columna LIKE comodin;

----------------------------------------------------------------------------------
| Lista de Comodines                                                             |
----------------------------------------------------------------------------------
| Comodín      | Descripción                                                     |
----------------------------------------------------------------------------------
| %            | Un sustituto por cero o más caracteres                          |
| _            | Un sustituto por una caracter                                   |
| [listachar]  | Conjunto y rango de caracteres a coincidir                      |
| [^listachar] | Coincide un único caracter no especificado dentro de las llaves |
----------------------------------------------------------------------------------
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

SELECT nombre
FROM personajes
WHERE nombre LIKE '%Holmes';

SELECT nombre
FROM personajes
WHERE nombre LIKE '%es%';

SELECT nombre
FROM personajes
WHERE nombre LIKE '_rene%';

SELECT nombre
FROM personajes
WHERE nombre LIKE '%M_riart_';

SELECT nombre
FROM personajes
WHERE nombre LIKE '[JS]%';

SELECT nombre
FROM personajes
WHERE nombre lIKE '[A-W]%';

SELECT nombre
FROM personajes
WHERE nombre NOT LIKE '[JS]%';
