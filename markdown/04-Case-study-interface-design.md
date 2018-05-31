Estudio de caso: diseño de interfaz
===================================

Este capítulo presenta un estudio de caso que demuestra un proceso para diseñar funciones 
que funcionan juntas.

Introduce el módulo `turtle`, que te permite crear imágenes usando gráficos de tortuga. El 
módulo `turtle` está incluido en la mayoría de las instalaciones de Python, pero si está 
ejecutando Python usando PythonAnywhere, no podrá ejecutar los ejemplos de tortuga (no se 
podía cuando escribí esto).

Si ya ha instalado Python en su computadora, debería poder ejecutar los ejemplos. De lo 
contrario, ahora es un buen momento para instalar. He publicado instrucciones en 
<http://tinyurl.com/thinkpython2e>.

Los ejemplos de código de este capítulo están disponibles en
<http://thinkpython2.com/code/polygon.py>.

El módulo `turtle`
------------------

Para verificar si tienes el módulo `tortuga`, abre el intérprete de Python y escribe

    >>> import turtle
    >>> bob = turtle.Turtle()
    
Cuando ejecutas este código, se crea una nueva ventana con una pequeña flecha que 
represente a la tortuga. Cierra la ventana

Crea un archivo llamado `mypolygon.py` y escribe el siguiente código:

    import turtle
    bob = turtle.Turtle()
    print(bob)
    turtle.mainloop()

El módulo `turtle` (con una 't' minúscula) proporciona una función llamada `Turtle` (con 
una 'T' mayúscula) que crea un objeto *Turtle*, que asignamos a una variable llamada 
`bob`. Imprimir `bob` muestra algo como:

    <turtle.Turtle object at 0xb7bfbf4c>

Esto significa que `bob` se refiere a un objeto del tipo `Turtle` como se define en el 
módulo `turtle`.

`mainloop` le dice a la ventana que espere a que el usuario haga algo, aunque en este caso 
no hay mucho que hacer, excepto cerrar la ventana.

Una vez que creas una Tortuga, puedes llamar a un **método** para moverla por la ventana. 
Un método es similar a una función, pero usa una sintaxis ligeramente diferente. Por 
ejemplo, para mover la tortuga hacia adelante:

    bob.fd(100)

El método, `fd`, está asociado con el objeto tortuga al que llamamos` bob`. Llamar a un 
método es como hacer una solicitud: le está pidiendo a `bob` que avance.

El argumento de `fd` es una distancia en píxeles, por lo que el tamaño real depende de tu 
pantalla.

Otros métodos que puedes invocar en una Tortuga son `bk` para retroceder,` lt` para girar 
a la izquierda y `rt` girar a la derecha. El argumento para `lt` y` rt` es un ángulo en 
grados.

Además, cada Tortuga sostiene un bolígrafo, que está abajo o arriba; si la pluma está 
abajo, la Tortuga deja un rastro cuando se mueve. Los métodos `pu` y `pd` representan 
"pluma arriba" y "pluma abajo".

Para dibujar un ángulo recto, agrega estas líneas al programa (después de crear `bob` y 
antes de llamar` mainloop`):

    bob.fd(100)
    bob.lt(90)
    bob.fd(100)

Cuando ejecutas este programa, deberías ver a `bob` moverse al este y luego al norte, 
dejando atrás dos segmentos de línea.

Ahora modifica el programa para dibujar un cuadrado. ¡No continúes hasta que lo tengas 
funcionando!

Repetición simple
-----------------

Es probable que haya escrito algo como esto:

    bob.fd(100)
    bob.lt(90)

    bob.fd(100)
    bob.lt(90)

    bob.fd(100)
    bob.lt(90)

    bob.fd(100)

Podemos hacer lo mismo de forma más concisa con una instrucción `for`. Agregua este 
ejemplo a `mypolygon.py` y ejecútalo de nuevo:

    for i in range(4):
        print('Hello!')

Debería ver algo como esto:

    Hello!
    Hello!
    Hello!
    Hello!

Este es el uso más simple de la instrucción `for`; veremos más más tarde. Pero eso debería 
ser suficiente para permitirle reescribir su programa de dibujo. No continúes hasta que lo 
hagas.

Aquí hay una instrucción `for` que dibuja un cuadrado:

    for i in range(4):
        bob.fd(100)
        bob.lt(90)

