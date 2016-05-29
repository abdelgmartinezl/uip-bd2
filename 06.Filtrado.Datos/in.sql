/*
IN
--
El operador IN permite especificar múltiples valores en la cláusula WHERE.

Sintaxis:
SELECT nombre_columna, nombre_columna
FROM nombre_tabla
WHERE nombre_columna IN (valor1, valor2,...);
*/

/*
---------------------------------------
| visitantes                          |
---------------------------------------
| id | nombre            | pais       |
---------------------------------------
| 1  | Sherlock Holmes   | Inglaterra |
| 2  | John Watson       | Inglaterra |
| 3  | James Moriarty    | Escocia    |
| 4  | Inspector Gadget  | USA        |
---------------------------------------
*/

CREATE TABLE IF NOT EXISTS visitantes
(
   id INT NOT NULL AUTO_INCREMENT,
   nombre VARCHAR(100) NOT NULL,
   pais VARCHAR(55) NOT NULL,
   PRIMARY KEY (id)
);

INSERT INTO visitantes
VALUES (NULL,'Sherlock Holmes','Inglaterra'),
VALUES (NULL,'John Watson','Inglaterra'),
VALUES (NULL,'James Moriarty','Escocia'),
VALUES (NULL,'Inspector Gadget','USA');

SELECT nombre
FROM visitantes
WHERE pais IN ('Inglaterra','Escocia');
