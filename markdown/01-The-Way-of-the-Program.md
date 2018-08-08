El camino del programa
======================

El objetivo de este libro es enseñarte a pensar como un científico de la computación. Esta 
forma de pensar combina algunas de las mejores características de las matemáticas, la 
ingeniería y las ciencias naturales. Al igual que los matemáticos, los científicos 
informáticos utilizan los lenguajes formales para denotar ideas. Al igual que los 
ingenieros, diseñan cosas, ensamblan componentes en los sistemas y evalúan la 
ganancia-pérdida entre las alternativas. Al igual que los científicos, observan el 
comportamiento de sistemas complejos, forman hipótesis y prueban predicciones.

La habilidad más importante para un científico de la computación es **resolver 
problemas**. La resolución de problemas significa la capacidad de formular problemas, 
pensar creativamente sobre soluciones y expresar una solución clara y precisa. Como 
resultado, el proceso de aprender a programar es una excelente oportunidad para practicar 
habilidades de resolución de problemas. Es por eso que este capítulo se llama "El camino 
del programa".

En un nivel, aprenderás a programar, una habilidad útil en sí misma. En otro nivel, 
utilizarás la programación como un medio para un fin. A medida que avancemos, ese fin se 
volverá más claro.

¿Qué es un programa?
--------------------

Un **programa** es una secuencia de instrucciones que especifica cómo realizar un cálculo. 
El cálculo puede ser algo matemático, como resolver un sistema de ecuaciones o encontrar 
las raíces de un polinomio, pero también puede ser un cálculo simbólico, como buscar y 
reemplazar texto en un documento o algo gráfico, como procesar una imagen o jugar un 
video.

Los detalles se ven diferentes en diferentes lenguajes de programación, pero algunas 
instrucciones básicas aparecen en casi todos los lenguajes:

entrada:

:   Obtener datos del teclado, un archivo, la red o algún otro dispositivo.

salida:

:   Visualizar los datos en la pantalla, guárdarlos en un archivo, envíarlos a través de 
    la red, etc.

matemáticas:

:   Realizar operaciones matemáticas básicas como la suma y la multiplicación.

ejecución condicional:

:   Verificar que existan ciertas condiciones y ejecutar el código apropiado.

repetición:

:   Realizar alguna acción repetidamente, generalmente con alguna variación.

Lo creas o no, eso es todo lo que hay que hacer. Cada programa que hayas usado, sin 
importar cuán complicado sea, está compuesto por instrucciones que se parecen mucho a 
éstas. Entonces, puedes pensar en la programación como el proceso de dividir una tarea 
grande y compleja en subtareas cada vez más pequeñas hasta que las subtareas sean lo 
suficientemente simples como para realizarse con una de estas instrucciones básicas.

Ejecutando *Python*
-------------------

Uno de los desafíos de comenzar con Python es que puede que tengas que instalar Python y 
el software relacionado en tu computadora. Si estás familiarizado con tu sistema 
operativo, y especialmente si te sientes cómodo con la interfaz de línea de comandos, no 
tendrás problemas para instalar Python. Pero para los principiantes, puede ser doloroso 
aprender sobre la administración del sistema y la programación al mismo tiempo.

Para evitar ese problema, te recomiendo que comiences a ejecutar Python en tu navegador. 
Más tarde, cuando estés cómodo con Python, te haré sugerencias para instalar Python en tu 
computadora.

