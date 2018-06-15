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
operador relacional. No existe tal cosa como `= <` o `=>`


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

Diagramas de pila para funciones recursivas
-------------------------------------------

Recursión infinita
------------------

Entrada de teclado
------------------

Depuración
----------

Glosario
--------

Ejercicios
----------

[*Think Python: How to Think Like a Computer Scientist*](http://www.thinkpython2.com)

Copyright (c)  2015  Allen B. Downey.

License: [Creative Commons Attribution-NonCommercial 3.0 Unported License.](http://creativecommons.org/licenses/by-nc/3.0/)