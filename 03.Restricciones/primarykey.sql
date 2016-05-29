/*
Restricci贸n PRIMARY KEY
-----------------------
Esta restricci贸n identificacada registro 胣ico en una tabla de la base de
datos. Las llaves primarias contienen valores UNIQUE y no pueden contener
valores NULL. Muchas tablas deben tener una llave primaria y cada tabla puede
tener 煤nicaente una llave primaria.
*/

/*
-----------------------     -----------------------
| persona             |     | persona2            |
-----------------------     -----------------------
| id INT PK           |     | id INT PK           |
| nombre VARCHAR(255) |     | nombre VARCHAR(255) |
| ciudad VARCHAR(255) |     | ciudad VARCHAR(255) |
-----------------------     -----------------------
*/

-- Creaci贸n de PRIMARY KEY al crear una tabla
CREATE TABLE persona
(
id INT NOT NULL,
nombre VARCHAR(255) NOT NULL,
ciudad VARCHAR(255),
PRIMARY KEY (id)
);

CREATE TABLE persona2
(
id INT NOT NULL,
nombre VARCHAR(255) NOT NULL,
ciudad VARCHAR(255),
CONSTRAINT pk_persona2 PRIMARY KEY (id,nombre)
);

-- Eliminaci贸n de PRIMARY KEY
ALTER TABLE persona
DROP PRIMARY KEY;

ALTER TABLE persona2
DROP PRIMARY KEY;

-- Modificando una tabla
ALTER TABLE persona
ADD PRIMARY KEY(id);

-- Modificando una tabla
ALTER TABLE persona2
ADD CONSTRAINT pk_persona PRIMARY KEY (id,nombre);