La sintaxis de una instrucción `for` es similar a una definición de función. Tiene un 
encabezado que termina con dos puntos y un cuerpo sangrado. El cuerpo puede contener 
cualquier cantidad de instrucciones.

Una instrucción `for` también se denomina **bucle** porque el flujo de ejecución se 
ejecuta a través del cuerpo y luego vuelve a la parte superior. En este caso, ejecuta el 
cuerpo cuatro veces.

Esta versión es en realidad un poco diferente del código de dibujar un cuadrado anterior 
porque hace otro giro después de dibujar el último lado del cuadrado. El giro adicional 
lleva más tiempo, pero simplifica el código si hacemos lo mismo cada vez a través del 
ciclo. Esta versión también tiene el efecto de dejar a la tortuga en la posición inicial, 
mirando hacia la dirección de inicio.

Ejercicios
----------

Lo siguiente es una serie de ejercicios que usan *TurtleWorld*. Están destinados a ser 
divertidos, pero tienen un punto, también. Mientras trabajas en ellos, piensa cuál es el 
punto.

Las siguientes secciones tienen soluciones para los ejercicios, por lo tanto, no mires 
hasta que hayas terminado (o al menos intentado).

1.  Escribe una función llamada `square` que toma un parámetro llamado `t`, que es una 
    tortuga. Debería usar la tortuga para dibujar un cuadrado.

    Escribe una llamada a función que pasa `bob` como un argumento a `square`, y luego 
    ejecuta el programa nuevamente.

2.  Agrega otro parámetro, llamado `length`, a `square`. Modifica el cuerpo para que la 
    longitud de los lados sea `length`, y luego modifica la llamada de función para 
    proporcionar un segundo argumento. Ejecuta el programa de nuevo. Prueba tu programa 
    con un intervalo de valores para `length`.

3.  Haz una copia de `square` y cambia el nombre a `polygon`. Agrega otro parámetro 
    llamado `n` y modifica el cuerpo para que dibuje un polígono regular de $n$ lados. 
    Sugerencia: Los ángulos exteriores de un polígono regular de $n$ lados son $360/n$ 
    degrees.

4.  Escribe una función llamada `circle` que toma una tortuga, `t`, y radio, `r`, como 
    parámetros y que dibuja un círculo aproximado al invocar `polygon` con una longitud y 
    número de lados apropiados. Prueba tu función con un intervalo de valores de `r`.

    Sugerencia: determina la circunferencia del círculo y asegúrate de que 
    `length * n = circumference`.

5.  Haz una versión más general de `circle` llamada `arc` que toma un parámetro adicional 
    `angle`, que determina qué fracción de un círculo dibujar. `angle` está en grados, 
    cuando `angle = 360`, `arc` debe dibujar un círculo completo.

Encapsular
----------

El primer ejercicio te pide que pongas tu código de dibujo cuadrado en una definición de 
función y luego llames a la función, pasando a la tortuga como un parámetro. Aquí hay una 
solución:

    def square(t):
        for i in range(4):
            t.fd(100)
            t.lt(90)

    square(bob)

Las instrucciones más internas, `fd` y `lt`, se sangran dos veces para mostrar que están 
dentro del bucle `for`, que está dentro de la definición de la función. La siguiente 
línea, `square(bob)`, está alineada con el margen izquierdo, que indica el final del ciclo 
`for` y la definición de la función.

Dentro de la función, `t` se refiere a la misma tortuga `bob`, por lo que `t.lt(90)` tiene 
el mismo efecto que `bob.lt(90)`. En ese caso, ¿por qué no llamar al parámetro `bob`? La 
idea es que `t` puede ser cualquier tortuga, no solo `bob`, por lo que podrías crear una 
segunda tortuga y pasarla como argumento a `square`:

    alice = turtle.Turtle()
    square(alice)

Envolver un trozo de código en una función se llama **encapsular**. Uno de los beneficios 
de encapsular es que agrega un nombre al código, que sirve como un tipo de documentación. 
Otra ventaja es que si vuelve a utilizar el código, es más conciso llamar a una función 
dos veces que copiar y pegar el cuerpo.

Generalización
--------------

El siguiente paso es agregar un parámetro `length` a `square`. Aquí hay una solución:

    def square(t, length):
        for i in range(4):
            t.fd(length)
            t.lt(90)

    square(bob, 100)
    
Agregar un parámetro a una función se llama **generalización** porque hace que la función 
sea más general: en la versión anterior, el cuadrado siempre tiene el mismo tamaño; en 
esta versión, puede ser de cualquier tamaño.

