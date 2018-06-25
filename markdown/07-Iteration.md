Iteración
=========

Este capítulo trata sobre la iteración, que es la capacidad de ejecutar un bloque de 
enunciados repetidamente. Vimos un tipo de iteración, usando recursión, en la sección 
\[recursion\]. Vimos otro tipo, usando un bucle `for`, en la sección \[repetición\]. En 
este capítulo veremos otro tipo más, usando una instrucción `while`. Pero primero quiero 
decir un poco más sobre la asignación de variables.

Reasignación
------------

Como habrás descubierto, es legal hacer más de una asignación a la misma variable. Una 
nueva asignación hace que una variable existente se refiera a un nuevo valor (y deje de 
referirse al valor anterior).

    >>> x = 5
    >>> x
    5
    >>> x = 7
    >>> x
    7

La primera vez que mostramos `x`, su valor es 5; la segunda vez, su valor es 7.

La figura \[fig.assign2\] muestra cómo se ve **la reasignación** en un diagrama de estado.

En este punto, quiero abordar una fuente común de confusión. Debido a que Python usa el 
signo igual (`=`) para la asignación, es tentador interpretar una afirmación como `a = b` 
como una proposición matemática de igualdad; es decir, la afirmación de que `a` y `b` son 
iguales. Pero esta interpretación es incorrecta.

Primero, la igualdad es una relación simétrica y la asignación no lo es. Por ejemplo, en 
matemáticas, si $a = 7$, luego $7 = a$. Pero en Python, la instrucción `a = 7` es legal y
`7 = a` no lo es.

Además, en matemáticas, una proposición de igualdad es verdadera o falsa para todos los 
tiempos. Si $a = b$ ahora, entonces $a$ siempre será igual a $b$. En Python, una 
instrucción de asignación puede hacer que dos variables sean iguales, pero no tienen que 
permanecer de esa manera:

    >>> a = 5
    >>> b = a    # a and b are now equal
    >>> a = 3    # a and b are no longer equal
    >>> b
    5

La tercera línea cambia el valor de `a` pero no cambia el valor de `b`, por lo que ya no 
son iguales.

La reasignación de variables a menudo es útil, pero debes usarla con precaución. Si los 
valores de las variables cambian con frecuencia, puedes hacer que el código sea difícil de 
leer y depurar.

![State diagram.[]{data-label="fig.assign2"}](figs/assign2.pdf)

