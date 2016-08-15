/*
Boolean Search
-----------------------
Además de la búsqueda de lenguaje naturalm existe un modo de búsqueda basado en booleanos.
En el modo booleano, el gestor busca palabras en lugar de conceptos como en la búsqueda de
lenguaje natural.

En este modo se utilizan operadores:
+  : Incluye
-  : Excluye
>  : Incluye e incrementa el ranking
<  : Incluye y decrementa el ranking
() : Agrupa en subexpresiones
~  : Niega el valor de ranking
*  : Comodín al final de la palabra
"" : Define una frase en lugar de una palabra individual
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
WHERE MATCH(contenido) AGAINST('Pokemon' IN BOOLEAN MODE);

SELECT id, titulo
FROM entradas
WHERE MATCH(contenido) AGAINST('Pokemon -Go' IN BOOLEAN MODE);

SELECT id, titulo
FROM entradas
WHERE MATCH(contenido) AGAINST('Poke*' IN BOOLEAN MODE);