Hay varias páginas web que puedes usar para ejecutar Python. Si ya tienes un favorito, 
adelante y úsalo. De lo contrario, recomiendo 
[PythonAnywhere](https://www.pythonanywhere.com/)
o [Microsoft Azure Notebooks](https://notebooks.azure.com/). Proporciono instrucciones 
detalladas para comenzar en <http://tinyurl.com/thinkpython2e>.

Hay dos versiones de Python, llamadas Python 2 y Python 3. Son muy similares, por lo que 
si aprendes una, es fácil cambiar a la otra. De hecho, solo hay algunas diferencias que 
encontrarás como principiante. Este libro está escrito para Python 3, pero incluyo algunas 
notas sobre Python 2.

El **intérprete** de Python es un programa que lee y ejecuta código Python. Dependiendo de 
tu entorno, puedes iniciar el intérprete haciendo clic en un ícono o escribiendo 
`python` en la línea de comandos. Cuando comienza, deberías ver resultados como este:

    Python 3.4.0 (default, Jun 19 2015, 14:20:21) 
    [GCC 4.8.2] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>>

Las primeras tres líneas contienen información sobre el intérprete y el sistema operativo 
en el que se está ejecutando, por lo que podría ser diferente para ti. Pero deberías 
verificar que el número de versión, que es `3.4.0` en este ejemplo, comienza con 3, lo 
que indica que estás ejecutando Python 3. Si comienza con 2, estás ejecutando (lo 
adivinaste) Python 2.

La última línea es un **prompt** (aviso en español) que indica que el intérprete está 
listo para que ingreses el código. Si escribes una línea de código y presionas Enter, el 
intérprete muestra el resultado:

    >>> 1 + 1
    2

Ahora estás listo para comenzar. A partir de ahora, supongo que sabes cómo iniciar el 
intérprete de Python y ejecutar el código.

El primer programa {#hello}
------------------

Tradicionalmente, el primer programa que escribe en un nuevo lenguaje de programación se 
llama "Hello, World!" Porque todo lo que hace es mostrar las palabras "Hello, World!". En 
Python, se ve así:

    >>> print('Hello, World!')

Este es un ejemplo de una **instrucción de impresión**, aunque en realidad no imprime nada 
en papel. Muestra un resultado en la pantalla. En este caso, el resultado son las palabras

    Hello, World!

Las comillas en el programa marcan el comienzo y el final del texto que se mostrará; estas 
no aparecen en el resultado.

Los paréntesis indican que `print` es una función. Llegaremos a las funciones en el 
Capítulo \[funcchap\].

En Python 2, la instrucción de impresión es ligeramente diferente; no es una función, por 
lo que no usa paréntesis.

    >>> print 'Hello, World!'

Esta distinción tendrá más sentido pronto, pero eso es suficiente para comenzar.

Operadores aritméticos
----------------------

Después de "Hello, World", el siguiente paso es la aritmética. Python proporciona 
**operadores**, que son símbolos especiales que representan operaciones como suma y 
multiplicación.

Los operadores `+`, `-` y `*` realizan sumas, restas y multiplicaciones, como en los 
ejemplos siguientes:

    >>> 40 + 2
    42
    >>> 43 - 1
    42
    >>> 6 * 7
    42

El operador `/` realiza la división:

    >>> 84 / 2
    42.0

Quizás te preguntes por qué el resultado es `42.0` en lugar de `42`. Lo explicaré en la 
siguiente sección.

Finalmente, el operador `**` realiza la exponenciación; es decir, eleva un número a una 
potencia:

    >>> 6**2 + 6
    42

En algunos otros lenguajes, `^` se usa para la exponenciación, pero en Python es un 
operador bit a bit llamado XOR. Si no estás familiarizado con los operadores bit a bit, el 
resultado te sorprenderá:

    >>> 6 ^ 2
    4

No cubriré operadores bit a bit en este libro, pero puedes leer sobre ellos en 
<http://wiki.python.org/moin/BitwiseOperators>.

Valores y tipos
---------------

Un **valor** es una de las cosas básicas con las que trabaja un programa, como una letra o 
un número. Algunos valores que hemos visto hasta ahora son `2`, `42.0` y `'Hello, World!'`.

Estos valores pertenecen a diferentes **tipos**: `2` es un **entero**, `42.0` es un 
**número de punto flotante**, y `'Hello, World!'` es una **cadena**, llamada así porque 
las letras que contiene están unidas.

Si no estás seguro a qué tipo pertenece un valor, el intérprete puede decirte:

    >>> type(2)
    <class 'int'>
    >>> type(42.0)
    <class 'float'>
    >>> type('Hello, World!')
    <class 'str'>
    
En estos resultados, la palabra "class" se usa en el sentido de una categoría; un tipo es 
una categoría de valores.

No es de sorprender que los enteros pertenecen al tipo `int`, las cadenas al tipo 
`str` y  los números de punto flotante al tipo `float`.

¿Qué pasa con los valores como `'2'` y` '42 .0'`? Parecen números, pero están entre 
comillas como cadenas.

    >>> type('2')
    <class 'str'>
    >>> type('42.0')
    <class 'str'>
    
Son cadenas de texto.

Cuando escribes un número entero grande, es posible que tengas la tentación de usar comas 
entre grupos de dígitos, como en `1,000,000`. Este no es un *entero* en Python, pero 
es expresión válida:

    >>> 1,000,000
    (1, 0, 0)

¡Eso no es lo que esperábamos en absoluto! Python interpreta `1,000,000` como una 
secuencia de enteros separados por comas. Aprenderemos más sobre este tipo de secuencia 
más adelante.

Lenguajes formales y naturales
------------------------------

Los **lenguajes naturales** son los idiomas que hablan las personas, como inglés, español 
y francés. No fueron diseñados por personas (aunque las personas intentan imponerles algún 
orden); evolucionaron naturalmente.

Los **lenguajes formales** son idiomas diseñados por personas para aplicaciones 
específicas. Por ejemplo, la notación que usan los matemáticos es un lenguaje formal que 
es particularmente bueno para denotar relaciones entre números y símbolos. Los químicos 
usan un lenguaje formal para representar la estructura química de las moléculas. Y más 
importante:

> **Los lenguajes de programación son lenguajes formales que han sido diseñados para 
> expresar cálculos.**

Los lenguajes formales tienen reglas sintácticas estrictas que rigen la estructura de los 
enunciados. Por ejemplo, en matemáticas el enunciado $3 + 3 = 6$ tiene sintaxis correcta, 
pero $3 + = 3 \$ 6$ no la tiene. En química $H_2O$ es una fórmula sintácticamente 
correcta, pero $_2Zz$ no lo es.

Las reglas de sintaxis vienen en dos sabores, pertenecientes a **tokens** (unidades en español) y estructura. 
Los tokens son los elementos básicos del lenguaje, como palabras, números y elementos 
químicos. Uno de los problemas con $3 + = 3 \$ 6$ es que $ \$ $ no es un token legal en 
matemáticas (al menos hasta donde sé). Del mismo modo, $_2Zz$ no es legal porque no hay 
ningún elemento con la abreviación $Zz$.

El segundo tipo de regla de sintaxis se refiere a cómo se combinan los tokens. La ecuación 
$3 + = 3$ es ilegal porque aunque $+$ y $=$ son tokens legales, no puedes tener uno justo 
después del otro. De manera similar, en una fórmula química, el subíndice viene después 
del nombre del elemento, no antes.

Est@ es una oración en inglé\$ bien estructurada con t\*kens no válidos.
Esta oración todos los tokens válidos tiene, pero inválida la estructura.

Cuando lees una oración en inglés o una declaración en un lenguaje formal, tienes que 
descubrir la estructura (aunque en un lenguaje natural lo haces inconscientemente). Este 
proceso se llama **parsing** (análisis en español).

Si bien los lenguajes formales y naturales tienen muchas características en común (símbolos, estructura y sintaxis), existen algunas diferencias:

ambigüedad:

:   Los lenguajes naturales están llenos de ambigüedad, que las personas manejan mediante 
    el uso de pistas contextuales y otra información. Los lenguajes formales están 
    diseñados para ser casi o completamente inequívocos, lo que significa que cualquier 
    enunciado tiene exactamente un significado, independientemente del contexto.

redundancia:

:   Con el fin de compensar la ambigüedad y reducir los malentendidos, los lenguajes 
    naturales emplean mucha redundancia. Como resultado, a menudo son detallados. Los 
    lenguajes formales son menos redundantes y más concisos.

literalidad:

:   Los lenguajes naturales están llenos de modismos y metáforas. Si digo: "Me cayó el 
    veinte", probablemente no haya ni una moneda ni nada que caiga (este modismo significa 
    que alguien entendió algo después de un período de confusión). Los lenguajes formales 
    significan exactamente lo que dicen.

Debido a que todos crecemos hablando idiomas naturales, a veces es difícil adaptarse a los 
idiomas formales. La diferencia entre el lenguaje formal y el natural es como la 
diferencia entre poesía y prosa, pero más aún:

Poesía:

:   Las palabras se usan tanto por sus sonidos como por sus significados, y todo el poema 
    en conjunto crea un efecto o respuesta emocional. La ambigüedad no es solo común sino 
    a menudo deliberada.

Prosa:

:   El significado literal de las palabras es más importante, y la estructura aporta más 
    significado. La prosa es más susceptible de análisis que la poesía, pero a menudo 
    ambigua.

Programas:

:   El significado de un programa de computadora no es ambiguo y literal, y puede 
    entenderse completamente mediante el análisis de los tokens y la estructura.

Los lenguajes formales son más densos que los lenguajes naturales, por lo que lleva más 
tiempo leerlos. Además, la estructura es importante, por lo que no siempre es mejor leer 
de arriba a abajo, de izquierda a derecha. En cambio, aprende a analizar el programa en tu 
cabeza, identificando los tokens e interpretando la estructura. Finalmente, los detalles 
importan. Pequeños errores en la ortografía y la puntuación, pueden marcar una gran 
diferencia en un lenguaje formal.

Depuración
----------

Los programadores cometen errores. Por razones caprichosas, los errores de programación se 
llaman **_bugs_** y el proceso de rastrearlos se llama **depuración** (_debugging_).

La programación, y especialmente la depuración, a veces pone de manifiesto emociones 
fuertes. Si estás luchando con un error difícil, puedes sentirte enojado, abatido o 
avergonzado.

Existe evidencia de que las personas responden naturalmente a las computadoras como si 
fueran personas. Cuando funcionan bien, las consideramos compañeras de equipo, y cuando 
son obstinadas o groseras, les respondemos de la misma manera que respondemos a personas 
groseras y obstinadas (Reeves y Nass, *The Media Equation: How People Treat Computers, 
Television, and New Media Like Real People and Places*).

Prepararse para estas reacciones puede ayudarte a lidiar con ellas. Un enfoque es pensar 
en la computadora como un empleado con ciertas fortalezas, como la rapidez y la precisión, 
y debilidades particulares, como la falta de empatía y la incapacidad de captar el 
panorama general.

Tu trabajo es ser un buen administrador: encuentra maneras de aprovechar las fortalezas y 
mitigar las debilidades. Y encuentra maneras de usar tus emociones para enfrentar el 
problema, sin permitir que tus reacciones interfieran con tu capacidad para trabajar de 
manera efectiva.

Aprender a depurar puede ser frustrante, pero es una habilidad valiosa que es útil para 
muchas actividades más allá de la programación. Al final de cada capítulo, hay una 
sección, como esta, con sugerencias para la depuración. ¡Espero que ayuden!

Glosario
--------

Solución de problemas:

:   El proceso de formular un problema, hallar la solución y expresarla.

Lenguaje de alto nivel:

:   Un lenguaje como Python que es diseñado para ser fácil de leer y
    escribir por la gente.

Lenguaje de bajo nivel:

:   Un lenguaje de programación que es diseñado para ser fácil de
    ejecutar para una computadora; también se lo llama "lenguaje de
    máquina" o "lenguaje ensamblador".

Portabilidad:

:   La cualidad de un programa que puede ser ejecutado en más de un tipo
    de computadora.

Intérprete:

:   Un programa que lee otro programa y lo ejecuta.

Prompt:

:   Caracteres mostrados por el intérprete para indicar que está listo
    para recibir información del usuario.

Programa:

:   Un grupo de instrucciones que especifica un cómputo.

Declaración print:

:   Una instrucción que hace que el intérprete de Python muestre un
    valor en la pantalla.

Operador:

:   Un símbolo especial que representa un cálculo simple como adición,
    multiplicación o concatenación de cadenas.

Valor:

:   Una de las unidades básicas de datos, como un número o cadena, que
    un programa manipula.

Tipo:

:   Una categoría de valores. Los tipos que hemos visto hasta ahora son enteros 
    (tipo `int`), números de punto flotante (tipo `float`) y cadenas (tipo `str`).

Entero:

:   Un tipo que representa números enteros.

Punto flotante:

:   Un tipo que representa números con partes fraccionarias.

Cadena :

:   Un tipo que representa secuencias de caracteres.

Lenguaje natural:

:   Cualquiera de los idiomas que habla la gente que evolucionó naturalmente.

Lenguaje formal:

:   Cualquiera de los idiomas que la gente ha diseñado para fines específicos, 
    como representar ideas matemáticas o programas de computadora; todos los 
    lenguajes de programación son lenguajes formales.

Token (unidad):

:   Uno de los elementos básicos de la estructura sintáctica de un
    programa, análogo a una palabra en un lenguaje natural.

Sintaxis:

:   Las reglas que rigen la estructura de un programa.

Análisis sintáctico:

:   Examinar un programa y analizar la estructura sintáctica.

Error (bug):

:   Un error en un programa.

Depuración:

:   El proceso de encontrar y corregir errores.

Guión (script):

:   Un programa archivado (que va a ser interpretado).

Ejercicios
----------

### Ejercicio 1

Es una buena idea leer este libro frente a una computadora para que puedas probar los 
ejemplos sobre la marcha.

Cada vez que experimentes con una nueva característica, debes intentar cometer errores. 
Por ejemplo, en el programa "¡Hola, mundo!", ¿Qué sucede si omites una de las comillas? 
¿Qué pasa si omites ambas? ¿Qué pasa si deletreas `print` mal?

Este tipo de experimento te ayuda a recordar lo que lees; también ayuda cuando estás 
programando, porque sabes lo que significan los mensajes de error. Es mejor cometer 
errores ahora y a propósito que tarde y accidentalmente.

1.  En una instrucción `print`, ¿qué sucede si omites uno de los paréntesis, o ambos?

2.  Si estás tratando de imprimir una cadena, ¿qué sucede si omites una de las comillas, o 
    ambas?

3.  Puedes usar un signo menos para hacer un número negativo como `-2`. 
    ¿Qué sucede si pones un signo más antes de un número? 
    ¿Qué pasa con `2++2`?

4.  En notación matemática, los ceros a la izquierda están bien, como en `02`. ¿Qué pasa 
    si pruebas esto en *Python*?

5.  ¿Qué sucede si tienes dos valores sin operador entre ellos?

### Ejercicio 2

Inicia el intérprete de Python y úsalo como una calculadora.

1.  ¿Cuántos segundos hay en 42 minutos y 42 segundos?

2.  ¿Cuántas millas hay en 10 kilómetros? Sugerencia: hay 1.61 kilómetros en una milla.

3.  Si corres una carrera de 10 kilómetros en 42 minutos y 42 segundos, ¿cuál es tu ritmo 
    promedio (tiempo por milla en minutos y segundos)? ¿Cuál es tu rapidez promedio en 
    millas por hora?

[*Think Python: How to Think Like a Computer Scientist*](http://www.thinkpython2.com)

Copyright (c)  2015  Allen B. Downey.

License: [Creative Commons Attribution-NonCommercial 3.0 Unported License.](http://creativecommons.org/licenses/by-nc/3.0/)
