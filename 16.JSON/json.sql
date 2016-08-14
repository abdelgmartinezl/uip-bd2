/*
JSON es un formato de estructura de datos simple y legible. Es utilizado para
transmitir data entre un servidor y una aplicación web, como una alternativa a XML.

Las dos partes principales de JSON son llaves y valores. Juntos hacen un par de 
llave/valor:
- Llave: Siempre es una cadena encerrada entre comillas.
- Valor: Puede ser una cadena, número, booleano, arreglo u objeto.
- Par llave/valor: Sigue una sintaxis específica, con la llave seguida de dos puntos
(:) y el valor. Los pares llave/valor se separan por comas.

En MySQL 5.7 se introdujo un nuevo tipo de datos para almacenar datos JSON en tablas
de MySQL. Por ejemplo, ahora se puede hacer lo siguiente:
   mysql> CREATE TABLE empleados (data JSON);
   Query OK, 0 rows affected (0,01 sec)
 
   mysql> INSERT INTO empleados VALUES ('{"id": 1, "nombre": "Juan"}');
   Query OK, 1 row affected (0,00 sec)
 
   mysql> INSERT INTO employees VALUES ('{"id": 2, "nombre": "Jose"}');
   Query OK, 1 row affected (0,00 sec)
 
   mysql> select * from empleados;
   +-----------------------------+
   | data                        |
   +-----------------------------+
   | {"id": 1, "nombre": "Juan"} |
   | {"id": 2, "nombre": "Jose"} |
   +-----------------------------+
   2 rows in set (0,00 sec)

Los datos de tipo JSON pueden estar en una columna de tipo TEXT o VARCHAR, pero usar
el tipo de datos JSON brinda mayores beneficios:
1. Validación de documento: Solamente se pueden ingresar JSON válidos en una columna
de tipo JSON. Si se trata de almacenar un dato inválido se obtiene un error.
2. Acceso eficiente: Cuando se almacena un dato en una columna de tipo JSON, no se
hace en un formato plano. En su lugar, se almacena en un formato binario optimizado
que permite accesos más rápidos.
*/


CREATE TABLE modelo_termostato
(id_modelo VARCHAR(50) PRIMARY KEY,
capacidades JSON);

CREATE TABLE lectura_termostato
(lectura JSON);

SELECT JSON_ARRAY( 'programable', 'ac', 'horno' ) JSON_ARRAY;

INSERT INTO modelo_termostato VALUES
('qwerty', '["programable", "ac", "horno"]'),
('abcdef', '["abanico", "horno"]);

SELECT * FORM modelo_termostato;

SELECT JSON_OBJECT( 'id', 3001, 'horaunix', 1471215217, 'configuracion', 50, 'temperatura', 47.02) JSON_OBJECT;

INSERT INTO lectura_termostato VALUES
('{"id": 3001, "horaunix": 1471214128, "configuracion": 70.0, "temperatura": 69.45}'),
('{"id": 3002, "horaunix": 1471215217, "configuracion": 65.0, "temperatura": 62.17}');

SELECT * FROM lectura_termostato;

INSERT INTO lectura_termostato VALUES
('{"on": true, "configuracion": 62, "horaunix": 1471201731, "id": 3002, "temperatura": 60.75}'),
('{"on": false, "configuracion": 68, "horaunix": 1471240684, "id": 3002, "temperatura": 67.99}');

UPDATE lectura_termostato SET lectura = JSON_INSERT(lectura, '$.on', CAST('null' AS JSON));

UPDATE lectura_termostato SET lectura = JSON_REMOVE(lectura, '$.on');

UPDATE lectura_termostato SET lectura = JSON_SET(lectura, '$.diferencia', CAST(JSON_EXTRACT(lectura, '$.temperatura') AS DECIMAL(5,2))-CAST(JSON_EXTRACT(lectura, '$.configuracion') AS DECIMAL(5,2)));

UPDATE modelo_termostato SET capacidades = JSON_APPEND(capacidades, '$', 'abanico_inteligente') WHERE id_modelo = 'qwerty';

ALTER TABLE lectura_termostato ADD COLUMN id INT GENERATED ALWAYS AS (JSON_EXTRACT(lectura, '$.id')) VIRTUAL;

SELECT * FROM lectura_termostato;

SELECT JSON_LENGTH(lectura) FROM lectura_termostato;

SELECT JSON_DEPTH(lectura) FROM lectura_termostato;

SELECT JSON_KEYS(lectura) FROM lectura_termostato;

SELECT JSON_CONTAINS_PATH(lectura, 'all', '$.diferencia') FROM lectura_termostato;

SELECT JSON_CONTAINS(lectura, JSON_OBJECT('diferencia', 0.55)) FROM lectura_termostato;

SELECT JSON_CONTAINS(capacidades, JSON_ARRAY('ac')) FROM lectura_termostato;

SELECT JSON_TYPE(capacidades), JSON_TYPE(JSON_EXTRACT(capacidades, '$[0]') FROM lectura_termostato;