El siguiente paso es también una generalización. En lugar de dibujar cuadrados, `polygon` 
dibuja polígonos regulares con cualquier número de lados. Aquí hay una solución:

    def polygon(t, n, length):
        angle = 360 / n
        for i in range(n):
            t.fd(length)
            t.lt(angle)

    polygon(bob, 7, 70)

Este ejemplo dibuja un polígono de 7 lados con una longitud de lado 70.

Si está utilizando Python 2, el valor de `angle` podría ser erroneo debido a la división 
entera. Una solución simple es calcular `angle = 360.0 / n`. Como el numerador es un 
número de punto flotante, el resultado es punto flotante.

Cuando una función tiene más de unos pocos argumentos numéricos, es fácil olvidar lo que 
son, o en qué orden deberían estar. En ese caso, a menudo es una buena idea incluir los 
nombres de los parámetros en la lista de argumentos:

    polygon(bob, n=7, length=70)

Estos se llaman **argumentos de palabras clave** porque incluyen los nombres de los 
parámetros como "palabras clave" (que no deben confundirse con palabras clave de Python 
como `while` y` def`).

Esta sintaxis hace que el programa sea más legible. También es un recordatorio de cómo 
funcionan los argumentos y los parámetros: cuando llamas a una función, los argumentos se 
asignan a los parámetros.

Diseño de interfaz
------------------

El siguiente paso es escribir `circle`, que toma un radio, `r`, como parámetro. Aquí hay 
una solución simple que usa `polygon` para dibujar un polígono de 50 lados:

    import math

    def circle(t, r):
        circumference = 2 * math.pi * r
        n = 50
        length = circumference / n
        polygon(t, n, length)

La primera línea calcula la circunferencia de un círculo con radio `r` usando la fórmula 
$2 \pi r$. Como usamos `math.pi`, tenemos que importar `math`. Por convención, las 
declaraciones `import` generalmente están al comienzo de la secuencia de comandos.

`n` es el número de segmentos de línea en nuestra aproximación de un círculo, por lo que
`length` es la longitud de cada segmento. Por lo tanto, `polygon` dibuja un polígono de 50 
lados que se aproxima a un círculo con radio `r`.

Una limitación de esta solución es que `n` es una constante, lo que significa que para los 
círculos muy grandes, los segmentos de línea son demasiado largos, y para los círculos 
pequeños, perdemos el tiempo dibujando segmentos muy pequeños. Una solución sería 
generalizar la función tomando `n` como parámetro. Esto le daría al usuario (quienquiera 
que llame a 'círculo') más control, pero la interfaz sería menos limpia.

La **interfaz** de una función es un resumen de cómo se usa: ¿cuáles son los parámetros? 
¿Qué hace la función? ¿Y cuál es el valor de retorno? Una interfaz es "limpia" si permite 
que la persona que llama haga lo que quiera sin tener que lidiar con detalles 
innecesarios.

En este ejemplo, `r` pertenece a la interfaz porque especifica el círculo que se dibujará. 
`n` es menos apropiado porque pertenece a los detalles de *cómo* se debe representar el 
círculo.

En lugar de complicar la interfaz, es mejor elegir un valor apropiado de `n` dependiendo 
de `circumference`:

    def circle(t, r):
        circumference = 2 * math.pi * r
        n = int(circumference / 3) + 3
        length = circumference / n
        polygon(t, n, length)

Ahora el número de segmentos es un entero cercano a `circumference / 3`, por lo que la 
longitud de cada segmento es aproximadamente 3, lo suficientemente pequeña para que los 
círculos se vean bien, pero lo suficientemente grande como para ser eficiente y aceptable 
para cualquier círculo de radio arbitrario.

Agregar 3 a `n` garantiza que el polígono tiene al menos 3 lados.

refactorizar
------------

Cuando escribí `circle`, pude a usar `polygon` porque un polígono de varios lados es una buena aproximación de un círculo. Pero `arc` no es tan cooperativo; no podemos usar `polygon` o `circle` para dibujar un arco.

Una alternativa es comenzar con una copia de `polygon` y transformarla en `arc`. El 
resultado puede verse así:

    def arc(t, r, angle):
        arc_length = 2 * math.pi * r * angle / 360
        n = int(arc_length / 3) + 1
        step_length = arc_length / n
        step_angle = angle / n
        
        for i in range(n):
            t.fd(step_length)
            t.lt(step_angle)

