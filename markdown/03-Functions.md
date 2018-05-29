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

Las variables y los parámetros son locales
------------------------------------------

Cuando crea una variable dentro de una función, esta es **local**, lo que significa que 
solo existe dentro de la función. Por ejemplo:

    def cat_twice(part1, part2):
        cat = part1 + part2
        print_twice(cat)

Esta función toma dos argumentos, los concatena e imprime el resultado dos veces. Aquí hay un ejemplo que lo usa:

    >>> line1 = 'Bing tiddle '
    >>> line2 = 'tiddle bang.'
    >>> cat_twice(line1, line2)
    Bing tiddle tiddle bang.
    Bing tiddle tiddle bang.

Cuando `cat_twice` termina, la variable `cat` se destruye. Si tratamos de imprimirla, 
obtenemos un mensaje de error:

    >>> print(cat)
    NameError: name 'cat' is not defined

Los parámetros también son locales. Por ejemplo, afuera de `print_twice`, no existe algo  
como `bruce`.

Diagramas de pila
-----------------

Para realizar un seguimiento de las variables que se pueden usar, es útil dibujar 
un **diagrama de pila**. Al igual que los diagramas de estado, los diagramas de pila 
muestran el valor de cada variable, pero también muestran la función a la que pertenece 
cada variable.

Cada función está representada por **marco**. Un marco es un cuadro con el nombre de una 
función al lado y los parámetros y variables de la función dentro de él. El diagrama de 
pila para el ejemplo anterior se muestra en la Figura \ [fig.stack \].

![Stack diagram.[]{data-label="fig.stack"}](figs/stack.pdf)

Los marcos están dispuestos en una pila que indica qué función llamó a qué, y así 
sucesivamente. En este ejemplo, `print_twice` fue llamado por `cat_twice`, y `cat_twice` 
fue llamado por `__main__`, que es un nombre especial para el marco superior. Cuando creas 
una variable fuera de cualquier función, pertenece a `__main__`.

Cada parámetro se refiere al mismo valor que su argumento correspondiente. Entonces, 
`part1` tiene el mismo valor que `line1`, `part2` tiene el mismo valor que `line2`, y 
`bruce` tiene el mismo valor que `cat`.

Si se produce un error durante una llamada de función, Python imprime el nombre de
ésta, el nombre de la función que la llamó, y así sucesivamente hasta llegar de regreso a 
`__main__`.

Por ejemplo, si intentas acceder a `cat` desde `print_twice`, obtienes un *error de nombre* (`NameError`):

    Traceback (innermost last):
      File "test.py", line 13, in __main__
        cat_twice(line1, line2)
      File "test.py", line 5, in cat_twice
        print_twice(cat)
      File "test.py", line 9, in print_twice
        print(cat)
    NameError: name 'cat' is not defined

Esta lista de funciones se denomina **trazado inverso** (**traceback**). Te dice en qué 
archivo de programa se produjo el error, qué línea y qué funciones se estaban ejecutando 
en ese momento. También muestra la línea de código que causó el error.

El orden de las funciones en el trazado inverso es el mismo que el orden de los marcos en 
el diagrama de la pila. La función que se está ejecutando actualmente se encuentra en la 
parte inferior.

Funciones fructíferas y funciones vacías
----------------------------------------

Algunas de las funciones que hemos utilizado, como las funciones matemáticas, devuelven 
resultados; a falta de un mejor nombre, las llamaremos **funciones fructíferas**. Otras 
funciones, como `print_twice`, realizan una acción pero no devuelven un valor. Las 
llamaremos **funciones vacías**.

Cuando llamas a una función fructífera, casi siempre quieres hacer algo con el resultado; 
por ejemplo, puede asignarlo a una variable o usarlo como parte de una expresión:
    
    x = math.cos(radians)
    golden = (math.sqrt(5) + 1) / 2

Cuando llamas a una función en modo interactivo, Python muestra el resultado:

    >>> math.sqrt(5)
    2.2360679774997898

¡Pero en un guión, si llamas a una función fructífera por sí misma, el valor de retorno se 
pierde!

    math.sqrt(5)

Este script calcula la raíz cuadrada de 5, pero como no almacena ni muestra el resultado, no es muy útil.

