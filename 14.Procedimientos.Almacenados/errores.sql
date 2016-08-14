/*
Manejo de Errores
-----------------
Cuando un error ocurre dentro de un procedimiento almacenado, es importante manejarlo
apropiadamente, ya sea continuando o saliendo del bloque de código en ejecución y
enviando un mensaje apropiado.

Para declarar un manejador se usa la siguiente sentencia:
DECLARE accion HANDLER FOR valor_condicion sentencia;

Si la condición cuple con 'valor_condición', MySQL ejecutará la 'sentencia' y continuará
o saldrá del bloque de código basada en la 'accion'. La 'accion'puede aceptar cualquiera
de los siguientes valores:
- CONTINUE: la ejecución en el bloque continúa.
- EXIT:  la ejecución en el bloque termina.
*/

CREATE TABLE articulos_etiquetas(
    articulos INT,
    etiquetas INT,
    PRIMARY KEY(articulos,etiquetas)
);

DELIMITER $$
CREATE PROCEDURE InsertarArticulosEtiquetas(IN articulo INT, IN etiqueta INT)
   BEGIN
      DECLARE CONTINUE HANDLER FOR 1062
      SELECT CONCAT('Valores duplicados (',articulos,',',etiquetas,') encontrado') AS msg;
      INSERT INTO articulos_etiquetas(articulos,etiquetas)
      VALUES(articulo,etiqueta);
      SELECT COUNT(*) FROM articlulos_etiquetas;
   END $$
DELIMITER ;
