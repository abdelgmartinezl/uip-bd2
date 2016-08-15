/*
Triggers
--------
Para eliminar un trigger existente, la sentencia a utilizar es:
DROP TRIGGER nombre_trigger;

Para modificar un trigger existente, primero se tiene que eliminar y luego recrearlo
con el nuevo código. No existe una sentencia ALTER TRIGGER.
*/

DROP TRIGGER before_update_ordenes;
