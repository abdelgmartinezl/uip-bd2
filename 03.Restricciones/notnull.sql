/*
Restricción NOT NULL
--------------------
Esta restricción fuerza a una columna a no aceptar valores de tipo NULL. La columna siempre 
va a tener un valor, es decir, o se puede insertar o actualizar un registro sin agregar un
valor a esta columna.
*/

/*
-----------------------
| persona             |
-----------------------
| id INT              |
| nombre VARCHAR(255) |
| ciudad VARCHAR(255) |
-----------------------
*/

CREATE TABLE persona
(
id INT NOT NULL,
nombre VARCHAR(255) NOT NULL,
ciudad VARCHAR(255)
);
