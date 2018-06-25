Condicionales y recursión
=========================

El tema principal de este capítulo es la instrucción `if`, que ejecuta un código diferente 
según el estado del programa. Pero primero quiero presentar dos nuevos operadores: división entera y residuo.

División entera y residuo
-------------------------

El operador de **división entera**, `//`, divide dos números y redondea hacia abajo. Por 
ejemplo, supongamos que el tiempo de duración de una película es de 105 minutos. Es 
posible que desee saber cuánto tiempo es en horas. La división convencional devuelve un 
número de punto flotante:

    >>> minutes = 105
    >>> minutes / 60
    1.75

Pero normalmente no escribimos horas con puntos decimales. La división entera devuelve el 
número entero de horas redondeando hacia abajo:

    >>> minutes = 105
    >>> hours = minutes // 60
    >>> hours
    1

Para obtener el residuo, puedes restar `hours` en minutos:

    >>> remainder = minutes - hours * 60
    >>> remainder
    45

Una alternativa es usar el **operador de residuo**, `%`, que divide dos números y devuelve 
el residuo.

    >>> remainder = minutes % 60
    >>> remainder
    45

El operador de residuo es más útil de lo que parece. Por ejemplo, puedes verificar si un 
número es divisible por otro --- si $x \% y$ es cero, entonces $x$ es divisible por $y$.

Si estás usando Python 2, la división funciona de manera diferente. El operador de 
división, `/`, realiza la división entera si ambos operandos son enteros, y la división de 
punto flotante si cualquiera de los operandos es flotante.

Expresiones booleanas
---------------------

Una **expresión booleana** es una expresión que es verdadera o falsa. Los siguientes 
ejemplos usan el operador `==`, que compara dos operandos y produce `True` si son iguales 
y `False` en caso contrario:

    >>> 5 == 5
    True
    >>> 5 == 6
    False

`True` y` False` son valores especiales que pertenecen al tipo `bool`; no son cadenas:

    >>> type(True)
    <class 'bool'>
    >>> type(False)
    <class 'bool'>

El operador `==` es uno de los **operadores relacionales**; los otros son:

          x != y               # x is not equal to y
          x > y                # x is greater than y
          x < y                # x is less than y
          x >= y               # x is greater than or equal to y
          x <= y               # x is less than or equal to y

Aunque estas operaciones te resulten familiares, los símbolos de Python son diferentes de 
los símbolos matemáticos. Un error común es utilizar un solo signo igual (`=`) en lugar de 
un signo igual doble (`==`). Recuerda que `=` es un operador de asignación y `==` es un 
operador relacional. No existe tal cosa como `=<` o `=>`


Operadores lógicos
------------------

Hay tres **operadores lógicos**: `and`, `or` y `not`. La semántica (significado) de estos 
operadores es similar a su significado en inglés. Por ejemplo, `x> 0 and x <10` es 
verdadero solo si `x` es mayor que 0 *y* menor que 10.

`n%2 == 0 or n%3 == 0` es verdadero si *cualquiera o ambas* de las condiciones son 
verdaderas, es decir, si el número es divisible entre 2 *o* 3.

Finalmente, el operador `not` niega una expresión booleana, por lo que `not (x> y)` es 
verdadero si `x > y` es falso, es decir, si `x` es menor que o igual a `y`.

Estrictamente hablando, los operandos de los operadores lógicos deben ser expresiones 
booleanas, pero Python no es muy estricto. Cualquier número distinto de cero se interpreta 
como `True`:

Esta flexibilidad puede ser útil, pero hay algunas sutilezas que pueden ser confusas. Es 
mejor evitarlo (a menos que sepa lo que está haciendo).

Ejecución condicional
---------------------

Para escribir programas útiles, casi siempre necesitamos la capacidad de verificar las 
condiciones y cambiar el comportamiento del programa en consecuencia. Las **Instrucciones 
condicionales** nos dan esta habilidad. La forma más simple es la instrucción `if`:

    if x > 0:
        print('x is positive')

