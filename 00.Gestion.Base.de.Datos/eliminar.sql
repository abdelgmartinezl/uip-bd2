/*
Eliminación de Base de Datos
----------------------------
Eliminar una base de datos implica borrar la base de datos físicamente.
Toda la data y objectos asociados a la base de datos serán borrados de
forma permanente y no puede ser revertido. Por lo tanto, es importante
ejecutar esta sentencia con mucho cuidado.

Sintaxis:
DROP DATABASE [IF NOT EXISTS] nombre_basedatos;

Notas:
- La claúsula IF NOT EXISTS es opcional dentro de la sentencia. Lo
que previene es de obtener un error cuando se borra una base de datos
que ya no existe en el servidor de base de datos.
*/

DROP DATABASE ejemplo;