Las funciones vacías pueden mostrar algo en la pantalla o tener algún otro efecto, pero no tienen un valor de retorno. Si asigna el resultado a una variable, obtiene un valor especial llamado `None`.

    >>> result = print_twice('Bing')
    Bing
    Bing
    >>> print(result)
    None

El valor `None` no es lo mismo que la cadena `'None'`. Es un valor especial que tiene su 
propio tipo:

    >>> type(None)
    <class 'NoneType'>

Las funciones que hemos escrito hasta ahora son *vacías*. Comenzaremos a escribir 
funciones fructíferas en algunos capítulos.

¿Por qué funciones?
-------------------

Puede que no esté claro por qué vale la pena dividir un programa en funciones. Hay varias 
razones:

- Crear una nueva función te da la oportunidad de nombrar un grupo de instrucciones, lo 
  que hace que tu programa sea más fácil de leer y depurar.

- Las funciones pueden hacer que un programa sea más pequeño al eliminar el código 
  repetitivo. Más tarde, si haces un cambio, solo tienes que hacerlo en un solo lugar.

- La división de un programa largo en funciones te permite depurar las partes de una en 
  una y luego ensamblarlas en un todo.

- Las funciones bien diseñadas a menudo son útiles para muchos programas. Una vez que 
  escribe y depura uno, puede reutilizarlo.

Depuración
----------

Una de las habilidades más importantes que adquirirás es la depuración. Aunque puede ser 
frustrante, la depuración es una de las partes de la programación más intelectualmente 
rica, desafiante e interesante.

En cierto modo, la depuración es como el trabajo de detective. Te enfrentas a pistas y 
tienes que inferir los procesos y eventos que llevaron a los resultados que ves.

La depuración también es como una ciencia experimental. Una vez que tenga una idea de lo 
que está pasando mal, modifique su programa y vuelva a intentarlo. Si su hipótesis es 
correcta, puede predecir el resultado de la modificación y dar un paso más hacia un 
programa en funcionamiento. Si su hipótesis era incorrecta, tiene que encontrar una nueva. 
Como señaló Sherlock Holmes, "cuando eliminas lo imposible, lo que queda, aunque sea 
improbable, debe ser la verdad". (A. Conan Doyle, *The Sign of Four*)

Para algunas personas, la programación y la depuración son la misma cosa. Es decir, la 
programación es el proceso de depuración gradual de un programa hasta que haga lo que uno 
desea. La idea es que debes comenzar con un programa que funcione y realizar pequeñas 
modificaciones, depurándolo a medida que avanzas.

Por ejemplo, Linux es un sistema operativo que contiene millones de líneas de código, pero 
comenzó como un simple programa que Linus Torvalds utilizó para explorar el chip Intel 
80386. Según Larry Greenfield, "Uno de los proyectos anteriores de Linus era un programa 
que cambiaría entre imprimir AAAA y BBBB. Esto evolucionó luego a Linux." 
(*The Linux Users’ Guide* Beta Version 1).

Glosario
--------

función:

:   Una secuencia de declaraciones con nombre que realiza alguna operación útil. Las funciones pueden o no tomar argumentos y pueden o no producir un resultado.

definición de la función:

:   Una instrucción que crea una nueva función, especificando su nombre, parámetros y las instrucciones que contiene.

objeto de función:

:   Un valor creado por una definición de función. El nombre de la función es una variable que hace referencia a un objeto de función.

encabezado:

:   La primera línea de una definición de función.

cuerpo:

:   La secuencia de instrucciones dentro de una definición de función.

parámetro:

:   Un nombre utilizado dentro de una función para referirse al valor pasado como argumento.

Llamada de función:

:   Una instrucción que ejecuta una función. Consiste en el nombre de la función seguido de una lista de argumentos entre paréntesis.

argumento:

:   Un valor proporcionado a una función cuando se llama a la función. Este valor se asigna al parámetro correspondiente en la función.

variable local:

:   Una variable definida dentro de una función. Una variable local solo puede usarse dentro de su función.

valor de retorno:

:   El resultado de una función. Si una llamada a función se usa como una expresión, el valor de retorno es el valor de la expresión.

función fructífera:

:   Una función que devuelve un valor.

función vacía:

:   Una función que siempre devuelve `None`.

`None`:

:   Un valor especial devuelto por las funciones vacías.

módulo:

:   Un archivo que contiene una colección de funciones relacionadas y otras definiciones.

instrucción de importación:

:   Una instrucción que lee un archivo de módulo y crea un objeto de módulo.

objeto de módulo:

:   Un valor creado por una instrucción `import` que proporciona acceso a los valores definidos en un módulo.

notación de punto:

:   La sintaxis para llamar a una función en otro módulo especificando el nombre del módulo seguido de un punto y el nombre de la función.

composición:

:   Usar una expresión como parte de una expresión más grande, o una declaración como parte de una declaración más grande.

flujo de ejecución:

:   El orden en que las instrucciones se ejecutan.

diagrama de pila:

:   Una representación gráfica de una pila de funciones, sus variables y los valores a los que se refieren.

marco:

:   Un cuadro en un diagrama de pila que representa una llamada a función. Contiene las variables locales y los parámetros de la función.

trazado inverso:

:   Una lista de las funciones que se están ejecutando, impresas cuando ocurre un error.

Ejercicios
----------

### Ejercicio 1

Escribe una función llamada `right_justify` que toma una cadena llamada `s` como parámetro 
e imprime la cadena con suficientes espacios iniciales para que la última letra de la 
cadena esté en la columna 70 de la pantalla.

    >>> right_justify('monty')
                                                                     monty

Sugerencia: utilice la concatenación de cadenas y la repetición. Además, Python 
proporciona una función integrada llamada `len` que devuelve la longitud de una cadena, 
por lo que el valor de `len ('monty')` es 5.

### Ejercicio 2

Un objeto de función es un valor que puede asignar a una variable o pasar como un 
argumento. Por ejemplo, `do_twice` es una función que toma un objeto de función como 
argumento y lo llama dos veces:

    def do_twice(f):
        f()
        f()

Aquí hay un ejemplo que usa `do_twice` para llamar a una función llamada `print_spam` dos 
veces.

    def print_spam():
        print('spam')

    do_twice(print_spam)

1. Escribe este ejemplo en un script y pruébelo.

2. Modifica `do_twice` para que tome dos argumentos, un objeto de función y un valor, y llama a la función dos veces, pasando el valor como un argumento.

3. Copia la definición de `print_twice` de este capítulo a tu script.

4. Utiliza la versión modificada de `do_twice` para llamar `print_twice` dos veces, pasando `'spam'` como argumento.

5. Defina una nueva función llamada `do_four` que toma un objeto de función y un valor y 
llama a la función cuatro veces, pasando el valor como parámetro. Debería haber solo dos 
enunciados en el cuerpo de esta función, no cuatro.

Solution: <http://thinkpython2.com/code/do_four.py>.

### Ejercicio 3

Nota: Este ejercicio debe hacerse usando solo las instrucciones y otras características 
que hemos aprendido hasta ahora.

1. Escribe una función que dibuje una cuadrícula como la siguiente:

        + - - - - + - - - - +
        |         |         |
        |         |         |
        |         |         |
        |         |         |
        + - - - - + - - - - +
        |         |         |
        |         |         |
        |         |         |
        |         |         |
        + - - - - + - - - - +

    Sugerencia: para imprimir más de un valor en una línea, puede imprimir en una 
    secuencia de valores separados por comas:

        print('+', '-')

    Por defecto, `print` avanza a la siguiente línea, pero puede anular ese comportamiento 
    y poner un espacio al final, como este:

        print('+', end=' ')
        print('-')

    La salida de estas instrucciones es `'+ -'` en la misma línea. El resultado de la 
    próxima instrucción de impresión comenzaría en la siguiente línea.

2. Escribe una función que dibuje una cuadrícula similar con cuatro filas y cuatro 
   columnas.

Solución: <http://thinkpython2.com/code/grid.py>. Crédito: Este ejercicio se basa en un 
ejercicio de Oualline, *Practical C Programming, Third Edition*, O’Reilly Media, 1997.

[*Think Python: How to Think Like a Computer Scientist*](http://www.thinkpython2.com)

Copyright (c)  2015  Allen B. Downey.

License: [Creative Commons Attribution-NonCommercial 3.0 Unported License.](http://creativecommons.org/licenses/by-nc/3.0/)