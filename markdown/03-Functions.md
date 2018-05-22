Funciones
=========

En el contexto de la programación, una [**función**]{} es una secuencia de instrucciones 
nombrada que realiza un cálculo. Cuando defines una función, especifica el nombre y la 
secuencia de las instrucciones. Más tarde, puede "llamar" a la función por su nombre.

Llamadas de función
-------------------

Ya hemos visto un ejemplo de una [**llamada de función**]{}:

    >>> type(42)
    <class 'int'>

El nombre de la función es `type`. La expresión entre paréntesis se llama **argumento** de 
la función. El resultado, para esta función, es el tipo del argumento.

Es común decir que una función "toma" un argumento y "devuelve" un resultado. El resultado 
se denomina el [**valor de retorno**]{}.

Python proporciona funciones que convierten valores de un tipo a otro. La función `int` 
toma cualquier valor y lo convierte en un entero, si puede, o se queja de lo contrario:

    >>> int('32')
    32
    >>> int('Hello')
    ValueError: invalid literal for int(): Hello

`int` puede convertir valores de punto flotante en enteros, pero no redondea; trunca la 
parte de la fracción:

    >>> int(3.99999)
    3
    >>> int(-2.3)
    -2

`float` convierte enteros y cadenas a números de punto flotante:

    >>> float(32)
    32.0
    >>> float('3.14159')
    3.14159

Finalmente, `str` convierte su argumento en una cadena:

    >>> str(32)
    '32'
    >>> str(3.14159)
    '3.14159'

Funciones matemáticas
---------------------

Python tiene un módulo matemático que proporciona la mayoría de las funciones matemáticas 
familiares. Un **módulo** es un archivo que contiene una colección de funciones 
relacionadas.

Antes de que podamos usar las funciones en un módulo, tenemos que importarlo con una **instrucción de importación**:

    >>> import math

Esta instrucción crea un objeto módulo llamado `math`. Si visualiza el objeto módulo, 
obtiene información al respecto:

    >>> math
    <module 'math' (built-in)>

El objeto `math` contiene las funciones y variables definidas en el módulo. Para acceder a 
una de las funciones, debe especificar el nombre del módulo y el nombre de la función, 
separados por un punto. Este formato se denomina **notación punto**.

    >>> ratio = signal_power / noise_power
    >>> decibels = 10 * math.log10(ratio)

    >>> radians = 0.7
    >>> height = math.sin(radians)

El primer ejemplo usa `math.log10` para calcular una relación señal-ruido en decibeles 
(suponiendo que` signal_power` y `noise_power` están definidos). El módulo `math` también 
proporciona `log`, que calcula logaritmos base $e$.

El segundo ejemplo encuentra el seno de `radians`. El nombre de la variable es una 
sugerencia de que `sin` y las otras funciones trigonométricas (`cos`, `tan`, etc.) toman 
argumentos en radianes. Para convertir de grados a radianes, divida por 180 y multiplique 
por $\pi$:

    >>> degrees = 45
    >>> radians = degrees / 180.0 * math.pi
    >>> math.sin(radians)
    0.707106781187

La expresión `math.pi` obtiene la variable `pi` del módulo `math`. Su valor es una 
aproximación en punto flotante de $\pi$, con una precisión de aproximadamente 15 dígitos.

Si recuerdas trigonometría, puedes verificar el resultado anterior comparándolo con la 
raíz cuadrada de dos dividida por dos:

    >>> math.sqrt(2) / 2.0
    0.707106781187
    
Composición
-----------

Hasta ahora, hemos analizado los elementos de un programa --variables, expresiones e 
instrucciones-- de forma aislada, sin hablar de cómo combinarlos.

Una de las características más útiles de los lenguajes de programación es su capacidad de 
tomar pequeños elementos básicos y componerlos. Por ejemplo, el argumento de una función 
puede ser cualquier tipo de expresión, incluidos los operadores aritméticos:

    x = math.sin(degrees / 360.0 * 2 * math.pi)

E incluso llamadas a funciones:

    x = math.exp(math.log(x+1))

