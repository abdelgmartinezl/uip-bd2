/*
Procedimientos Almacenados
--------------------------
Un procedimiento almacenado es un segmento de sentencias SQL declarativas almacenadas
en el catálogo de la base de datos. Un procedimiento almacenado puede ser invocado por
triggers, otros procedimientos almacenados y aplicaciones hechas en algún lenguaje de
programación (C, Java, Python).

Las ventajas de los procedimientos almacenados son:
- Incrementan el rendimiento de las aplicaciones. En MySQL/MariaDB, los procedimientos
almacenados son compilados bajo demanda, es decir, luego que son compilados se mantienen
en caché. Si una aplicación lo usa más de una vez para una misma conexión, la versión
compilada es utilizada.
- Ayudan a reducir el tráfico entre la aplicación y el servidor de base de datos ya que
en lugar de enviar largas consultas SQL, la aplicación sólo envía el nombre y parámetros
del procedimiento almacenado.
- Son reutilizables y transparentes para cualquier aplicación. Los procedimientos
almacenados exponen la interfaz de la base de datos a todas las aplicaciones para que los
desarrolladores no tengan que desarrollar funciones que ya están soportadas en los
procedimientos almacenados.
- Son seguros. El administrador de base de datos otorga los permisos a las aplicaciones
que deben tener acceso al procedimiento almacenado sin dar ningún permiso a las tablas
de base de datos implicadas.

Las desventajas de los procedimientos almacenados son:
- Si se utilizan muchos procedimientos almacenados, el consumo de memoria de cada
conexión incrementará. Además, si se sobre-utilizan los procedimientos almacenados, el
uso de CPU también incrementará.
- La construcción de los procedimientos almacenados es más difícil ya que implica la
lógica del negocio, que usualmente es complicada.
- Es difícil depurar procedimientos almacenados, dependiendo del gestor de base de datos.
- No es fácil desarrollar y mantener procedimientos almacenados. Se requiere de algunas
habilidades que normalmente el desarrollador de aplicaciones no posee.

Para mostrar las características de un procedimiento almacenado, se puede utilizar la
sentencia SHOW PROCEDURE STATUS:
SHOW PROCEDURE STATUS [LIKE 'patron' | WHERE expresion];

Para ver todos los procedimientos almacenados al cual tiene su usuario privilegios de
acceso, entonces se puede ejecutar la sigueinte sentencia:
SHOW PROCEDURE STATUS;

Para ver el código fuente de un procedimiento almacenado, se usa la sentencia SHOW
CREATE PROCEDURE:
SHOW CREATE PROCEDURE nombreProcedimiento;
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
      SELECT * FROM ordenes;
   END $$
DELIMITER ;

SHOW PROCEDURE STATUS;

SHOW CREATE PROCEDURE ObtenerOrdenes;
