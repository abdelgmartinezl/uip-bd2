/*
Triggers
--------
Para crear un nuevo trigger, se puede usar la sentencia CREATE TRIGGER. La siguiente
ilustra la sintaxis:
CREATE TRIGGER nombre_trigger momento evento
ON nombre_tabla
FOR EACH ROW
BEGIN
...
END;

Para ver los triggers de la base de datos, se usa la siguiente sentencia:
SHOW TRIGGERS;
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

--------------------------------------------
| ordenes_audit                            |
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

CREATE TABLE ordenes_audit
(
id INT PRIMARY KEY AUTO_INCREMENT,
producto VARCHAR(50) NOT NULL,
fecha DATETIME NOT NULL
);

DELIMITER $$
CREATE TRIGGER before_update_ordenes
   BEFORE UPDATE ON ordenes
   FOR EACH ROW
BEGIN
   INSERT INTO ordenes_audit
   SET producto = OLD.producto,
      fecha = OLD.fecha;
END $$
DELIMITER ;

SHOW TRIGGERS;