Casi en cualquier lugar donde pueda poner un valor, puede poner una expresión arbitraria, 
con una excepción: el lado izquierdo de una declaración de asignación tiene que ser un 
nombre de variable. Cualquier otra expresión en el lado izquierdo es un error de sintaxis 
(veremos excepciones a esta regla más adelante).

    >>> minutes = hours * 60                 # correcto
    >>> hours * 60 = minutes                 # ¡incorrecto!
    SyntaxError: can't assign to operator
    
Agregar nuevas funciones
------------------------

Hasta ahora, solo hemos usado las funciones que vienen con Python, pero también es posible 
agregar nuevas funciones. Una **definición de función** especifica el nombre de una nueva 
función y la secuencia de instrucciones que se ejecutan cuando se llama a la función.

Aquí hay un ejemplo:

    def print_lyrics():
        print("I'm a lumberjack, and I'm okay.")
        print("I sleep all night and I work all day.")

`def` es una palabra clave que indica que esta es una definición de función. El nombre de 
la función es `print_lyrics`. Las reglas para los nombres de las funciones son las mismas 
que para los nombres de las variables: las letras, los números y los guiones bajos son 
legales, pero el primer carácter no puede ser un número. No puede usar una palabra clave 
como el nombre de una función, y debe evitar tener una variable y una función con el mismo 
nombre.

Los paréntesis vacíos después del nombre indican que esta función no toma ningún 
argumento.

La primera línea de la definición de función se llama **encabezado**; el resto se llama 
**cuerpo**. El encabezado debe terminar con dos puntos y el cuerpo debe sangrarse. Por 
convención, la sangría es siempre cuatro espacios. El cuerpo puede contener cualquier cantidad de instrucciones.

Las cadenas de texto en las instrucciones de impresión están entre comillas dobles. Las 
comillas simples y las comillas dobles hacen lo mismo; la mayoría de las personas usa 
comillas simples, excepto en casos como este donde aparece una comilla simple (que también 
es un apóstrofo) en la cadena.

Todas las comillas (simples y dobles) deben ser "comillas rectas". Las "comillas rizadas",
como las de esta oración, no son legales en Python.

Si escribe una definición de función en modo interactivo, el intérprete imprime puntos 
(`...`) para hacerle saber que la definición no está completa:

    >>> def print_lyrics():
    ...     print("I'm a lumberjack, and I'm okay.")
    ...     print("I sleep all night and I work all day.")
    ...
    
Para finalizar la función, debe ingresar una línea vacía.

La definición de una función crea un **objeto función**, que tiene el tipo `function`:

    >>> print(print_lyrics)
    <function print_lyrics at 0xb7e99e9c>
    >>> type(print_lyrics)
    <class 'function'>
    
La sintaxis para llamar a la nueva función es la misma que para las funciones 
incorporadas:

    >>> print_lyrics()
    I'm a lumberjack, and I'm okay.
    I sleep all night and I work all day.

Una vez que definida una función, puedes usarla dentro de otra función. Por ejemplo, 
para repetir el estribillo anterior, podríamos escribir una función llamada 
`repeat_lyrics`:

    def repeat_lyrics():
        print_lyrics()
        print_lyrics()

Y luego llamar a `repeat_lyrics`:

    >>> repeat_lyrics()
    I'm a lumberjack, and I'm okay.
    I sleep all night and I work all day.
    I'm a lumberjack, and I'm okay.
    I sleep all night and I work all day.

Pero esa no es la forma en que va la canción.

Definiciones y usos
--------------------

Al juntar los fragmentos de código de la sección anterior, todo el programa se ve así:

    def print_lyrics():
        print("I'm a lumberjack, and I'm okay.")
        print("I sleep all night and I work all day.")

    def repeat_lyrics():
        print_lyrics()
        print_lyrics()

    repeat_lyrics()

Este programa contiene dos definiciones de funciones: `print_lyrics` y` repeat_lyrics`. 
Las definiciones de funciones se ejecutan como otras instrucciones, pero el efecto es 
crear objetos de función. Las instrucciones dentro de la función no se ejecutan hasta que 
se llama a la función y la definición de la función no genera salida.

Como era de esperar, debe crear una función antes de poder ejecutarla. En otras palabras, 
la definición de la función debe ejecutarse antes de que se llame a la función.