La expresión booleana después de `if` se llama **condición**. Si es verdadera, se ejecuta 
la instrucción sangrada. Si no, no pasa nada.

Las instrucciones `if` tienen la misma estructura que las definiciones de funciones: un 
encabezado seguido de un cuerpo sangrado. Las instrucciones como esta se llaman 
**instrucciones compuestas**.

No hay límite en la cantidad de instrucciones que pueden aparecer en el cuerpo, pero tiene 
que haber al menos una. Ocasionalmente, es útil tener un cuerpo sin instrucciones (por lo 
general, como marcador para el código no escrito). En ese caso, puedes usar la instrucción de `pass`, que no hace nada.

    if x < 0:
        pass          # TODO: need to handle negative values!

Ejecución alternativa
---------------------

Una segunda forma de la instrucción `if` es "ejecución alternativa", en la que hay dos 
posibilidades y la condición determina cuál se ejecuta. La sintaxis se ve así:

    if x % 2 == 0:
        print('x is even')
    else:
        print('x is odd')

Si el residuo cuando `x` se divide entre 2 es 0, entonces sabemos que `x` es par, y el 
programa muestra un mensaje apropiado. Si la condición es falsa, se ejecuta el segundo 
conjunto de instrucciones. Como la condición debe ser verdadera o falsa, se ejecutará 
exactamente una de las alternativas. Las alternativas se llaman **ramas**, porque son 
ramas en el flujo de ejecución.

Expresiones condicionales encadenadas
-------------------------------------

A veces hay más de dos posibilidades y necesitamos más de dos ramas. Una forma de expresar 
un cálculo como ese es un **condicional concatenado**:

    if x < y:
        print('x is less than y')
    elif x > y:
        print('x is greater than y')
    else:
        print('x and y are equal')

`elif` es una abreviatura de "else if ". Nuevamente, exactamente una rama se ejecutará. No 
hay límite en el número de instrucciones `elif`. Si hay una cláusula `else`, tiene que ser 
al final, pero no tiene que haber una.

    if choice == 'a':
        draw_a()
    elif choice == 'b':
        draw_b()
    elif choice == 'c':
        draw_c()

Cada condición se verifica en orden. Si la primera es falsa, la siguiente se verifica, y 
así sucesivamente. Si una de ellas es verdadera, la rama correspondiente se ejecuta y la 
instrucción finaliza. Incluso si más de una condición es verdadera, solo se ejecuta la 
primera rama verdadera.

Expresiones condicionales anidadas
----------------------------------

Un condicional también se puede anidar dentro de otra. Podríamos haber escrito el ejemplo 
en la sección anterior de esta manera:

    if x == y:
        print('x and y are equal')
    else:
        if x < y:
            print('x is less than y')
        else:
            print('x is greater than y')

El condicional externa contiene dos ramas. La primera rama contiene una instrucción 
simple. La segunda rama contiene otra instrucción `if`, que tiene dos ramas propias. Esas 
dos ramas son instrucciones simples, aunque también podrían haber sido instrucciones 
condicionales.

Aunque la sangría de las instrucciones hace que la estructura sea evidente, 
Las **condicionales anidadas** se vuelve difícil de leer muy rápidamente. Es una buena 
idea evitarlas cuando puedas.

    if 0 < x:
        if x < 10:
            print('x is a positive single-digit number.')

La instrucción de `print` se ejecuta solo si pasamos ambos condicionales, de modo que 
podemos obtener el mismo efecto con el operador `and`:

    if 0 < x and x < 10:
        print('x is a positive single-digit number.')

Para este tipo de condición, Python proporciona una opción más concisa:

    if 0 < x < 10:
        print('x is a positive single-digit number.')

Recursión
---------

Es legal que una función llame a otra; también es legal que una función se llame a sí 
misma. Puede que no sea obvio por qué es algo bueno, pero resulta ser una de las cosas más 
mágicas que un programa puede hacer. Por ejemplo, mira la siguiente función:

    def countdown(n):
        if n <= 0:
            print('Blastoff!')
        else:
            print(n)
            countdown(n-1)