La segunda mitad de esta función se ve como `polygon`, pero no podemos usar
`polygon` sin cambiar la interfaz. Podríamos generalizar `polygon` para tomar un ángulo 
como un tercer argumento, ¡pero `polygon` ya no sería un nombre apropiado! En cambio, 
llamemos a la función más general `polyline`:

    def polyline(t, n, length, angle):
        for i in range(n):
            t.fd(length)
            t.lt(angle)

Ahora podemos reescribir `polygon` y `arc` para que usen `polyline`:

    def polygon(t, n, length):
        angle = 360.0 / n
        polyline(t, n, length, angle)

    def arc(t, r, angle):
        arc_length = 2 * math.pi * r * angle / 360
        n = int(arc_length / 3) + 1
        step_length = arc_length / n
        step_angle = float(angle) / n
        polyline(t, n, step_length, step_angle)

Finalmente, podemos reescribir `circle` para que use `arc`:

    def circle(t, r):
        arc(t, r, 360)

Este proceso (reorganizar un programa para mejorar las interfaces y facilitar la 
reutilización del código) se denomina **refactorización**. En este caso, notamos que había 
un código similar en `arc` y` polygon`, por lo que lo "descompusimos" en `polyline`.


Si hubiéramos planeado por adelantado, podríamos haber escrito `polyline` primero y evitar 
la refactorización, pero a menudo no se sabe lo suficiente al comienzo de un proyecto para 
diseñar todas las interfaces. Una vez que comienzas a codificar, entiendes mejor el 
problema. A veces refactorizar es una señal de que has aprendido algo.

Un plan de desarrollo
---------------------

Un **plan de desarrollo** es un proceso para escribir programas. El proceso que usamos en 
este estudio de caso es "encapsular y generalizar". Los pasos de este proceso son:

1. Comienza por escribir un pequeño programa sin definiciones de funciones.

2. Una vez que tengas el programa funcionando, identifica una pieza coherente, encapsula 
   la pieza en una función y asígnele un nombre.

3. Generaliza la función agregando los parámetros apropiados.

4. Repite los pasos 1-3 hasta que tenga un conjunto de funciones. Copia y pega el código 
   para evitar volver a escribir (y volver a depurar).

5. Busca oportunidades para mejorar el programa mediante refactorización. Por ejemplo, si 
   tienes un código similar en varios lugares, considera factorizarlo en una función 
   general.

Este proceso tiene algunos inconvenientes, veremos alternativas más adelante, pero puede 
ser útil si no sabe de antemano cómo dividir el programa en funciones. Este enfoque te 
permite diseñar sobre la marcha.

docstring
---------

Un **docstring** es una cadena de texto al comienzo de una función que explica la interfaz 
("doc" es la abreviatura de "documentación"). Aquí hay un ejemplo:

    def polyline(t, n, length, angle):
        """Draws n line segments with the given length and
        angle (in degrees) between them.  t is a turtle.
        """    
        for i in range(n):
            t.fd(length)
            t.lt(angle)

Por convención, todas las cadenas de documentación son cadenas de texto entre comillas 
triples, también conocidas como cadenas de líneas múltiples porque las comillas triples 
permiten que la cadena abarque más de una línea.

Es escueto, pero contiene la información esencial que alguien necesitaría para usar esta 
función. Explica de forma concisa qué hace la función (sin entrar en detalles sobre cómo 
lo hace). Explica qué efecto tiene cada parámetro en el comportamiento de la función y qué 
tipo debe ser cada parámetro (si no es obvio).

Escribir este tipo de documentación es una parte importante del diseño de la interfaz. Una 
interfaz bien diseñada debe ser simple de explicar; si tienes dificultades para explicar 
una de tus funciones, tal vez la interfaz podría mejorarse.

Depuración
----------

Una interfaz es como un contrato entre una función y una persona que llama. La persona que 
llama acepta proporcionar ciertos parámetros y la función acepta realizar cierto trabajo.

Por ejemplo, `polyline` requiere cuatro argumentos: `t` tiene que ser una Tortuga; `n` 
tiene que ser un número entero; `length` debe ser un número positivo; y `angle` tiene que 
ser un número, que se entiende en grados.