Actualización de variables {#update}
--------------------------

Un tipo común de reasignación es una **actualización**, donde el nuevo valor de la 
variable depende del anterior

    >>> x = x + 1

Esto significa "obten el valor actual de `x`, suma uno y luego actualiza `x` con el nuevo 
valor."

Si intentas actualizar una variable que no existe, obtienes un error, porque Python evalúa 
el lado derecho antes de asignar un valor a `x`:

    >>> x = x + 1
    NameError: name 'x' is not defined

Antes de que puedas actualizar una variable, debes **inicializarla**, generalmente con una 
simple asignación:

    >>> x = 0
    >>> x = x + 1

Actualizar una variable sumando 1 se llama **incremento**; restar 1 se llama 
**decremento**.

La instrucción `while`
----------------------

Las computadoras se utilizan a menudo para automatizar tareas repetitivas. Repetir tareas 
idénticas o similares sin cometer errores es algo que las computadoras hacen bien y las 
personas lo hacen mal. En un programa de computadora, la repetición también se llama 
**iteración**.

Ya hemos visto dos funciones, `countdown` y `print_n`, que iteran usando la recursión. 
Debido a que la iteración es tan común, Python proporciona funciones de lenguaje para 
hacerlo más fácil. Una es la declaración `for` que vimos en la sección \[repetition\]. 
Volveremos sobre eso más tarde.

Otra es la declaración `while`. Aquí hay una versión de `countdown` que usa una 
declaración` while`:

    def countdown(n):
        while n > 0:
            print(n)
            n = n - 1
        print('Blastoff!')

Casi puedes leer la declaración `while` como si fuera inglés. Significa, "Mientras `n` es 
mayor que 0, muestra el valor de `n` y luego disminuye `n`. Cuando llegues a 0, muestra la 
palabra `Blastoff!`"

Más formalmente, aquí está el flujo de ejecución de una declaración `while`:

1.  Determina si la condición es verdadera o falsa.

2.  Si es falso, sal de la instrucción `while` y continúa la ejecución en la siguiente 
    instrucción.

3.  Si la condición es verdadera, ejecuta el cuerpo y luego regresa al paso 1.

Este tipo de flujo se denomina bucle porque el tercer paso gira alrededor de la parte 
superior.

El cuerpo del bucle debe cambiar el valor de una o más variables de modo que la condición 
se convierta finalmente en falsa y el bucle termine. De lo contrario, el bucle se repetirá 
para siempre, lo que se llama un **bucle infinito**. Una fuente interminable de diversión para los científicos informáticos es la observación de que las instrucciones del champú, "Enjabona, enjuaga, repite", son un ciclo infinito.

En el caso de `countdown`, podemos demostrar que el ciclo termina: si `n` es cero o 
negativo, el ciclo nunca se ejecuta. De lo contrario, `n` se vuelve más pequeño cada vez 
que pasa el ciclo, por lo que eventualmente tenemos que llegar a 0.

Para algunos otros bucles, no es tan fácil de decir. Por ejemplo:

    def sequence(n):
        while n != 1:
            print(n)
            if n % 2 == 0:        # n is even
                n = n / 2
            else:                 # n is odd
                n = n*3 + 1

La condición para este ciclo es `n! = 1`, por lo que el ciclo continuará hasta que `n` sea 
1, lo que hace que la condición sea falsa.

Cada vez que pasa el ciclo, el programa emite el valor de `n` y luego verifica si es par o 
impar. Si es par, `n` se divide por 2. Si es impar, el valor de `n` se reemplaza por 
`n * 3 + 1`. Por ejemplo, si el argumento pasado a `sequence` es 3, los valores 
resultantes de `n` son 3, 10, 5, 16, 8, 4, 2, 1.

Como `n` a veces aumenta y algunas veces disminuye, no hay pruebas obvias de que `n` 
llegue a 1, o que el programa termine. Para algunos valores particulares de `n`, podemos 
probar la terminación. Por ejemplo, si el valor de inicio es una potencia de dos, `n` será 
uniforme cada vez que pasa por el ciclo hasta que llegue a 1. El ejemplo anterior finaliza 
con dicha secuencia, comenzando con 16.

La pregunta difícil es si podemos probar que este programa finaliza para *todos* los 
valores positivos de `n`. ¡Hasta ahora, nadie ha sido capaz de probarlo *o* ¡desmentirlo! 
(Ver <http://en.wikipedia.org/wiki/Collatz_conjecture>.)

Como ejercicio, vuelve a escribir la función `print_n` desde la Sección \[recursion\] 
usando iteración en lugar de recursión.

La instrucción `break`
----------------------

A veces no sabes que es hora de terminar un ciclo hasta que llegues a la mitad del cuerpo. 
En ese caso, puede usar la instrucción `break` para saltar fuera del bucle.

Por ejemplo, supongamos que quieres recibir información del usuario hasta que escriba 
`done`. Podrías escribir:

    while True:
        line = input('> ')
        if line == 'done':
            break
        print(line)

    print('Done!')

La condición de bucle es `True`, que siempre es verdadera, por lo que el bucle se ejecuta 
hasta que llegue a la instrucción break.

Cada vez que pasa, se le avisa al usuario con un paréntesis angular. Si el usuario escribe 
`done`, la instrucción `break` sale del ciclo. De lo contrario, el programa repite todo lo 
que el usuario escriba y vuelve al principio del ciclo. Aquí hay una muestra de ejecución:

    > not done
    not done
    > done
    Done!

Esta forma de escribir bucles `while` es común porque puedes verificar la condición en 
cualquier punto del ciclo (no solo en la parte superior) y puedes expresar la condición de 
alto afirmativamente ("detener cuando esto sucede") en lugar de negativamente ("sigue adelante hasta que esto suceda").

Raíces cuadradas {#squareroot}
----------------

Los bucles se usan a menudo en programas que calculan resultados numéricos comenzando con 
una respuesta aproximada y mejorando iterativamente.

Por ejemplo, una forma de calcular las raíces cuadradas es el método de Newton. Supongamos 
que quieres saber la raíz cuadrada de $a$. Si comienzas con casi cualquier estimación, 
$x$, puedes calcular una mejor estimación con la siguiente fórmula:

$$y = \frac{x + a/x}{2}$$ Por ejemplo, si $a$ es 4 y $x$ es 3:

    >>> a = 4
    >>> x = 3
    >>> y = (x + a/x) / 2
    >>> y
    2.16666666667

El resultado está cerca de la respuesta correcta ($\sqrt{4} = 2$). Si repetimos el proceso 
con la nueva estimación, se acerca aún más:

    >>> x = y
    >>> y = (x + a/x) / 2
    >>> y
    2.00641025641

Después de algunas actualizaciones más, la estimación es casi exacta:

    >>> x = y
    >>> y = (x + a/x) / 2
    >>> y
    2.00001024003
    >>> x = y
    >>> y = (x + a/x) / 2
    >>> y
    2.00000000003

En general, no sabemos de antemano cuántos pasos se necesitan para llegar a la respuesta 
correcta, pero sabemos cuándo llegamos porque la estimación deja de cambiar:

    >>> x = y
    >>> y = (x + a/x) / 2
    >>> y
    2.0
    >>> x = y
    >>> y = (x + a/x) / 2
    >>> y
    2.0

Cuando `y == x`, podemos detenernos. Aquí hay un ciclo que comienza con una estimación 
inicial, `x`, y lo mejora hasta que deja de cambiar:

    while True:
        print(x)
        y = (x + a/x) / 2
        if y == x:
            break
        x = y

Para la mayoría de los valores de `a`, esto funciona bien, pero en general es peligroso 
probar la igualdad entre números de punto flotante. Los valores de punto flotante son solo 
aproximadamente correctos: la mayoría de los números racionales, como $1/3$, y los números 
irracionales, como $\sqrt{2}$, no se pueden representar exactamente con un `float`.

En lugar de verificar si `x` y `y` son exactamente iguales, es más seguro usar la función 
incorporada `abs` para calcular el valor absoluto, o la magnitud, de la diferencia entre 
ellos:

        if abs(y-x) < epsilon:
            break

Donde `epsilon` tiene un valor como `0.0000001` que determina qué tan cerca es lo 
suficientemente cerca.

Algoritmos
----------

El método de Newton es un ejemplo de **algoritmo**: es un proceso mecánico para resolver 
una categoría de problemas (en este caso, calcular raíces cuadradas).

Para entender qué es un algoritmo, podría ser útil comenzar con algo que no sea un 
algoritmo. Cuando aprendiste a multiplicar números de un solo dígito, probablemente hayas 
memorizado la tabla de multiplicar. En efecto, memorizaste 100 soluciones específicas. Ese 
tipo de conocimiento no es algorítmico.

Pero si fueras "flojo", es posible que hayas aprendido algunos trucos. Por ejemplo, para 
encontrar el producto de $n$ y 9, puedes escribir $n-1$ como primer dígito y $10-n$ como 
segundo dígito. Este truco es una solución general para multiplicar cualquier número de un 
solo dígito por 9. ¡Eso es un algoritmo!

De manera similar, las técnicas que aprendiste para agregar con acarreo, resta con 
endeudamiento y división larga son todos algoritmos. Una de las características de los 
algoritmos es que no requieren inteligencia para llevar a cabo. Son procesos mecánicos en 
los que cada paso se sigue de acuerdo con un simple conjunto de reglas.

Ejecutar algoritmos es aburrido, pero diseñarlos es interesante, intelectualmente 
desafiante y una parte central de la informática.

Algunas de las cosas que las personas hacen naturalmente, sin dificultad o pensamiento 
consciente, son las más difíciles de expresar algorítmicamente. Comprender el lenguaje 
natural es un buen ejemplo. Todos lo hacemos, pero hasta ahora nadie ha sido capaz de explicar *cómo* lo hacemos, al menos no en la forma de un algoritmo.

Depuración {#bisectbug}
----------

A medida que comienzas a escribir programas más grandes, es posible que pases más tiempo 
depurando. Más código significa más posibilidades de cometer un error y más lugares para 
ocultar errores.

Una forma de reducir el tiempo de depuración es "depurar mediante bisección". Por ejemplo, 
si hay 100 líneas en su programa y las verifica una a la vez, tomaría 100 pasos.

En cambio, intenta dividir el problema a la mitad. Mira en el medio del programa, o cerca 
de él, un valor intermedio que puedas verificar. Agrega una instrucción `print` (u otra 
cosa que tenga un efecto verificable) y ejecuta el programa.

Si la comprobación del punto medio es incorrecta, debe haber un problema en la primera 
mitad del programa. Si es correcto, el problema está en la segunda mitad.

Cada vez que realizas un control como este, reduces a la mitad el número de líneas que 
debes buscar. Después de seis pasos (que son menos de 100), estarías en una o dos líneas 
de código, al menos en teoría.

En la práctica, no siempre está claro qué es el "medio del programa" y no siempre es 
posible verificarlo. No tiene sentido contar líneas y encontrar el punto medio exacto. En 
su lugar, piensa en los lugares del programa donde podrían haber errores y lugares donde 
es fácil verificarlo. Luego, elige un lugar donde creas que las probabilidades son las mismas de que el error esté antes o después de la comprobación.

Glosario
--------

reasignación:

:   Asignar un nuevo valor a una variable que ya existe.

actualizar:

:   Una tarea en la que el nuevo valor de la variable depende de la anterior.

inicialización:

:   Una asignación que da un valor inicial a una variable que se actualizará.

incremento:

:   Una actualización que aumenta el valor de una variable (a menudo en uno).

decremento:

:   Una actualización que disminuye el valor de una variable.

iteración:

:   Ejecución repetida de un conjunto de instrucciones utilizando una llamada a función 
    recursiva o un ciclo.

bucle infinito:

:   Un bucle en el que la condición de terminación nunca se cumple.

algoritmo:

:   Un proceso general para resolver una categoría de problemas.

Ejercicios
----------

### Ejercicio 1

Copia el bucle de la sección \[squareroot\] y encapsulalo en una función llamada `mysqrt` 
que toma `a` como parámetro, elige un valor razonable de `x`, y devuelve una estimación de 
la raíz cuadrada de `a`.

Para probarlo, escribe una función llamada `test_square_root` que imprima una tabla como 
esta:

    a   mysqrt(a)     math.sqrt(a)  diff
    -   ---------     ------------  ----
    1.0 1.0           1.0           0.0
    2.0 1.41421356237 1.41421356237 2.22044604925e-16
    3.0 1.73205080757 1.73205080757 0.0
    4.0 2.0           2.0           0.0
    5.0 2.2360679775  2.2360679775  0.0
    6.0 2.44948974278 2.44948974278 0.0
    7.0 2.64575131106 2.64575131106 0.0
    8.0 2.82842712475 2.82842712475 4.4408920985e-16
    9.0 3.0           3.0           0.0

La primera columna es un número, $a$; la segunda columna es la raíz cuadrada de $a$ 
calculada con `mysqrt`; la tercera columna es la raíz cuadrada calculada por `math.sqrt`; 
la cuarta columna es el valor absoluto de la diferencia entre las dos estimaciones.

### Ejercicio 2

La función incorporada `eval` toma una cadena y la evalúa usando el intérprete de Python. 
Por ejemplo:

    >>> eval('1 + 2 * 3')
    7
    >>> import math
    >>> eval('math.sqrt(5)')
    2.2360679774997898
    >>> eval('type(math.pi)')
    <class 'float'>

Escribe una función llamada `eval_loop` que iterativamente solicita al usuario, toma la 
entrada resultante y la evalúa usando `eval` e imprime el resultado.

Debería continuar hasta que el usuario ingrese `'done'`, y luego devolver el valor de la 
última expresión que evaluó.

### Ejercicio 3

El matemático Srinivasa Ramanujan encontró una serie infinita que puede usarse para 
generar una aproximación numérica de $1 / \pi$:

$$\frac{1}{\pi} = \frac{2\sqrt{2}}{9801} 
\sum^\infty_{k=0} \frac{(4k)!(1103+26390k)}{(k!)^4 396^{4k}}$$

Escribe una función llamada `estimate_pi` que usa esta fórmula para calcular y devolver 
una estimación de $\pi$. Deberías usar un bucle `while` para calcular los términos de la 
suma hasta que el último término sea más pequeño que `1e-15` (que es la notación de Python 
por $10^{-15}$). Puedes verificar el resultado comparándolo con `math.pi`.

Solución: <http://thinkpython2.com/code/pi.py>.

[*Think Python: How to Think Like a Computer Scientist*](http://www.thinkpython2.com)

Copyright (c)  2015  Allen B. Downey.

License: [Creative Commons Attribution-NonCommercial 3.0 Unported License.](http://creativecommons.org/licenses/by-nc/3.0/)