Si `n` es 0 o negativo, emite la palabra, "Blastoff!" De lo contrario, imprime `n` y luego 
llama a una función llamada `countdown` ---sí misma--- pasando `n-1` como argumento.

¿Qué sucede si llamamos a esta función así?

    >>> countdown(3)

La ejecución de `countdown` comienza con $n = 3$, y dado que $n$ es mayor que 0, imprime 
el valor 3, y luego se llama a sí misma\...

> La ejecución de `countdown` comienza con $n = 2$, y dado que $n$ es mayor
> que 0, emite el valor 2, y luego se llama a sí mismo ...
>
> > La ejecución de `countdown` comienza con $n = 1$, y dado que $n$ es mayor
> > que 0, produce el valor 1, y luego se llama a sí mismo ...
> >
> > > La ejecución `countdown` comienza con $n = 0$, y como $n$ no es
> > > mayor que 0, da salida a la palabra, "Blastoff!" y luego regresa
> >
> > La llamada a `countdown` que obtuvo $n = 1$ regresa.
>
> La llamada a `countdown` que obtuvo $n = 2$ regresa.

La llamada a `countdown` que obtuvo $ n = 3 $ regresa.

Y luego estás de regreso en `__main__`. Entonces, el resultado total se ve como
esto:

    3
    2
    1
    Blastoff!

Una función que se llama a sí misma es **recursiva**; el proceso de ejecución se llama 
**recursividad**.

Como otro ejemplo, podemos escribir una función que imprime una cadena n veces.

    def print_n(s, n):
        if n <= 0:
            return
        print(s)
        print_n(s, n-1)

Si `n <= 0` la **instrucción de devolución** sale de la función. El flujo de ejecución 
vuelve inmediatamente donde se llamó, y las líneas restantes de la función no se ejecutan.

El resto de la función es similar a la función `countdown`: muestra `s` y luego se llama a 
sí misma para mostrar `s` $n-1$ veces adicionales. Entonces, el número de líneas de salida 
es $1 + (n - 1)$, que suma $n$.

Para ejemplos simples como este, probablemente sea más fácil usar un ciclo `for`. Pero 
veremos ejemplos más adelante que son difíciles de escribir con un bucle `for` y fáciles 
de escribir con recursión, por lo que es bueno comenzar temprano.

