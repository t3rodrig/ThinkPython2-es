Variables, expresiones y declaraciones
======================================

Una de las características más potentes de un lenguaje de programación es la 
capacidad de manipular [**variables**]{}. Una variable es un nombre que se 
refiere a un valor.

Declaraciones de asignación {#variables}
---------------------------

Un [**declaración de asignación**]{} crea una nueva variable y le da un valor:

    >>> message = 'And now for something completely different'
    >>> n = 17
    >>> pi = 3.141592653589793

Este ejemplo hace tres asignaciones. El primero asigna una cadena a una nueva 
variable llamada [`message`]{}; el segundo da el entero [17]{} a [`n`]{}; el 
tercero asigna el valor (aproximado) de $\pi$ a [`pi`]{}.

Una forma común de representar variables en papel es escribir el nombre con una 
flecha que apunta a su valor. Este tipo de figura se denomina [**diagrama de estado**]{} 
porque muestra en qué estado se encuentra cada una de las variables (piénselo como 
el estado de ánimo de la variable). La figura \[fig.state2\] muestra el resultado 
del ejemplo anterior.

![Diagrama de estado.[]{data-label="fig.state2"}](figs/state2.pdf)

Nombres de variables
--------------------

Los programadores generalmente eligen nombres para sus variables que son 
significativos, documentan para qué se usa la variable.

Los nombres de variables pueden ser tan largos como desee. Pueden contener 
letras y números, pero no pueden comenzar con un número. Es legal usar letras 
mayúsculas, pero es convencional usar solo minúsculas para los nombres de variables.

El carácter de subrayado, `_`, puede aparecer en un nombre. A menudo se usa en 
nombres con varias palabras, como `tu_nombre` o `rapidez_de_la_luz`.

Si asigna a una variable un nombre ilegal, obtendrá un error de sintaxis:

    >>> 76trombones = 'big parade'
    SyntaxError: invalid syntax
    >>> more@ = 1000000
    SyntaxError: invalid syntax
    >>> class = 'Advanced Theoretical Zymurgy'
    SyntaxError: invalid syntax

[`76trombones`]{} es ilegal porque comienza con un número. [`more@`]{} es ilegal 
porque contiene un carácter ilegal, [`@`]{}. ¿Pero qué pasa con [`class`]{}?

Resulta que [`class`]{} es una de las [**palabras clave**]{} de Python. El 
intérprete usa palabras clave para reconocer la estructura del programa, y no 
se pueden usar como nombres de variables.

Python 3 tiene estas palabras clave:

    False      class      finally    is         return
    None       continue   for        lambda     try
    True       def        from       nonlocal   while
    and        del        global     not        with
    as         elif       if         or         yield
    assert     else       import     pass
    break      except     in         raise

No tienes que memorizar esta lista. En la mayoría de los entornos de desarrollo, 
las palabras clave se muestran en un color diferente; si intentas usar una como 
nombre de variable, lo sabrás.

Expresiones y instrucciones
---------------------------

Una [**expresión**]{} es una combinación de valores, variables y operadores. 
Un valor en sí mismo se considera una expresión, y también lo es una variable, 
por lo que las siguientes son todas expresiones legales:

    >>> 42
    42
    >>> n
    17
    >>> n + 25
    42

Cuando escribes una expresión en una sesión interactiva de Python, el intérprete 
la [**evalúa**]{}, lo que significa que encuentra el valor de la expresión. 
En este ejemplo, [`n`]{} tiene el valor 17 y [`n + 25`]{} tiene el valor 42.

Una [**instrucción**]{} es una unidad de código que tiene un efecto, como crear 
una variable o mostrar un valor.

    >>> n = 17
    >>> print(n)
    
La primera línea es una instrucción de asignación que da un valor a [`n`]{}. 
La segunda línea es una instrucción de impresión que muestra el valor de [`n`]{}.

Cuando escribe una instrucción, el intérprete [**realiza**]{}, lo que significa 
que hace lo que dice la instrucción. En general, las instrucción no tienen valores.

Modo Script
-----------

Hasta ahora hemos utilizado Python en [**modo interactivo**]{}, lo que significa 
que usted interactúa directamente con el intérprete. El modo interactivo es una 
buena forma de comenzar, pero si trabajas con más de unas pocas líneas de código, 
puede ser fastidioso.

La alternativa es guardar el código en un archivo llamado [**script**]{} y luego 
utilizar el intérprete en [**modo script**]{} para ejecutar el script. Por 
convención, los scripts de Python tienen nombres que terminan en [`.py`]{}.

Si sabes cómo crear y ejecutar un script en tu computadora, ya puedes hacerlo. 
De lo contrario, recomiendo usar PythonAnywhere nuevamente. He publicado 
instrucciones para ejecutar en modo script en <http://tinyurl.com/thinkpython2e>.

Como Python proporciona ambos modos, puedes probar bits de código en el modo interactivo
antes de ponerlos en un script. Pero existen diferencias entre el modo interactivo 
y el modo de secuencia de comandos que pueden ser confusos.

Por ejemplo, si estás usando Python como calculadora, puedes escribir

    >>> miles = 26.2
    >>> miles * 1.61
    42.182

La primera línea asigna un valor a [`miles`]{}, pero no tiene ningún efecto visible. 
La segunda línea es una expresión, por lo que el intérprete la evalúa y muestra el
resultado. Resulta que un maratón es de aproximadamente 42 kilómetros.

Pero si escribes el mismo código en un script y lo ejecutas, no obtendrás ningún 
resultado. En el modo script, una expresión, por sí misma, no tiene efecto visible. 
Python realmente  evalúa la expresión, pero no muestra el valor a menos que tú se lo 
digas:

    miles = 26.2
    print(miles * 1.61)

Este comportamiento puede ser confuso al principio.

Un script generalmente contiene una secuencia de instrucciones. Si hay más de una 
instrucción, los resultados aparecen de uno en uno a medida que se ejecutan las 
instrucciones.

Por ejemplo, el script

    print(1)
    x = 2
    print(x)
    
produce la salida

    1
    2

La instrucción de asignación no produce salida.

Para verificar tu comprensión, escribe las siguientes instrucciones en el intérprete 
de Python y ve lo que hacen:

    5
    x = 5
    x + 1

Ahora pon las mismas instrucciones en un script y ejecútalo. ¿Cuál es el resultado? 
Modifica el script transformando cada expresión en una instrucción de impresión y 
luego ejecútalo nuevamente.

Orden de operaciones
--------------------

Cuando una expresión contiene más de un operador, el orden de la evaluación depende 
del [**orden de las operaciones**]{}. Para operadores matemáticos, Python sigue la
convención matemática. Las reglas son las siguientes:

- Los **Paréntesis** tienen la precedencia más alta y se pueden usar para forzar 
  una expresión para evaluar en el orden que desee. Ya que
  las expresiones entre paréntesis se evalúan primero, `2 * (3-1)` es 4,
  y `(1 + 1)**(5-2)` es 8. También puedes usar paréntesis para hacer un
  expresión más fácil de leer, como en `(minuto * 100) / 60`, incluso si
  no cambia el resultado.

- La **Exponenciación** tiene la siguiente precedencia más alta, por lo que 
  `1 + 2**3` es 9, no 27, y `2 * 3**2` es 18, no 36.

- La **Multiplicación** y la **División** tienen mayor precedencia
    que la **Suma** y la **Resta**. Entonces `2 * 3-1` es 5,
    no 4, y `6 + 4/2` es 8, no 5.

- Los operadores con la misma precedencia se evalúan de izquierda a derecha
  (excepto exponenciación). Entonces, en la expresión `degrees / 2 * pi`,
  la división ocurre primero y el resultado se multiplica por `pi`.
  Para dividir por $2\pi$, puede usar paréntesis o escribir 
  `grados / 2 / Pi`.

No te preocupes por recordar la precedencia de los operadores.
Si no puedes decirlo mirando la expresión, usa paréntesis para hacerlo
obvio.

Operaciones con cadenas de texto
--------------------------------

En general, no puedes realizar operaciones matemáticas con cadenas, incluso si 
las cadenas se parecen a números, por lo que las siguientes operaciones son ilegales:

    '2'-'1'    'eggs'/'easy'    'third'*'a charm'

Pero hay dos excepciones, `+` y `*`.

El operador `+` realiza [**concatenación**]{}, lo que significa que junta las cadenas 
uniéndolas de extremo a extremo. Por ejemplo:

    >>> first = 'throat'
    >>> second = 'warbler'
    >>> first + second
    throatwarbler
    
El operador `*` también funciona en cadenas; realiza repetición. Por ejemplo, 
`'Spam' * 3` es` 'SpamSpamSpam'`. Si uno de los valores es una cadena, el otro tiene 
que ser un número entero.

Este uso de `+` y `*` tiene sentido por analogía con la suma y la multiplicación. 
Así como `4 * 3` es equivalente a `4 + 4 + 4`, esperamos `'Spam'*3` que sea lo mismo que
`'Spam'+'Spam'+'Spam'`, y lo es. Por otro lado, hay una forma significativa en que la
concatenación y la repetición de cadenas son diferentes de la suma y multiplicación de
enteros. ¿Puedes pensar en una propiedad que la suma tiene pero la concatenación de cadenas no?

Comentarios
-----------

A medida que los programas crecen y se vuelven más complicados, se vuelven más difíciles 
de leer. Los lenguajes formales son densos, y a menudo es difícil mirar un fragmento de 
código y descubrir qué está haciendo o por qué.

Por esta razón, es una buena idea agregar notas a sus programas para explicar en lenguaje 
natural lo que está haciendo el programa. Estas notas se llaman [**comentarios**]{}, y 
comienzan con el símbolo `#`:

    # calcula el porcentaje de la hora que ha transcurrido
    percentage = (minute * 100) / 60

En este caso, el comentario aparece solo en una línea. También puedes poner comentarios 
al final de una línea:

    percentage = (minute * 100) / 60     # percentage of an hour

Todo, desde `#` hasta el final de la línea, se ignora, no tiene ningún efecto en la 
ejecución del programa.

Los comentarios son más útiles cuando documentan características no obvias del código. Es 
razonable suponer que el lector puede descubrir **qué** hace el código; es más útil para explicar **por qué**.

Este comentario es redundante con el código e inútil:

    v = 5     # assign 5 to v

Este comentario contiene información útil que no está en el código:

    v = 5     # velocity in meters/second. 

La elección adecuada para los nombres de variables puede reducir la necesidad de 
comentarios, pero los nombres largos pueden dificultar la lectura de expresiones 
complejas, por lo que hay una compensación.

Depuración
----------

Tres tipos de errores pueden ocurrir en un programa: errores de sintaxis, errores de 
tiempo de ejecución y errores semánticos. Es útil distinguirlos para rastrearlos más 
rápidamente.

Error de sintaxis:

:   "Sintaxis" se refiere a la estructura de un programa y las reglas sobre esa 
    estructura. Por ejemplo, los paréntesis deben venir en parejas iguales, entonces 
    `(1 + 2)` es legal, pero `8)` es un **error de sintaxis**.

    Si hay un error de sintaxis en cualquier parte de su programa, Python muestra un 
    mensaje de error y se cierra, y no podrá ejecutar el programa. Durante las primeras 
    semanas de su carrera de programación, puede pasar mucho tiempo rastreando los 
    errores de sintaxis. A medida que gane experiencia, hará menos errores y los 
    encontrará más rápido.

Error de tiempo de ejecución:

:   El segundo tipo de error es un error de tiempo de ejecución, llamado así porque el 
    error no aparece hasta después de que el programa haya comenzado a ejecutarse. Estos 
    errores también se llaman [**excepciones**]{} porque generalmente indican que algo 
    excepcional (y malo) ha sucedido.

    Los errores de tiempo de ejecución son raros en los programas simples que verá en los 
    primeros capítulos, por lo que podría pasar un tiempo antes de que encuentre uno.

Error semántico:

:   El tercer tipo de error es "semántico", lo que significa relacionado con el 
    significado. Si hay un error semántico en su programa, se ejecutará sin generar 
    mensajes de error, pero no hará lo correcto. Hará algo más. Específicamente, hará lo 
    que le dijo que hiciera.

    La identificación de errores semánticos puede ser difícil porque requiere que trabajes 
    hacia atrás mirando el resultado del programa y tratando de descubrir qué está 
    haciendo.

Glosario
--------

variable:

:   Un nombre que se refiere a un valor.

asignación:

:   Una instrucción que asigna un valor a una variable.

diagrama de estado:

:   Una representación gráfica de un conjunto de variables y los valores a los que se 
    refieren.

palabra clave:

:   Una palabra reservada que se utiliza para analizar un programa; no puede utilizar
    palabras clave como `if`, `def` y `while` como nombres de variables.

operando:

:   Uno de los valores en los que opera un operador.

expresión:

:   Una combinación de variables, operadores y valores que representa un único resultado.

evaluar:

:   Simplificar una expresión realizando las operaciones para producir un solo valor.

declaración:

: Una sección de código que representa un comando o acción. Hasta ahora, el
    las declaraciones que hemos visto son asignaciones e instrucciones de impresión.

ejecutar:

: Para ejecutar una declaración y hacer lo que dice.

modo interactivo:

: Una forma de usar el intérprete de Python escribiendo el código en el prompt.

modo de secuencia de comandos:

: Una forma de usar el intérprete de Python para leer código de un script y
    ejecutarlo.

guión:

: Un programa almacenado en un archivo.

Orden de operaciones:

: Reglas que rigen el orden en que las expresiones involucran múltiples
    operadores y operandos son evaluados.

concatenar:

: Unir dos operandos de extremo a extremo.

comentario:

: Información en un programa destinado a otros programadores (o
    cualquiera que lea el código fuente) y no tiene ningún efecto en la ejecución
    Del programa.

error de sintaxis:

: Un error en un programa que hace imposible analizar (y
    por lo tanto, imposible de interpretar).

excepción:

: Un error que se detecta mientras el programa se está ejecutando.

semántica:

: El significado de un programa.

error semántico:

: Un error en un programa que lo hace hacer algo diferente a lo que
    programador previsto.

Ejercicios
----------

Repitiendo mi consejo del capítulo anterior, cada vez que aprenda una nueva característica, debe probarla en modo interactivo y cometer errores a propósito para ver qué falla.

- Hemos visto que `n = 42` es legal. ¿Qué pasa con `42 = n`?

- ¿Qué tal `x = y = 1`?

- En algunos lenguajes de programación, cada instrucción termina con un punto y coma, `;`. 
  ¿Qué sucede si pones un punto y coma al final de una instrucción de Python?

- ¿Qué pasa si pones un punto al final de una instrucción?

- En notación matemática puedes multiplicar $x$ y $y$ así: 
  $x y$. ¿Qué pasa si pruebas eso en Python?
  
Practica usando el intérprete de Python como una calculadora:

1. El volumen de una esfera con radio $r$ es $\frac{4}{3} \pi r^3$. 
   ¿Cuál es el volumen de una esfera con radio 5?

2. Supongamos que el precio de portada de un libro es \$24.95, pero las librerías 
   obtienen un 40% de descuento. El costo de envío es \$3 por la primera copia y 75 
   centavos por cada copia adicional. ¿Cuál es el costo total al por mayor de 60 copias?

3. Si salgo de mi casa a las 6:52 a.m. y corro 1 milla a un ritmo tranquilo 
   (8:15 por milla), luego 3 millas a ritmo regular (7:12 por milla) y 1 milla a un 
   ritmo tranquilo otra vez, ¿a qué hora llego a casa para el desayuno?


[*Think Python: How to Think Like a Computer Scientist*](http://www.thinkpython2.com)

Copyright (c)  2015  Allen B. Downey.

License: [Creative Commons Attribution-NonCommercial 3.0 Unported License.](http://creativecommons.org/licenses/by-nc/3.0/)