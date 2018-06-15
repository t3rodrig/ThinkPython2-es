Funciones con resultados
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

Desarrollo incremental
----------------------



Composición
-----------

Funciones Booleanas
-------------------

Más recursión
-------------

Salto de fe
-----------

Un ejemplo más
--------------

Comprobando tipos
-----------------

Depuración
----------

Glosario
--------

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