Como ejercicio, mueva la última línea de este programa a la parte superior, de modo que la 
llamada a la función aparezca antes de las definiciones. Ejecute el programa y vea qué 
mensaje de error recibe.

Ahora mueva la llamada a la función de regreso a la parte inferior y mueva la definición 
de `print_lyrics` después de la definición de` repeat_lyrics`. ¿Qué pasa cuando ejecutas 
este programa?

Flujo de ejecución
------------------

Para garantizar que una función esté definida antes de su primer uso, debe conocer el
orden en que las instrucciones se ejecutan, que se denomina **flujo de ejecución**.

La ejecución siempre comienza en la primera instrucción del programa. Las instrucciones se 
ejecutan una a la vez, en orden de arriba a abajo.

Las definiciones de función no alteran el flujo de ejecución del programa, pero recuerde 
que las instrucciones dentro de la función no se ejecutan hasta que se llama a la función.

Una llamada a función es como un desvío en el flujo de ejecución. En lugar de ir al 
siguiente enunciado, el flujo salta al cuerpo de la función, ejecuta las instrucciones 
allí y luego regresa para continuar donde lo dejó.

Eso suena bastante simple hasta que recuerda que una función puede llamar a otra. Mientras 
está en medio de una función, el programa podría tener que ejecutar las instrucciones en 
otra función. Luego, mientras ejecuta esa nueva función, ¡el programa podría tener que 
ejecutar otra función más!

Afortunadamente, Python es bueno en el seguimiento de dónde está, por lo que cada vez que 
se completa una función, el programa continúa donde lo dejó en la función que lo llamó. 
Cuando llega al final del programa, termina.

En resumen, cuando lee un programa, no siempre quiere leer de arriba abajo. A veces tiene 
más sentido si sigues el flujo de ejecución.

Parámetros y argumentos
-----------------------

Algunas de las funciones que hemos visto requieren argumentos. Por ejemplo, cuando llamas 
a `math.sin` pasas un número como argumento. Algunas funciones toman más de un argumento: 
`math.pow` toma dos, la base y el exponente.

Dentro de la función, los argumentos se asignan a las variables llamadas **parámetros**. 
Aquí hay una definición para una función que toma un argumento:

    def print_twice(bruce):
        print(bruce)
        print(bruce)

Esta función asigna el argumento a un parámetro llamado `bruce`. Cuando se llama a la 
función, imprime el valor del parámetro (cualquiera que sea) dos veces.

Esta función funciona con cualquier valor que se pueda imprimir.

    >>> print_twice('Spam')
    Spam
    Spam
    >>> print_twice(42)
    42
    42
    >>> print_twice(math.pi)
    3.14159265359
    3.14159265359
    
Las mismas reglas de composición que se aplican a las funciones incorporadas también se 
aplican a las funciones definidas por el programador, por lo que podemos usar cualquier 
tipo de expresión como argumento para `print_twice`:

    >>> print_twice('Spam ' * 4)
    Spam Spam Spam Spam
    Spam Spam Spam Spam
    >>> print_twice(math.cos(math.pi))
    -1.0
    -1.0

El argumento se evalúa antes de invocar la función, por lo que en los ejemplos las expresiones `'Spam ' * 4` y `math.cos(math.pi) `solo se evalúan una vez.

También puedes usar una variable como argumento:

    >>> michael = 'Eric, the half a bee.'
    >>> print_twice(michael)
    Eric, the half a bee.
    Eric, the half a bee.
    
El nombre de la variable que pasamos como argumento (`michael`) no tiene nada que ver con 
el nombre del parámetro (`bruce`). No importa cómo se llamó el valor en casa (en la 
función que llama); aquí en `print_twice`, llamamos a todos` bruce`.

Variables and parameters are local
----------------------------------

Glosario
--------

Ejercicios
----------


[*Think Python: How to Think Like a Computer Scientist*](http://www.thinkpython2.com)

Copyright (c)  2015  Allen B. Downey.

License: [Creative Commons Attribution-NonCommercial 3.0 Unported License.](http://creativecommons.org/licenses/by-nc/3.0/)