/*
Índice FULLTEXT
---------------
MySQL/MariaDB soporta la búsqueda de texto usando la cláusula LIKE y expresiones
regulares. Sin embargo, cuando la columna de texto es muy grande y el número de filas
ha incrementado, usar estos métodos limita el rendimiento, la flexibilidad y el nivel
de relevancia.

Debido a estas limitaciones, existe una funcionalidad llamada full-text search. Consiste
en un índice que permiten búsquedas completas en dicha columna. El gestor usa un algoritmo
sofisticado para determinar las filas que cumplan la condición de la consulta.

No todos los motores de almacenamiento soportan esta característica.
*/

CREATE TABLE entradas (
id INT NOT NULL AUTO_INCREMENT,
titulo VARCHAR(255) NOT NULL,
contenido TEXT,
PRIMARY KEY (id),
FULLTEXT KEY contenido (contenido)
);

DROP TABLE entradas;

CREATE TABLE entradas (
id INT NOT NULL AUTO_INCREMENT,
titulo VARCHAR(255) NOT NULL,
contenido TEXT,
PRIMARY KEY (id)
);

-- Opcion 1
ALTER TABLE entradas ADD FULLTEXT(contenido);
-- Opcion 2
CREATE FULLTEXT INDEX contenido ON entradas(contenido);

ALTER TABLE entradas DROP INDEX contenido;
