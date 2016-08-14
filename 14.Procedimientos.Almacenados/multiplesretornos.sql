/*
Múltiples Retornos
------------------
Para poder retornar múltiples valores de un procedimiento almacenado, se necesitan
varios parámetros INOUT o OUT.
*/


/*
-----------------------------------------------------
| ordenes                                            |
------------------------------------------------------
| id | producto       | estado | fecha               |
-----------------------------------------------------|
| 1  | Dell Precision | Nuevo  | 2016-06-04 16:29:99 |
| 2  | Macbook Pro    | Usado  | 2016-06-04 00:00:00 |
| 3  | Dell Inspiron  | Usado  | 2016-06-04 00:00:00 |
------------------------------------------------------
*/

CREATE TABLE ordenes
(
id INT PRIMARY KEY AUTO_INCREMENT,
producto VARCHAR(50) NOT NULL,
estado VARCHAR(15) NOT NULL DEFAULT 'Nuevo',
fecha DATETIME NOT NULL DEFAULT NOW()
);

INSERT INTO ordenes(producto)
VALUES('Dell Precision');

INSERT INTO ordenes(producto,estado)
VALUES('Macbook Pro', 'Usado');

INSERT INTO ordenes(producto,estado)
VALUES('Dell Inspiron', 'Usado');

DELIMITER $$
CREATE PROCEDURE ObtenerEstados
(OUT nuevos INT,
OUT usados INT)
   BEGIN
      -- Nuevos
      SELECT COUNT(*) INTO nuevos FROM ordenes WHERE estado = 'Nuevo';
      -- Usados
      SELECT COUNT(*) INTO usados FROM ordenes WHERE estado = 'Usado';
   END $$
DELIMITER ;

CALL ObtenerEstados(@nuevos,@usados);
SELECT @nuevos,@usados;
