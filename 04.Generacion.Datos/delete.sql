/*
DELETE
------
La sentencia DELETE es utilizada para eliminar registros en una tabla.

Sintaxis:
DELETE FROM nombre_tabla
WHERE nombre_columna=valor;
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

INSERT INTO personajes
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

DELETE FROM personajes
WHERE id>5;

/* CUIDADO */
/*
Si se omite la cláusula WHERE se pueden eliminar todas las filas de la tabla, sin eliminar la tabla. Esto significa que la estructura, atributos e índices de la tabla están intactos.

Ejemplo:
DELETE FROM personajes;
*/
