/*
UPDATE
------
La sentencia UPDATE es utilizada para actualizar registros en una tabla.

Sintaxis:
UPDATE nombre_tabla
SET nombre_columna=valor, nombre_columna=valor,...
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

UPDATE personajes
SET nombre='Janine Hawkins', edad=30
WHERE nombre='Anthea';


/* CUIDADO */
/*
Si se omite la cláusula WHERE en una sentencia de actualización, 
entonces se actualizarían todos los datos de la tabla.

Ejemplo:
UPDATE personajes
SET nombre='Janine Hawkins', edad=30;

Todos los registros tendrán nombre Janine Hawkins y edad 30.
*/
