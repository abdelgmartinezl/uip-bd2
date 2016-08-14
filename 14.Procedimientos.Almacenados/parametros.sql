/*
Parmáetros
----------
Los parámetros hacen que los procedimientos almacenados sean más flexibles y útiles.
En MySQL/MariaDB existen tres modos: IN, OUT, INOUT:
- IN: Es el modo por defecto. Cuando se define un parámetro IN en un procedimiento
almacenado, el programa que lo llama debe pasar un argumento al procedimiento almacenado.
Además, el valor del parámetro IN está protegido, es decir, que aunque se modifique el
valor de IN en el procedimiento almacenado, su valor original será retenido una vez se
termine la ejecución del procedimiento almacenado.
- OUT: El valor del parámetro OUT puede cambiar dentro del procedimiento almacenado y su
nuevo valor es pasado de vuelta al programa que lo llama.
- INOUT: Es un parámetro combinado de IN y OUT. Significa que el programa que llama pasa
el argumento y el procedimiento almacenado puede modificar el valor y pasarlo de vuelta
al programa que lo llama.
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
CREATE PROCEDURE ObtenerOrdenesPorProducto
(IN nombreProducto VARCHAR(50))
   BEGIN
      SELECT * FROM ordenes WHERE producto = nombreProducto;
   END $$
DELIMITER ;

CALL ObtenerOrdenesPorProducto('Atlas botella');

DELIMITER $$
CREATE PROCEDURE ContarOrdenesPorProducto
(IN nombreProducto VARCHAR(50),
OUT total INT)
   BEGIN
      SELECT COUNT(*) INTO total FROM ordenes WHERE producto = nomberProducto;
   END $$
DELIMITER ;

CALL ContarOrdenesPorProducto('Atlas botella', @total);
SELECT @total;

DELIMITER $$
CREATE PROCEDURE contador
(INOUT conteo INT,
IN incremento INT)
   BEGIN
      SET conteo = conteo + increment;
   END $$
DELIMITER ;

SET @cuenta = 1;
CALL contador(@cuenta,1); -- 2
CALL contador(@cuenta,2); -- 4
CALL contador(@cuenta,3); -- 7
SELECT @cuenta;
