/*
Fechas
------
Mientras las consultas sean únicamente a fechas (sin horas), entonces serán
sencillas. Sin embargo, al involucrar porciones de tiempo, se complica.

Lo más difícil de trabajar con fechas es la certeza del formato de fecha con
el que se inserta la data, el cual debe coincidir con el tipo de columna.

Las funciones de fecha básicas de MySQL/MariaDB son:
- NOW(): Retorna la fecha y hora actual.
- CURDATE(): Retorna la fecha actual.
- CURTIME(): Retorna la hora actual.
- DATE(): Extrae la parte de ala fecha de una expresión.
- EXTRACT(): Retorna una parte de fecha u hora.
- DATE_ADD(): Agrega un intervalo de tiempo de una fecha.
- DATE_SUB(): Resta un intervalo de tiempo de una fecha.
- DATEDIFF(): Retorna la diferencia entre dos fechas.
- DATE_FORMAT(): Muestra la data de fecha y horas en diferentes formatos.

Los siguientes son los tipos de datos en MySQL/MariaDB asociados con fechas:
- DATE: formato YYYY-MM-DD. Ejemplo: '2008-12-21'
- DATETIME: formato YYYY-MM-DD HH:MI:SS. Ejemplo: '2000-12-31 23:59:30'
- TIME: formato HH:MI:SS. Ejemplo: '12:59:59'
- YEAR: formato YYYY. Ejemplo: 2014
*/

SELECT NOW(), CURDATE(), CURTIME()

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
id INT PRIMARY KEY AUTO_INCREMENT;
producto VARCHAR(50) NOT NULL;
fecha DATETIME NOT NULL DEFAULT NOW();
);

INSERT INTO ordenes(producto)
VALUES('Corona 6-pack');

INSERT INTO ordenes(producto,fecha)
VALUES('Atlas botella',CURDATE());

SELECT producto, DATE(fecha) as FechaOrden
FROM ordenes
WHERE id = 1;

SELECT EXTRACT(YEAR FROM fecha) AS Ano,
EXTRACT(MONTH FROM fecha) AS Mes,
EXTRACT(DAY FROM fecha) AS Dia
FROM ordenes
WHERE id = 2;

SELECT id, DATE_ADD(fecha, INTERVAL 30 DAY) AS DiaPago
FROM ordenes;

SELECT DATEDIFF('2016-05-20','2015-04-28') AS DiferenciaFecha;

/*
Formatos de DATE_FORMAT:
%a : Nombre abreviado de día de semana (Sun-Sat)
%b : Nombre abreviado de nombre de mes (Jan-Dec)
%c : Mes, numérico (0-12)
%D : Día del mes con sufijo en inglés (0th, 1st, 2nd, 3rd ...)
%d : Día del mes (00-31)
%f : Microsegundos (000000-999999)
%H : Hora (00-23)
%h : Hora (01-12)
%i : Minutos, numérico (00-59)
%j : Día del año (001-365)
%M : Nombre del mes (January-December)
%m : Mes, numérico (00-12)
%p : AM o PM
%r : Hora, formato 12-horas (hh:mm:ss seguido de AM o PM)
%S : Segundos (00-59)
%T : Tiempo, formato 24-horas (hh:mm:ss)
%U : Semana (00-53) donde Domingo es el primer día de la semana
%u : Semana (00-53) donde Lunes es el primer día de la semana
%W : Nombre del día de la semana (Sunday-Saturday)
%w : Día de la semana (0=Domingo,6=Sábado)
%Y : Año, numérico, cuatro dígitos
%y : Año, numérico, dos dígitos

Ejemplos:
DATE_FORMAT(NOW(), '%b %d %Y %h:%i %p')
DATE_FORMAT(NOW(), '%d-%m-%Y')
*/
