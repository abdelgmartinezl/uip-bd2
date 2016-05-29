/*
SELECT DISTINCT
---------------
La sentencia SELECT DISTINCT se utiliza para retornar valores distintos
(diferentes). En una tabla, una columna puede tener valores duplicados, y
algunas veces sólo se quieren listar los valores diferentes.

Sintaxis:
SELECT DISTINCT nombre_columna, nombre_columna
FROM nombre_tabla;
*/

/*
------------------------
| puntajes            |
------------------------
| id | nombre | puntos |
------------------------
| 1  | Mario  | 999    |
| 2  | Luigi  | 975    |
| 3  | Wario  | 855    |
| 4  | Mario  | 750    |
| 5  | Bowser | 700    |
------------------------
*/

CREATE TABLE IF NOT EXISTS puntajes
(
   id INT NOT NULL AUTO_INCREMENT,
   nombre VARCHAR(100) NOT NULL,
   puntos INT NOT NULL,
   PRIMARY KEY (id)
);

INSERT INTO puntajes
VALUES (NULL,'Mario',999),
VALUES (NULL,'Luigi',975),
VALUES (NULL,'Wario',855),
VALUES (NULL,'Mario',750),
VALUES (NULL,'Bowser',700);

SELECT DISTINCT nombre
FROM puntajes;
