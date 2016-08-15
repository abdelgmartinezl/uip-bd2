/*
Natural Language Search
-----------------------
En búsquedas de lenguaje natural, el gestor busca por filas o documentos que son
relevantes para consultas de lenguaje natural.

La relevancia es un número flotante positivo. Cuando la relevancia es cero, entonces no
hay similitud. La relevancia se calcula basándose en factores como el número de palabras
en el registro, el número de palabras únicas en el registro, el total de palabras en la
colección y el número de filas que contiene una palabra en particular.

Para efectuar la búsqueda, se utilizan las funciones MATCH() y AGAINST(). La primera
especifica la columna a buscar y la segunda determina la expresión de búsqueda.
*/

CREATE TABLE entradas (
id INT NOT NULL AUTO_INCREMENT,
titulo VARCHAR(255) NOT NULL,
contenido TEXT,
PRIMARY KEY (id),
FULLTEXT KEY contenido (contenido)
);

SELECT id, titulo
FROM entradas
WHERE MATCH(contenido) AGAINST('Pokemon Go');

SELECT id, titulo
FROM entradas
WHERE MATCH(contenido) AGAINST('Pokemon, Pikachu' IN NATURAL LANGUAGE MODE);


