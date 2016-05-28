/*
Renombrar de Tablas
----------------------
Si por algún requerimiento de negocio debemos cambiar el nombre de la tabla, podemos
utilizar la sentencia RENAME TABLE.

Sintaxis:
RENAME TABLE nombre_viejo TO nombre_nuevo;

Notas:
- La tabla vieja debe existir y la tabla nueva no debe existir.
- Si existe una tabla con el nombre nuevo antes de hacer el renombre, entonces el gestor
arrojará un error.
- La sentencia también funciona para renombrar vistas.
- No deben existir transacciones activas o tablas bloqueadas.
- En términos de seguridad, todos los privilegios otorgados a la tabla vieja deben ser
otorgados manualmente a la tabla nueva.
- Finalmente, deben ajustarse las vistas, procedimientos almacenados, triggers, referencias
a llaves foráneas y código de la aplicación que haga referencia a la tabla.
*/

/*
----------------------------		   ----------------------------
| empleado                 |		   | empleado                 |
----------------------------		   ----------------------------
| id INT     PK            |		   | id INT     PK            |
| nombre VARCHAR(20)       |   --------->  | nombre VARCHAR(20)       |  
| apellido VARCHAR(20)     | 		   | apellido VARCHAR(20)     |
----------------------------               ----------------------------
*/

CREATE TABLE IF NOT EXISTS empleado
(
   id INT NOT NULL,
   nombre VARCHAR(20) NULL,
   apellido VARCHAR(20) NULL,
   PRIMARY KEY (id),
);

-- Asumiendo que no hay ninguna restricción
RENAME TABLE empleado TO elementos;