Diagramas de pila para funciones recursivas {#recursive.stack}
-------------------------------------------

En la sección [\[stackdiagram\]](#stackdiagram){reference-type="ref"
reference="stackdiagram"}, usamos un diagrama de pila para representar el estado de un 
programa durante una llamada de función. El mismo tipo de diagrama puede ayudar a 
interpretar una función recursiva.

Cada vez que se llama a una función, Python crea un marco para contener las variables 
locales y los parámetros de la función. Para una función recursiva, puede haber más de un 
marco en la pila al mismo tiempo.

La figura [\[fig.stack2\]](#fig.stack2){reference-type="ref" reference="fig.stack2"} 
muestra un diagrama de pila para la función `countdown` llamada con $n = 3$.

![Stack diagram.[]{label="fig.stack2"}](figs/stack2.pdf)

Como de costumbre, la parte superior de la pila es el marco para `__main__`. Está vacío 
porque no creamos ninguna variable en `__main__` ni le pasamos ningún argumento.

Los cuatro marcos de `countdown`  tienen valores diferentes para el parámetro `n`. La 
parte inferior de la pila, donde $n = 0$, se llama **caso base**. No hace una llamada 
recursiva, por lo que no hay más marcos.

Como ejercicio, dibuja un diagrama de pila para la función `print_n` llamada con
`s = 'Hello'` y $n = 2$. Luego escribe una función llamada `do_n` que tome como argumento 
una función y un número, $n$, y que llame a la función dada $n$ veces.

Recursión infinita
------------------

Si una recursión nunca llega a un caso base, continúa realizando llamadas recursivas para 
siempre, y el programa nunca termina. Esto se conoce como **recursión infinita**, y 
generalmente no es una buena idea. Aquí hay un programa con una recursión infinita:

    def recurse():
        recurse()

En la mayoría de los entornos de programación, un programa con recursión infinita 
realmente no se ejecuta para siempre. Python informa un mensaje de error cuando se alcanza la profundidad de recursión máxima:

      File "<stdin>", line 2, in recurse
      File "<stdin>", line 2, in recurse
      File "<stdin>", line 2, in recurse
                      .   
                      .
                      .
      File "<stdin>", line 2, in recurse
    RuntimeError: Maximum recursion depth exceeded

Este trazado inverso es un poco más grande que el que vimos en el capítulo anterior. 
Cuando se produce el error, ¡hay 1000 marcos recurrentes en la pila!

Si encuentras una recursión infinita por accidente, revisa tu función para confirmar que 
hay un caso base que no hace una llamada recursiva. Y si hay un caso base, verifica si está garantizado para alcanzarlo.

Entrada de teclado
------------------

Los programas que hemos escrito hasta el momento no aceptan ninguna entrada del usuario. 
Simplemente hacen lo mismo todo el tiempo.

Python proporciona una función incorporada llamada `input` que detiene el programa y 
espera a que el usuario escriba algo. Cuando el usuario presiona Return o Enter, el 
programa se reanuda e `input` devuelve lo que el usuario tecleó como una cadena. 
En Python 2, la misma función se llama `raw_input`.

    >>> text = input()
    What are you waiting for?
    >>> text
    'What are you waiting for?'

Antes de recibir información del usuario, es una buena idea imprimir un mensaje 
indicándole al usuario qué escribir. `input` puede tomar una cadena como argumento:

    >>> name = input('What...is your name?\n')
    What...is your name?
    Arthur, King of the Britons!
    >>> name
    'Arthur, King of the Britons!'

La secuencia `\n` al final de la cadena representa una **nueva línea**, que es un carácter 
especial que causa un salto de línea. Es por eso que la entrada del usuario aparece debajo 
del aviso.

Si esperas que el usuario escriba un número entero, puedes intentar convertir el valor 
devuelto a `int`:

    >>> prompt = 'What...is the airspeed velocity of an unladen swallow?\n'
    >>> speed = input(prompt)
    What...is the airspeed velocity of an unladen swallow?
    42
    >>> int(speed)
    42

Pero si el usuario escribe algo que no sea una cadena de dígitos, se obtiene un error:

    >>> speed = input(prompt)
    What...is the airspeed velocity of an unladen swallow?
    What do you mean, an African or a European swallow?
    >>> int(speed)
    ValueError: invalid literal for int() with base 10

Veremos cómo manejar este tipo de error más adelante.

Depuración {#whitespace}
----------

Cuando se produce un error de sintaxis o tiempo de ejecución, el mensaje de error contiene 
mucha información, pero puede ser abrumador. Las partes más útiles son usualmente:

- Qué tipo de error fue, y

- Dónde ocurrió

Los errores de sintaxis suelen ser fáciles de encontrar, pero hay algunos errores. Los 
errores de espacios en blanco pueden ser complicados porque los espacios y los tabuladores 
son invisibles y estamos acostumbrados a ignorarlos.

    >>> x = 5
    >>>  y = 6
      File "<stdin>", line 1
        y = 6
        ^
    IndentationError: unexpected indent

En este ejemplo, el problema es que la segunda línea está sangrada por un espacio. Pero el 
mensaje de error apunta a `y`, que es engañoso. En general, los mensajes de error indican 
dónde se descubrió el problema, pero el error real podría ser anterior en el código, a 
veces en una línea anterior.

Lo mismo es cierto de los errores de tiempo de ejecución. Supongamos que está tratando de 
calcular la razón señal/ruido en decibeles. La fórmula es 
$SNR_{db} = 10 \log_{10} (P_{signal} / P_{noise})$. En Python, puedes escribir algo como 
esto:

    import math
    signal_power = 9
    noise_power = 10
    ratio = signal_power // noise_power
    decibels = 10 * math.log10(ratio)
    print(decibels)

Cuando ejecutas este programa, obtienes una excepción:

    Traceback (most recent call last):
      File "snr.py", line 5, in ?
        decibels = 10 * math.log10(ratio)
    ValueError: math domain error

El mensaje de error indica la línea 5, pero no hay nada de malo en esa línea. Para 
encontrar el error real, podría ser útil imprimir el valor de la razón, que resulta ser 0. 
El problema está en la línea 4, que usa división entera en lugar de división de punto 
flotante.

Debes tomarte el tiempo para leer los mensajes de error con cuidado, pero no asumas que 
todo lo que dicen es correcto.

Glosario
--------

división entera:

:   Un operador, denotado //, que divide dos números y redondea hacia abajo
    (hacia el infinito negativo) a un número entero.

operador de residuo:

:   Un operador, denotado con un signo de porcentaje (%), que funciona en enteros
    y devuelve el residuo cuando un número se divide por otro.

expresión booleana:

:   Una expresión cuyo valor es `True` o `False`.

operador relacional:

:   Uno de los operadores que compara sus operandos: `==`, `!=`, `>`, `<`, `>=` y
    `<=`.

operador lógico:

:   Uno de los operadores que combina expresiones booleanas: `and`, `or` y
    `not`.

instrucción condicional:

:   Una instrucción que controla el flujo de ejecución dependiendo de algunos
    condición.

condición:

:   La expresión booleana en una instrucción condicional que determina
    qué rama se ejecuta.

instrucción compuesta:

:   Una instrucción que consiste en un encabezado y un cuerpo. El encabezado termina
    con dos puntos (:). El cuerpo está indentado en relación con el encabezado.

rama:

:   Una de las secuencias alternativas en una instrucción condicional.

encadenado condicional:

:   Una instrucción condicional con una serie de ramas alternativas.

condicional anidada:

:   Una instrucción condicional que aparece en una de las ramas de
    otra instrucción condicional.

instrucción de devolución:

:   Una instrucción que hace que una función termine inmediatamente y regrese
    donde se llamó.

recursión:

:   El proceso de llamar a la función que se está ejecutando actualmente.

caso base:

:   Una rama condicional en una función recursiva que no hace una
    llamada recursiva

recursión infinita:

:   Una recursión que no tiene un caso base, o nunca lo alcanza.
    Eventualmente, una recursión infinita causa un error de tiempo de ejecución.

Ejercicios
----------

### Ejercicio 1

El módulo `time` proporciona una función, también llamada `time`, que devuelve la hora 
actual de Greenwich en "la época", que es un tiempo arbitrario utilizado como punto de 
referencia. En los sistemas UNIX, la época es el 1 de enero de 1970.

    >>> import time
    >>> time.time()
    1437746094.5735958

Escribe un guión (script) que lea la hora actual y la convierta a una hora del día en horas, minutos y segundos, más el número de días desde la época.

### Ejercicio 2

El último teorema de Fermat dice que no hay enteros positivos $a$, $b$ y $c$ tales que

$$a^n + b^n = c^n$$ para cualquier valor de $n$ mayor que 2.

1.  Escribe una función llamada `check_fermat` que toma cuatro parámetros
    ---a, b, c y n---y verifica si el teorema de Fermat se cumple. 
    Si $n$ es mayor que 2 y

    $$a^n + b^n = c^n$$ el programa debería imprimir, "Holy Smokes, Fermat was wrong!" 
    De lo contrario, el programa debería imprimir, "No, eso no funciona".

2.  Escribe una función que le solicite al usuario que ingrese valores para a, b, c y n, 
    los convierta en enteros y use `check_fermat` para verificar si violan el teorema de 
    Fermat.

### Ejercicio 3

Dados tres palos, podrías o no organizarlos en un triángulo. Por ejemplo, si uno de los 
palos mide 12 pulgadas de largo y los otros dos tienen una pulgada de largo, no podrías 
lograr que los palos cortos se encuentren en el medio. Para tres longitudes, hay una 
prueba simple para ver si es posible formar un triángulo:

> Si cualquiera de las tres longitudes es mayor que la suma de las otras dos, 
> entonces no puedes formar un triángulo. De lo contrario, puedes. (Si la suma
> de dos longitudes es igual a la tercera, forman lo que se llama un triángulo 
> "degenerado").

1.  Escribe una función llamada `is_triangle` que toma tres enteros como argumentos, y que 
    imprime ya sea "Sí" o "No", dependiendo de si puede o no puede formar un triángulo a 
    partir de palos con las longitudes dadas.

2.  Escribe una función que le pida al usuario que ingrese tres longitudes de palos, las 
    convierta en enteros y use `is_triangle` para verificar si los palos con las 
    longitudes dadas pueden formar un triángulo.

### Ejercicio 4

¿Cuál es el resultado del siguiente programa? Dibuja un diagrama de pila que muestra el 
estado del programa cuando imprime el resultado.

    def recurse(n, s):
        if n == 0:
            print(s)
        else:
            recurse(n-1, n+s)

    recurse(3, 0)

1.  ¿Qué pasaría si llamaras a esta función así:
    recurse(-1, 0)?

2.  Escribe un docstring que explique todo lo que alguien debería saber para utilizar esta 
    función (y nada más).

### Ejercicio 5

Lee la siguiente función y ve si puedes descubrir qué hace (ve los ejemplos en el Capítulo [\[turtlechap\]](#turtlechap){reference-type="ref"
reference="turtlechap"}). Luego ejecútalo y ve si lo hizo bien.

    def draw(t, length, n):
        if n == 0:
            return
        angle = 50
        t.fd(length*n)
        t.lt(angle)
        draw(t, length, n-1)
        t.rt(2*angle)
        draw(t, length, n-1)
        t.lt(angle)
        t.bk(length*n)

![A Koch curve.[]{label="fig.koch"}](figs/koch.pdf)

### Ejercicio 5

La curva de Koch es un fractal que se parece a la figura 
[\[fig.koch\]](#fig.koch){reference-type="ref" reference="fig.koch"}. 
Para dibujar una curva de Koch con una longitud $x$, todo lo que tienes que hacer es

1.  Dibuja una curva de Koch con una longitud $x / 3$.

2.  Gira a la izquierda 60 grados.

3.  Dibuja una curva de Koch con una longitud $x / 3$.

4.  Gira a la derecha 120 grados.

5.  Dibuja una curva de Koch con una longitud $x / 3$.

6.  Gira a la izquierda 60 grados.

7.  Dibuja una curva de Koch con una longitud $x / 3$.

La excepción es si $x$ es menor que 3: en ese caso, puedes dibujar una línea recta con una 
longitud de $x$.

1.  Escribe una función llamada koch que toma una tortuga y una longitud como parámetros, 
    y que usa la tortuga para dibujar una curva de Koch con la longitud dada.

2.  Escribe una función llamada `snowflake` que dibuja tres curvas de Koch para hacer el 
    contorno de un copo de nieve.

    Solución: <http://thinkpython2.com/code/koch.py>.

3.  La curva de Koch se puede generalizar de varias maneras. Consulta 
    <http://en.wikipedia.org/wiki/Koch_snowflake> para ver ejemplos e implementa tu 
    favorito.

[*Think Python: How to Think Like a Computer Scientist*](http://www.thinkpython2.com)

Copyright (c)  2015  Allen B. Downey.

License: [Creative Commons Attribution-NonCommercial 3.0 Unported License.](http://creativecommons.org/licenses/by-nc/3.0/)