Estos requisitos se llaman **precondiciones** porque se supone que son verdaderos antes de 
que la función comience a ejecutarse. Por el contrario, las condiciones al final de la 
función son **postcondiciones**. Las postcondiciones incluyen el efecto deseado de la 
función (como dibujar segmentos de línea) y cualquier efecto secundario (como mover la 
tortuga o hacer otros cambios).

Las condiciones previas son responsabilidad de quien llama. Si la persona que llama viola 
una condición previa (documentada adecuadamente) y la función no funciona correctamente, 
el error está en la persona que llama, no en la función.

Si se cumplen las condiciones previas y las postcondiciones no, el error está en la 
función. Si sus condiciones previas y posteriores son claras, pueden ayudar con la 
depuración.

Glosario
--------

método:

:   Una función que se asocia con un objeto y se llama mediante notación de punto.

bucle:

:   Una parte de un programa que puede ejecutarse repetidamente.

encapsulación:

:   El proceso de transformar una secuencia de enunciados en una definición de función.

generalización:

:   El proceso de reemplazar algo innecesariamente específico (como un número) con algo 
    apropiadamente general (como una variable o parámetro).

argumento de palabra clave:

:   Un argumento que incluye el nombre del parámetro como una "palabra clave".

interfaz:

:   Una descripción de cómo usar una función, incluido el nombre y las descripciones de 
    los argumentos y el valor de retorno.

refactorización:

:   El proceso de modificación de un programa para mejorar las interfaces de funciones y 
    otras cualidades del código.

plan de Desarrollo:

:   Un proceso para escribir programas.

docstring:

:   Una cadena de texto que aparece en la parte superior de una definición de función para 
    documentar la interfaz de la función.

condición previa:

:   Un requisito que debe cumplir la persona que llama antes de que comience una función.

postcondición:

:   Un requisito que debe cumplir la función antes de que finalice.

Ejercicios
----------

### Ejercicio 1

Descarga el código en este capítulo de <http://thinkpython2.com/code/polygon.py>.

1. Dibuja un diagrama de pila que muestre el estado del programa mientras ejecuta 
   `circle(bob, radius)`. Puedes hacer la aritmética a mano o agregar instrucciones 
   `print` al código.

2. La versión de `arc` en la sección \[refactoring\] no es precisa porque la aproximación 
   lineal del círculo siempre está fuera del círculo verdadero. Como resultado, la Tortuga 
   termina a unos pocos píxeles lejos del destino correcto. Mi solución muestra una forma 
   de reducir el efecto de este error. Lee el código y ve si tiene sentido para ti. Si 
   dibujas un diagrama, puedes ver cómo funciona.

### Ejercicio 2

![Turtle flowers.[]{data-label="fig.flowers"}](figs/flowers.pdf)

Escribe un conjunto de funciones generales que puedan dibujar flores como 
en la Figura \[fig.flowers\].

Solución: <http://thinkpython2.com/code/flower.py>, también requieres 
<http://thinkpython2.com/code/polygon.py>.

### Ejercicio 3

![Turtle pies.[]{data-label="fig.pies"}](figs/pies.pdf)

Escribe un conjunto de funciones generales que puedan dibujar formas como en la 
Figura \[fig.pies\].

Solución: <http://thinkpython2.com/code/pie.py>.

### Ejercicio 4

Las letras del alfabeto se pueden construir a partir de un número moderado de elementos 
básicos, como líneas verticales y horizontales y algunas curvas. Diseña un alfabeto que se 
pueda dibujar con un número mínimo de elementos básicos y luego escribe funciones que 
dibujen las letras.

Deberías escribir una función para cada letra, con los nombres `draw_a`, `draw_b`, etc., y 
colocar tus funciones en un archivo llamado `letters.py`. Puedes descargar una "máquina de 
escribir de tortuga" de <http://thinkpython2.com/code/typewriter.py> para ayudarte a 
probar tu código.

Solución: <http://thinkpython2.com/code/letters.py>; también requieres 
<http://thinkpython2.com/code/polygon.py>.

### Ejercicio 5

Lee sobre espirales en <http://en.wikipedia.org/wiki/Spiral>; luego escribe un programa 
que dibuje una espiral de Arquímedes (o una de las otras clases). 
Solución: <http://thinkpython2.com/code/spiral.py>.

[*Think Python: How to Think Like a Computer Scientist*](http://www.thinkpython2.com)

Copyright (c)  2015  Allen B. Downey.

License: [Creative Commons Attribution-NonCommercial 3.0 Unported License.](http://creativecommons.org/licenses/by-nc/3.0/)