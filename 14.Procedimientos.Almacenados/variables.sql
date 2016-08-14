/*
Variables
---------
Una variable es un objeto de datos nombrado cuyo valor puede cambiar durante la
ejecución del procedimiento almacenado. Sirven para almacenar resultados inmediatos.
La definición de estas variables son locales al procedimiento almacenado.

Las variables de sesión son aquellas que están disponibles y accesibles hasta que
se termine la sesión. Las mismas se identifican porque inician con un símbolo de
arroba (@).
*/


/*
--------------------------------------------
| ordenes                                  |
--------------------------------------------
| id | producto      | fecha               |
-------------------------------------------|
| 1  | Corona 6-pack | 2016-06-04 16:29:99 |
| 2  | Atlas botella | 2016-06-04 00:00:00 |
--------------------------------------------
*/

CREATE TABLE ordenes
(
id INT PRIMARY KEY AUTO_INCREMENT,
producto VARCHAR(50) NOT NULL,
fecha DATETIME NOT NULL DEFAULT NOW() 
);

INSERT INTO ordenes(producto)
VALUES('Corona 6-pack');

INSERT INTO ordenes(producto,fecha)
VALUES('Atlas botella',CURDATE());

DELIMITER $$
CREATE PROCEDURE ObtenerOrdenes()
   BEGIN
      DECLARE total_ordenes INT DEFAULT 0
      SELECT COUNT(*)  INTO total_ordenes FROM ordenes;
   END $$
DELIMITER ;
