/*
Tablas Temporales
-----------------
Una tabla temporal es un tipo especial de tabla que permite almacenar un conjunto de
resultado temporal, el cual puede ser reutilizado varias veces por una sesión. Una
tabla temporal es útil cuando quieres consultar datos que requieren un SELECT sencillo
con claúsulas JOIN. Usualmente se utilizan en procedimientos almacenados para almacenar
resultados inmediatos para su uso subsecuente.

Sintaxis:
# Creación
CREATE TEMPORARY TABLE nombre_tablatemporal
consulta_con_join;
# Eliminación
DROP TEMPORARY TABLE nombre_tablatemporal;

Notas:
- Una tabla temporal es creada cuando se utiliza la sentencia CREATE TEMPORARY TABLE.
- El gestor elimina la tabla temporal automáticamente cuando la sesión termina o cuando
la conexión es terminada. O bien, se puede utilizar la sentencia DROP TABLE.
- Una tabla temporal está disponible y accesible para el cliente dueño de la tabla.
- Diferentes clientes pueden crear una tabla temporal con el mismo nombre sin causar
errores porque sólo el cliente que crea la tabla temporal puede verla. Sin embargo, en una
misma sesión, dos tablas temporales no pueden tener el mismo nombre.
- Una tabla temporal puede tener el mismo nombre que una tabla existente de la base de 
datos. Ejemplo: tabla - empleado, tabla temporal - empleado. Sin embargo, cada consulta que
se haga contra empleado hará referencia a la tabla temporal y será hasta que se elimine la
tabla temporal que se podrá acceder nuevamente a la tabla regular.
*/

/*
-----------------------   -----------------  -----------------
| cliente             |   | saldo         |  | top10clientes |
-----------------------   -----------------  -----------------
| id INT PK           |   | id INT PK     |
| nombre VARCHAR(100) |   | total DECIMAL |
-----------------------   | idC iNT FK    |
                          -----------------
*/

CREATE TABLE IF NOT EXISTS cliente
(
   id INT NOT NULL AUTO_INCREMENT,
   nombre VARCHAR(100) NOT NULL,
   PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS saldo
(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   total DECIMAL NOT NULL,
   idC INT FOREIGN KEY REFERENCES cliente(id),
);

-- Creación de tabla temporal
CREATE TEMPORARY TABLE top10clientes
SELECT a.id, a.nombre, FORMAT(SUM(b.total),2) total
FROM saldo b
INNER JOIN cliente a ON a.id = b.idC
GROUP BY b.id
ORDER BY total DESC
LIMIT 10;

-- Eliminación de tabla temporal
DROP TEMPORARY TABLE top10clientes;
