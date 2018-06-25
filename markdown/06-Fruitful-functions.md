Funciones con resultados {#fruitchap}
========================

Muchas de las funciones de Python que hemos utilizado, como las funciones matemáticas, 
producen valores devueltos. Pero las funciones que hemos escrito son todas vacías: tienen 
un efecto, como imprimir un valor o mover una tortuga, pero no tienen un valor de retorno. 
En este capítulo aprenderás a escribir funciones con resultados.

Valores devueltos
-----------------

Llamar a la función genera un valor de retorno, que generalmente asignamos a una variable 
o usamos como parte de una expresión.

    e = math.exp(1.0)
    height = radius * math.sin(radians)

Las funciones que hemos escrito hasta ahora son nulas. Hablando casualmente, no tienen valor de retorno; más precisamente, su valor de retorno es `None`.

En este capítulo, (finalmente) vamos a escribir funciones con resultados. El primer 
ejemplo es `area`, que devuelve el área de un círculo con el radio dado:

    def area(radius):
        a = math.pi * radius**2
        return a

Hemos visto la declaración `return` antes, pero en una función con resultados, la 
instrucción `return` incluye una expresión. Esta instrucción significa: "Regresa 
inmediatamente de esta función y usa la siguiente expresión como valor de retorno". La 
expresión puede ser arbitrariamente complicada, por lo que podríamos haber escrito esta 
función de manera más concisa:

    def area(radius):
        return math.pi * radius**2

Por otro lado, **variables temporales** como `a` pueden facilitar la depuración.

Algunas veces es útil tener múltiples instrucciones de retorno, una en cada rama de un 
condicional:

    def absolute_value(x):
        if x < 0:
            return -x
        else:
            return x

Como estas instrucciones `return` están en una condicional alternativa, solo se ejecuta una.

Tan pronto como se ejecuta una instrucción de retorno, la función finaliza sin ejecutar 
ninguna instrucción posterior. El código que aparece después de una instrucción `return`, 
o en cualquier otro lugar al que nunca llegue el flujo de ejecución, se llama 
**código muerto**.

En una función con resultado, es buena idea asegurar que cada ruta posible a través del 
programa llegue a una instrucción `return`. Por ejemplo:

    def absolute_value(x):
        if x < 0:
            return -x
        if x > 0:
            return x

Esta función es incorrecta porque si `x` es 0, ninguna condición es verdadera y la función 
finaliza sin llegar una instrucción `return`. Si el flujo de ejecución llega al final de 
una función, el valor de retorno es `None`, que no es el valor absoluto de 0

    >>> print(absolute_value(0))
    None

Por cierto, Python proporciona una función incorporada llamada `abs` que calcula valores 
absolutos.

Como ejercicio, escribe una función `compare` que toma dos valores, `x` y `y`, y devuelve
`1` si `x > y`, `0` `si x == y`, y `-1` si `x < y`.

Desarrollo incremental {#incremental.development}
----------------------

A medida que escribe funciones más grandes, puede pasar más tiempo depurando.

Para tratar con programas cada vez más complejos, es posible que desee probar un proceso 
llamado **desarrollo incremental**. El objetivo del desarrollo incremental es evitar 
largas sesiones de depuración agregando y probando solo una pequeña cantidad de código a 
la vez.

Como ejemplo, suponga que desea encontrar la distancia entre dos puntos, dada por las 
coordenadas $(x_1, y_1)$ y $(x_2, y_2)$. Según el teorema de Pitágoras, la distancia es:

$$\mathrm{distance} = \sqrt{(x_2 - x_1)^2 + (y_2 - y_1)^2}$$

El primer paso es considerar cómo debería ser una función `distance` en Python. En otras 
palabras, ¿cuáles son las entradas (parámetros) y cuál es la salida (valor de retorno)?

En este caso, las entradas son dos puntos, que puedes representar utilizando cuatro 
números. El valor de retorno es la distancia representada por un valor de punto flotante.

Inmediatamente puedes escribir un resumen de la función:

    def distance(x1, y1, x2, y2):
        return 0.0

Obviamente, esta versión no calcula distancias; siempre devuelve cero. Pero es 
sintácticamente correcto y se ejecuta, lo que significa que puedes probarlo antes de 
hacerlo más complicado.

Para probar la nueva función, llámala con argumentos de muestra:

    >>> distance(1, 2, 4, 6)
    0.0

Elegí estos valores para que la distancia horizontal sea 3 y la distancia vertical sea 4; 
de esa manera, el resultado es 5, la hipotenusa de un triángulo 3-4-5. Al probar una 
función, es útil saber la respuesta correcta.

En este punto, hemos confirmado que la función es sintácticamente correcta y podemos 
comenzar a agregar código al cuerpo. Un siguiente paso razonable es encontrar las 
diferencias $x_2 - x_1$ y $y_2 - y_1$. La próxima versión almacena esos valores en 
variables temporales y los imprime.

    def distance(x1, y1, x2, y2):
        dx = x2 - x1
        dy = y2 - y1
        print('dx es', dx)
        print('dy es', dy)
        return 0.0

Si la función está funcionando, debería mostrar `dx es 3` y` dy es 4`. Si es así, sabemos 
que la función está obteniendo los argumentos correctos y realizando la primera 
computación correctamente. Si no, solo hay unas pocas líneas para verificar.

A continuación calculamos la suma de los cuadrados de `dx` y `dy`:

    def distance(x1, y1, x2, y2):
        dx = x2 - x1
        dy = y2 - y1
        dsquared = dx**2 + dy**2
        print('dsquared es: ', dsquared)
        return 0.0

De nuevo, ejecutarías el programa en esta etapa y verificarías el resultado (que debería 
ser 25). Finalmente, puedes usar `math.sqrt` para calcular y devolver el resultado:

    def distance(x1, y1, x2, y2):
        dx = x2 - x1
        dy = y2 - y1
        dsquared = dx**2 + dy**2
        resultado = math.sqrt(dsquared)
        return resultado

Si eso funciona correctamente, has terminado. De lo contrario, es posible que desees 
imprimir el valor de `resultado` antes de la instrucción de devolución.

La versión final de la función no muestra nada cuando se ejecuta; solo devuelve un valor. 
Las instrucciones `print` que escribimos son útiles para la depuración, pero una vez que 
la función funciona, debe eliminarlas. Un código como ese se llama **andamio** porque es 
útil para construir el programa pero no es parte del producto final.

Cuando comiences, deberías agregar solo una o dos líneas de código a la vez. A medida que 
adquieras más experiencia, podrías encontrarte escribiendo y depurando trozos más grandes. 
De cualquier manera, el desarrollo incremental puede ahorrarle mucho tiempo de depuración.

Los aspectos clave del proceso son:

1.  Comienza con un programa de trabajo y realiza pequeños cambios incrementales. En 
    cualquier punto, si hay un error, debes tener una buena idea de dónde está.

2.  Use variables para mantener los valores intermedios para que puedas visualizarlos y 
    verificarlos.

3.  Una vez que el programa está funcionando, es posible que desees eliminar algunos de 
    los andamios o consolidar múltiples instrucciones en expresiones compuestas, pero solo 
    si no hace que el programa sea difícil de leer.

Como ejercicio, usa el desarrollo incremental para escribir una función llamada 
`hipotenusa` que devuelve la longitud de la hipotenusa de un triángulo rectángulo dadas 
las longitudes de los catetos como argumentos. Registra cada etapa del proceso de 
desarrollo a medida que avanzas.

Composición
-----------

Como deberías esperar ahora, puedes llamar a una función desde otra. Como ejemplo, 
escribiremos una función que toma dos puntos, el centro del círculo y un punto en el 
perímetro, y calcula el área del círculo.

Supongamos que el punto central se almacena en las variables `xc` y `yc`, y el punto del 
perímetro está en `xp` y `yp`. El primer paso es encontrar el radio del círculo, que es la 
distancia entre los dos puntos. Acabamos de escribir una función, `distance`, que hace 
eso:

    radius = distance(xc, yc, xp, yp)

El siguiente paso es encontrar el área de un círculo con ese radio; nosotros también 
escribimos eso:

    result = area(radius)

Encapsulando estos pasos en una función, obtenemos:

    def circle_area(xc, yc, xp, yp):
        radius = distance(xc, yc, xp, yp)
        result = area(radius)
        return result

Las variables temporales `radius` y `result` son útiles para el desarrollo y la 
depuración, pero una vez que el programa está funcionando, podemos hacerlo más conciso al 
componer las llamadas de función:

    def circle_area(xc, yc, xp, yp):
        return area(distance(xc, yc, xp, yp))

Funciones Booleanas {#boolean}
-------------------

Las funciones pueden devolver booleanos, que a menudo es conveniente para ocultar pruebas 
complicadas dentro de funciones. Por ejemplo:

    def is_divisible(x, y):
        if x % y == 0:
            return True
        else:
            return False

Es común dar nombres de funciones booleanas que suenan como preguntas sí/no; 
`is_divisible` devuelve `True` o `False` para indicar si `x` es divisible por `y`.

Aquí hay un ejemplo:

    >>> is_divisible(6, 4)
    False
    >>> is_divisible(6, 3)
    True

El resultado del operador `==` es un booleano, por lo que podemos escribir la función de 
forma más concisa devolviéndola directamente:

    def is_divisible(x, y):
        return x % y == 0

Las funciones booleanas a menudo se usan en declaraciones condicionales:

    if is_divisible(x, y):
        print('x is divisible by y')

Puede ser tentador escribir algo como:

    if is_divisible(x, y) == True:
        print('x is divisible by y')

Pero la comparación adicional es innecesaria.

Como ejercicio, escriba una función `is_between(x, y, z)` que devuelva `True` si 
$x \le y \le z$ o `False` en caso contrario.

Más recursión {#more.recursion}
-------------

Solo cubrimos un pequeño subconjunto de Python, pero es posible que te interese saber que 
este subconjunto es un lenguaje de programación *completo*, lo que significa que todo lo 
que se pueda calcular se puede expresar en este idioma. Cualquier programa que se haya 
escrito se puede reescribir utilizando solo las características de idioma que hayas 
aprendido hasta ahora (en realidad, necesitarías algunos comandos para controlar 
dispositivos como el mouse, discos, etc., pero eso es todo).

Probar esa afirmación no es un ejercicio trivial, realizado por primera vez por Alan 
Turing, uno de los primeros científicos de la computación (algunos dirían que él era 
matemático, pero muchos de los primeros científicos de la computación comenzaron como 
matemáticos). En consecuencia, se conoce como Tesis de Turing. Para una discusión más 
completa (y precisa) de la tesis de Turing, recomiendo el libro de Michael Sipser 
*Introduction to the Theory of Computation*.

Para darte una idea de lo que puedes hacer con las herramientas que has aprendido hasta 
ahora, evaluaremos algunas funciones matemáticas definidas recursivamente. Una definición 
recursiva es similar a una definición circular, en el sentido de que la definición 
contiene una referencia a la cosa que se está definiendo. Una definición verdaderamente 
circular no es muy útil:

vorpal:

:   Un adjetivo utilizado para describir algo que es vorpal.

Si viste esa definición en el diccionario, podrías estar molesto. Por otro lado, si buscas 
la definición de la función factorial, que se denota con el símbolo $!$, Puedes obtener 
algo como esto:

$$\begin{aligned}
&&  0! = 1 \\
&&  n! = n (n-1)!
\end{aligned}$$

Esta definición dice que el factorial de 0 es 1, y el factorial de cualquier otro valor, 
$n$, es $n$ multiplicado por el factorial de $n-1$.

Entonces $3!$ es 3 veces $2!$, que es 2 veces $1!$, que es 1 por $0!$. Poniendo todo 
junto, $3!$ es igual a 3 veces 2 veces 1 veces 1, que es 6.

Si puedes escribir una definición recursiva de algo, puede escribir un programa de Python 
para evaluarlo. El primer paso es decidir cuáles deberían ser los parámetros. En este 
caso, debe quedar claro que `factorial` toma un número entero:

    def factorial(n):

Si el argumento es 0, todo lo que tenemos que hacer es devolver 1:

    def factorial(n):
        if n == 0:
            return 1

De lo contrario, y esta es la parte interesante, tenemos que hacer una llamada recursiva 
para encontrar el factorial de $n-1$ y luego multiplicarlo por $n$:

    def factorial(n):
        if n == 0:
            return 1
        else:
            recurse = factorial(n-1)
            result = n * recurse
            return result

El flujo de ejecución de este programa es similar al flujo de `countdown` en la sección 
\[recursion\]. Si llamamos `factorial` con el valor 3:

Como 3 no es 0, tomamos la segunda rama y calculamos el factorial de $n-1 \ldots$

> Como 2 no es 0, tomamos la segunda rama y calculamos
> factorial de $n-1 \ldots$
>
> > Como 1 no es 0, tomamos la segunda rama y calculamos
> > factorial de $n-1 \ldots$
> >
> > > Como 0 es igual a 0, tomamos la primera rama y devolvemos 1 sin
> > > hacer más llamadas recursivas.
> >
> > El valor de retorno, 1, se multiplica por $n$, que es 1, y el
> > resultado es devuelto.
>
> El valor de retorno, 1, se multiplica por $n$, que es 2, y el resultado
> es devuelto.

El valor de retorno (2) se multiplica por $n$, que es 3, y el resultado, 6, se convierte 
en el valor de retorno de la llamada de función que inició todo el proceso.

La figura \[fig.stack3\] muestra cómo se ve el diagrama de pila para esta secuencia de 
llamadas a funciones.

![Stack diagram.[]{data-label="fig.stack3"}](figs/stack3.pdf)

Los valores de retorno se muestran volviendo a pasar por la pila. En cada cuadro, el valor 
de retorno es el valor de `result`, que es el producto de `n` y `recurse`.

En el último cuadro, las variables locales `recurse` y `result` no existen, porque la rama 
que las crea no se ejecuta.

Salto de fe
-----------

Seguir el flujo de ejecución es una forma de leer programas, pero rápidamente puede ser 
abrumador. Una alternativa es lo que llamo el "salto de fe". Cuando llega a una llamada de 
función, en lugar de seguir el flujo de ejecución, *supones* que la función funciona 
correctamente y devuelve el resultado correcto.

De hecho, ya estás practicando este acto de fe cuando usa funciones integradas. Cuando 
llamas a `math.cos` o `math.exp`, no examinas los cuerpos de esas funciones. Simplemente 
asumes que funcionan porque las personas que escribieron las funciones integradas eran 
buenos programadores.

Lo mismo es cierto cuando llamas a una de tus propias funciones. Por ejemplo, en la 
Sección \[boolean\], escribimos una función llamada `is_divisible` que determina si un 
número es divisible por otro. Una vez que nos hemos convencido de que esta función es 
correcta, examinando el código y las pruebas, podemos usar la función sin mirar el cuerpo 
de nuevo.

Lo mismo es cierto para los programas recursivos. Cuando llegues a la llamada recursiva, 
en lugar de seguir el flujo de ejecución, debes suponer que la llamada recursiva funciona 
(devuelve el resultado correcto) y luego preguntarte: "Suponiendo que puedo encontrar el 
factorial de $n-1$, puedo calcular el factorial de $n$? "Está claro que puedes, 
multiplicando por $n$.

Por supuesto, es un poco extraño suponer que la función funciona correctamente cuando no 
has terminado de escribirla, ¡pero es por eso que se llama un acto de fe!

Un ejemplo más
--------------

Después de `factorial`, el ejemplo más común de una función matemática definida 
recursivamente es `fibonacci`, que tiene la siguiente definición (ver <http://en.wikipedia.org/wiki/Fibonacci_number>):

$$\begin{aligned}
&& \mathrm{fibonacci}(0) = 0 \\
&& \mathrm{fibonacci}(1) = 1 \\
&& \mathrm{fibonacci}(n) = \mathrm{fibonacci}(n-1) + \mathrm{fibonacci}(n-2)
\end{aligned}$$

Traducido a Python, se ve así:

    def fibonacci(n):
        if n == 0:
            return 0
        elif  n == 1:
            return 1
        else:
            return fibonacci(n-1) + fibonacci(n-2)

Si intentas seguir el flujo de ejecución aquí, incluso para valores bastante pequeños de 
$n$, tu cabeza explotará. Pero según el salto de la fe, si supones que las dos llamadas 
recursivas funcionan correctamente, entonces está claro que obtendrás el resultado 
correcto al sumarlas.

Comprobando tipos {#guardian}
-----------------

¿Qué sucede si llamamos `factorial` y le damos 1.5 como argumento?

    >>> factorial(1.5)
    RuntimeError: Maximum recursion depth exceeded

Parece una recursión infinita. ¿Como puede ser? La función tiene un caso base: cuando 
`n == 0`. Pero si `n` no es un número entero, podemos *perder* el caso base y recurrir 
para siempre.

En la primera llamada recursiva, el valor de `n` es 0.5. En el siguiente, es -0.5. A 
partir de ahí, se hace más pequeño (más negativo), pero nunca será 0.

Tenemos dos opciones. Podemos tratar de generalizar la función `factorial` para trabajar 
con números de punto flotante, o podemos hacer que `factorial` verifique el tipo de su 
argumento. La primera opción se llama función gamma y está un poco fuera del alcance de 
este libro. Así que iremos por el segundo.

Podemos usar la función incorporada `isinstance` para verificar el tipo del argumento. 
Mientras estamos en ello, también podemos asegurarnos de que el argumento sea positivo:

    def factorial(n):
        if not isinstance(n, int):
            print('Factorial is only defined for integers.')
            return None
        elif n < 0:
            print('Factorial is not defined for negative integers.')
            return None
        elif n == 0:
            return 1
        else:
            return n * factorial(n-1)

El primer caso base maneja no enteros; el segundo maneja enteros negativos. En ambos 
casos, el programa imprime un mensaje de error y devuelve `None` para indicar que algo 
salió mal:

    >>> print(factorial('fred'))
    Factorial is only defined for integers.
    None
    >>> print(factorial(-2))
    Factorial is not defined for negative integers.
    None

Si pasamos las dos comprobaciones, sabemos que $n$ es positivo o cero, por lo que podemos 
mostrar que la recursión finaliza.

Este programa demuestra un patrón a veces llamado **guardián**. Los dos primeros 
condicionales actúan como guardianes, protegiendo el código que sigue de los valores que 
pueden causar un error. Los guardianes hacen posible probar lo adecuado del código.

En la sección \[raise\] veremos una alternativa más flexible a la impresión de un mensaje 
de error: levantar una excepción.

Depuración {#factdebug}
----------

Dividir un programa grande en funciones más pequeñas crea puntos de control naturales para 
la depuración. Si una función no funciona, hay tres posibilidades a considerar:

- Hay algo mal con los argumentos que está obteniendo la función; una condición previa es 
  violada.

- Hay algo mal con la función; una poscondición es violada.

- Hay algo mal con el valor de retorno o la forma en que se está utilizando.

Para descartar la primera posibilidad, puede agregar una instrucción `print` al comienzo 
de la función y visualizar los valores de los parámetros (y tal vez sus tipos). O puede 
escribir código que verifique las condiciones previas de forma explícita.

Si los parámetros se ven bien, agregue una instrucción `print` antes de cada instrucción
`return` y visualice el valor de retorno. Si es posible, verifique el resultado a mano. 
Considere llamar a la función con valores que faciliten la verificación del resultado 
(como en la Sección \[incremental.development\]).

Si la función parece estar funcionando, observe la llamada a la función para asegurarse de 
que el valor de retorno se esté utilizando correctamente (¡o usado en absoluto!).

Agregar instrucciones de impresión al principio y al final de una función puede ayudar a 
que el flujo de ejecución sea más visible. Por ejemplo, aquí hay una versión de 
`factorial` con instrucciones de impresión:

    def factorial(n):
        space = ' ' * (4 * n)
        print(space, 'factorial', n)
        if n == 0:
            print(space, 'returning 1')
            return 1
        else:
            recurse = factorial(n-1)
            result = n * recurse
            print(space, 'returning', result)
            return result

`space` es una cadena de caracteres de espacio que controla la sangría de la salida. Este 
es el resultado de `factorial (4)`:

                     factorial 4
                 factorial 3
             factorial 2
         factorial 1
     factorial 0
     returning 1
         returning 1
             returning 2
                 returning 6
                     returning 24

Si está confundido acerca del flujo de ejecución, este tipo de resultado puede ser útil. 
Lleva cierto tiempo desarrollar andamios eficaces, pero un poco de andamiaje puede ahorrar 
mucha depuración.

Glosario
--------

variable temporal:

:   Una variable utilizada para almacenar un valor intermedio en un cálculo complejo.

código muerto:

:   Parte de un programa que nunca se ejecuta, a menudo porque aparece después de una 
    instrucción `return`.

desarrollo incremental:

:   Un plan de desarrollo de programa destinado a evitar la depuración agregando y 
    probando solo una pequeña cantidad de código a la vez.

andamio:

:   Código que se usa durante el desarrollo del programa, pero que no forma parte de la 
    versión final.

guardián:

:   Un patrón de programación que usa una instrucción condicional para verificar y manejar 
    circunstancias que pueden causar un error.

Ejercicios
----------

### Ejercicio 1

Dibuja un diagrama de pila para el siguiente programa. ¿Qué imprime el programa?

    def b(z):
        prod = a(z, z)
        print(z, prod)
        return prod

    def a(x, y):
        x = x + 1
        return x * y

    def c(x, y, z):
        total = x + y + z
        square = b(total)**2
        return square

    x = 1
    y = x + 1
    print(c(x, y+3, x+y))

### Ejercicio 2

La función de Ackermann, $A(m, n)$, está definida como:

$$\begin{aligned}
A(m, n) = 
\begin{cases} 
              n+1 & \mbox{si } m = 0 \\ 
        A(m-1, 1) & \mbox{si } m > 0 \mbox{ y } n = 0 \\ 
A(m-1, A(m, n-1)) & \mbox{si } m > 0 \mbox{ y } n > 0.
\end{cases}
\end{aligned}$$

Ver <http://en.wikipedia.org/wiki/Ackermann_function>. Escribe una función llamada `ack` 
que evalúa la función de Ackermann. Usa tu función para evaluar `ack(3, 4)`, que debería 
ser 125. ¿Qué ocurre con los valores más grandes de `m` y` n`? Solución: 
<http://thinkpython2.com/code/ackermann.py>.

### Ejercicio 3

Un palíndromo es una palabra que se escribe igual hacia atrás y hacia adelante, como 
"noon" y "redivider". Recursivamente, una palabra es un palíndromo si la primera y la última letra son iguales y el medio es un palíndromo.

Las siguientes son funciones que toman como argumento una cadena y devuelven las letras primera, última y centrales:

    def first(word):
        return word[0]

    def last(word):
        return word[-1]

    def middle(word):
        return word[1:-1]

Veremos cómo funcionan en el Capítulo *cadenas*.

1.  Escribe estas funciones en un archivo llamado `palindrome.py` y pruébelas. ¿Qué pasa 
    si llamas `middle` con una cadena con dos letras? ¿Una letra? ¿Qué pasa con la cadena 
    vacía, que está escrita `''` y no contiene letras?

2.  Escribe una función llamada `is_palindrome` que toma como argumento una cadena y 
    devuelve `True` si es un palíndromo y `False` de lo contrario. Recuerde que puedes 
    usar la función incorporada `len` para verificar la longitud de una cadena.

Solución: <http://thinkpython2.com/code/palindrome_soln.py>.

### Ejercicio 4

Un número, $a$, es una potencia de $b$ si es divisible por $b$ y $a/b$ es una potencia de 
$b$. Escribe una función llamada `is_power` que toma los parámetros `a` y `b` y devuelve 
`True` si `a` es una potencia de `b` Nota: tendrás que pensar en el caso base.

### Ejercicio 5

El máximo común divisor (MCD) de $a$ y $b$ es el número más grande que los divide a ambos 
sin dejar residuo.

Una forma de encontrar el MCD de dos números se basa en la observación de que si $r$ es el 
residuo cuando $a$ se divide entre $b$, entonces $mcd(a, b) = mcd(b, r)$. Como caso base, 
podemos usar $mcd(a, 0) = a$.

Escribe una función llamada `mcd` que toma los parámetros `a` y `b` y devuelve su máximo 
común divisor.

Crédito: Este ejercicio se basa en un ejemplo de *Structure and Interpretation of Computer Programs* de Abelson y Sussman.

[*Think Python: How to Think Like a Computer Scientist*](http://www.thinkpython2.com)

Copyright (c)  2015  Allen B. Downey.

License: [Creative Commons Attribution-NonCommercial 3.0 Unported License.](http://creativecommons.org/licenses/by-nc/3.0/)