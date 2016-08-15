/*
Triggers
--------
Un trigger es un conjunto de sentencias SQL almacenadas en un catálogo de base de
datos. Éste se ejecuta cuando un evento asociado a una tabla ocurre, ejemplo: un
INSERT, UPDATE o DELETE.

Un trigger es un tipo especial de procedimiento almacenado. Su diferencia principal
es que el trigger es automáticamente llamado cuando ocurra un evento de modificación
de datos contra la tabla, mientras que el procedimiento almacenado debe ser llamado
explícitamente.

Las ventajas de los triggers son:
- Proveen una alternativa para validar la integridad de la data.
- Capturan errores de lógica de negocio en la capa de base de datos.
- Proveen una alternativa para ejecutar tareas programadas.
- Son útiles para guardar auditoría de los cambios de datos en las tablas.

Las desventajas de los triggers son:
- Proveen una validación extendida y no pueden reemplazar todas las validaciones.
- Son invocados de forma invisible en las aplicaciones de los clientes.
- Pueden incrementar el overhead del servidor de base de datos.

Los triggers pueden ser invocados antes o después que la data fue modificada por una
sentencia INSERT, UPDATE, DELETE. Las seis (6) posibles combinaciones son:
- BEFORE INSERT
- AFTER INSERT
- BEFORE UPDATE
- AFTER UPDATE
- BEFORE DELETE 
- AFTER DELETE

Los triggers en MySQL/MariaDB no pueden hacer lo siguiente:
- Usar las sentencias SHOW, LOAD DATA, LOAD TABLE, BACKUP DATABASE, RESTORE, FLUSH 
y RETURN.
- Usar las sentencias COMMIT o ROLLBACK explícitamente o implícitamente.
- Usar sentencias de preparación PREPARE, EXECUTE.
- Usar sentencias SQL dinámicas.
*/
