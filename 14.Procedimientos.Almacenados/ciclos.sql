/*
Ciclos
------
MySQL provee sentencias de bucle que permiten ejecutar un bloque de código SQL de forma
repetitiva basándose en una condición. Existen tres tipos: WHILE, REPEAT y LOOP.

La sintaxis de WHILE es la siguiente:
WHILE expresion DO
   sentencias;
END WHILE

La sintaxis de REPEAT es la siguiente:
REPEAT
   sentencias;
UNTIL expresion
END REPEAT;
*/

DELIMITER $$
CREATE PROCEDURE PruebaWhile()
   BEGIN
      DECLARE num INT;
      DECLARE cad VARCHAR(255);

      SET num = 1;
      SET cad =  '';

      WHILE num <= 5 DO
         SET cad = CONCAT(cad, num, ',');
         SET num = num + 1; 
      END WHILE;

      SELECT cad;
   END $$
DELIMITER ;

CALL PruebaWhile();

DELIMITER $$
CREATE PROCEDURE PruebaRepeat()
   BEGIN
      DECLARE num INT;
      DECLARE cad VARCHAR(255);
       
      SET num = 1;
      SET cad =  '';
       
      REPEAT
         SET cad = CONCAT(cad, num, ',');
         SET num = num + 1; 
      UNTIL num > 5
      END REPEAT;

      SELECT cad;
   END $$
DELIMITER ;

CALL PruebaRepeat();

DELIMITER $$
CREATE PROCEDURE PruebaLoop()
   BEGIN
      DECLARE x  INT;
      DECLARE str  VARCHAR(255);
   
      SET x = 1;
      SET str =  '';
       
      loop_label:  LOOP
         IF  x > 10 THEN 
            LEAVE  loop_label;
         END IF;
           
         SET  x = x + 1;
         IF  (x mod 2) THEN
            ITERATE  loop_label;
         ELSE
            SET  str = CONCAT(str,x,',');
         END IF;
      END LOOP;    

      SELECT str;
   END $$
DELIMITER ;
