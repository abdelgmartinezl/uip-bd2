/*
Sentencia IF
------------
La sentencia IF permite ejecutar un conjunto de sentencias SQL basado en ciertas
condiciones o valores de una expresión.

Nota: Esta sentencia no debe confundirse con la función IF.

La siguiente representa la sintaxis de la sentencia IF:
IF expresion THEN
   sentencias-if;
END IF;

En caso se deseen ejecutar sentencias si la expresión evaluada retorna falso,
entonces se usa la sentencia IF ELSE:
IF expresion THEN
   sentencias-if;
ELSE
   sentencias-else;
END-IF

Si se desean ejecutar sentencias condicionalmente basadas en múltiples expresiones,
se puede usar la sentencia IF ELSEIF ELSE:
IF expresion-if THEN
   sentencias-if;
ELSEIF expresion-elseif THEN
   sentencias-elseif;
ELSE
   sentencias-else;
END IF;
*/
