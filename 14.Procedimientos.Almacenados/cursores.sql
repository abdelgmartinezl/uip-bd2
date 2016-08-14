/*
Cursores
--------
Un cursor es un objeto de base de datos que apunta a las filas retornadas de una
consulta. Esto permite manipular los datos de cada fila de forma individual.
MySQL/MariaDB usa la palabra reservada CURSOR para declararlos.

Para implementar un cursor debemos tomar en consideración las cuatro (4) fases de 
su funcionamiento: declaración, apertura, lectura, cierre.

- Declaracion: Los cursores se declaran con la sentencia DECLARE. Esto se hace después
de declarar las variables. Es importante indicar que el cursor no guardará los datos
de la consulta a la cual se referencia, sino que apunta a la dirección de memoria del
primer resultado de la consulta (similar a como funciona C++). Sintaxis:
DECLARE nombre_cursor CURSOR FOR ;
- Apertura: En este punto, todavía no se ha ejecutado. Para ejecutarlo se utiliza el
comando OPEN. Sin la apartura, los resultados no pueden ser leídos por MySQL/MariaDB.
Al abrir el cursor este sitúa el puntero a la primera fila arrojada por la consulta.
Sintaxis:
OPEN nombre_cursor;
- Lectura: El comando FETCH permite a la lectura de los resultados. Esto nos permite
acceder a la primera fila generada por la consulta. Si se vuelve a usar el cursor,
apuntaría a la segunda fila y así sucesivamente. Es necesario tener variables para
almacenar temporalmente los datos de las columnas de cada fila generada por la 
consulta. Cada variable debe coincidir con el tipo de dato correspondiente.  Sintaxis:
FETCH nombre_cursor INTO variable1, variable2;
- Cierre: Cuando se leen todos los resultados del cursor, se procede a cerrar y limpiar
los espacios de memoria con el comando CLOSE. Sintaxis:
CLOSE nombre_cursor;
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
CREATE PROCEDURE mejorProducto()
   BEGIN
      DECLARE ID_ORDEN INT;
      DECLARE PRODUCTO VARCHAR(50);
      DECLARE FECHA DATETIME;

      DECLARE mejor_producto CURSOR FOR
      SELECT id, producto, fecha FROM ordenes;

      DECLARE CONTINUE HANDLER FOR NOT FOUND SET @ban = TRUE;
      
      OPEN mejor_producto;

      loop1: LOOP
      FETCH mejor_producto INTO ID_ORDEN, PRODUCTO, FECHA;

      IF @ban THEN
         LEAVE loop1;
      END IF;
      
      CLOSE mejor_producto;
   
      SELECT ID_ORDEN, PRODUCTO, FECHA;
   END $$
DELIMITER ;


   END $$
DELIMITER ;
