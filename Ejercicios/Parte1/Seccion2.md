# Introducción al lenguaje Smalltalk

## Ejercicio 0: Debugger
(a) Identificar y nombrar las diferentes partes y secciones del debugger:

![](https://github.com/malei-dc/IS1/blob/main/Ejercicios/Parte1/imgs/ej0a.png)

(b) Definir un objeto en el DenotativeObjectBrowser, con un colaborador llamado aVar
y con dos métodos m1 y m2:

        m1
            |b|
            b := 42.
            aVar := 1.
            ^ self m2: b

        m2: anotherValue
            |b|
            b := 24.
            aVar < 3 ifTrue: [ aVar := aVar + anotherValue].
            ^ aVar + b
    
Luego en el workspace enviar el mensaje m1 al objeto creado utilizando el debugger

- ¿Cuál es la diferencia entre las acciones Into, Over y Through (en el menú del debugger)?

    >- Into: meterse adentro de la imprementación del mensaje que se está enviando.
    >- Over: enviar la colaboración pero detenerse en la proxima colaboración.
    >- Through: no encontre en el menu del debugger.

- ¿Qué sucede al hacer clic en Restart?

    > Reiniciar el contexto de ejecución desde la colaboración seleccionada.

- Recorrer el código con Into hasta la última línea del método m2. Luego hacer Restart. ¿Dónde queda ubicado el debugger? ¿Cuál es el valor de $aVar$?

    > Al hacer restart queda hubicado en la misma colaboración, pero vuelve al inicio del método.
    >
    > El valor de $aVar$ luego de hacer restart es 43.

## Ejercicio 1: Colecciones

(a) Acerca de algunas colecciones muy utilizadas

1. Array (fixed length collection)

        x := Array with: 5 with: 4 with: 3 with: 2.
    
    Sintaxis reducida para crear arrays:

        x := #(5 4 3 2).

    Para resolver en el Workspace:

    - Crear un array usando alguna de las sintaxis anteriores.
    - Cambiar el elemento en la primera posición con el valor 42.

            x:= #(1,1,1,1).
            x atWrap: 1 put: 42.
            x  #(42 #, 1 #, 1 #, 1) .

    - ¿Qué pasa si queremos agregar un elemento en la posición 5?

            x:= #(1,1,1,1). 
            x atWrap: 5 put: 42.
            x  #(1 #, 1 #, 42 #, 1) .
        
        > No entiendo los numerales.

2. Ordered Collections

        x := OrderedCollection with: 4 with: 3 with: 2 with: 1.
        x add: 42.
        x add: 2.
        x size.  6 .
        x an OrderedCollection(4 3 2 1 42 2) .

    ¿Cuántos elementos tiene la colección?

    > 6

    ¿Cuántas veces aparece el 2?

    > No encontré un metodo que cuente cuantas veces aparece el 2, pero aparece 2 veces.

3. Sets

        x := Set with: 4 with: 3 with: 2 with: 1.
        x add: 42.
        x add: 2.
        x size. 5 .
        x a Set(42 4 3 2 1) 

    ¿Cuántos elementos tiene la colección?

    > 5

    ¿Cuántas veces aparece el 2?

    > 1

4. Dictionary

        x := Dictionary new.
        x add: #a->4; add: #b->3; add: #c->1; add: #d->2; yourself.
        x add: #e->42.
        x size  5 .
        x keys  #(#b #a #e #d #c) .
        x values  #(3 4 42 2 1) .
        x at: #a 4 .
        x at:#z  ifAbsent: 24  24 .

(b) Conversión de colecciones

- Convertir el Array del punto **a1** en una OrderedCollection y en un Set.

    > Imagino que hay que implementarlo, ya que el conversor de la Array trata solo de elementos, preguntar.

- Convertir el Set del punto **a3** en Array

- ¿Qué retorna convertir el Dictionary en Array?

(c) Crear una secuencia de colaboraciones para encontrar los elementos impares en un arreglo.

    | elements index odds | 
    elements:= #(1 2 5 6 9).
    
    odds := OrderedCollection new. 
    index := 1.
    
    [index <= elements size] 
    whileTrue: [
        ((elements at: index) odd) ifTrue: [odds add: (elements at: index)]. 
        index := index +1.
    ].
    ^odds

(g) Enumerar los problemas que tiene ese algoritmo según lo visto en la carrera.

> - Es poco declarativo
> - Cuenta como codigo repetido?
> - no se

(h) Convertir el script de 1.a sin usar #whileTrue, utilizando el mensaje #do:, ¿qué ventaja tiene la nueva versión?

> Asumo que se refiere al punto 1.c. La ventaja es que es más declarativo y se eliminó una variable temporal que guarda el índice.
>
>       | elements odds |
>       elements:= #(1 2 5 6 9).
>       odds := OrderedCollection new.
>       (1 to: elements size) do: [:i |
>           ((elements at: i) odd) ifTrue: [odds add: (elements at: i)].
>       ].
>       ^odds 

(i) Volver a convertir el algoritmo sin cambiar su comportamiento pero usando el mensaje #select: en lugar de #do ¿qué ventaja tiene la nueva versión?

> Intento algo así pero me imprime la colección vacío :( PREGUNTAR!
>
>       | elements odds |
>       elements:= #(1 2 5 6 9).
>       odds := OrderedCollection new.
>       ^ odds select: [ :i |
>	        (elements at: i) odd
>  	    ].
>       an OrderedCollection() .

(j) Crear una secuencia similar a la de 1.1 pero que obtenga el doble de cada elemento de la colección. Por ejemplo elements = #(1 2 5) debería retornar #(2 4 10)

>       | elements doubled |
>       elements:= #(1 2 5 6 9).
>       doubled := OrderedCollection new.
>       (1 to: elements size) do: [:i |
>   	    doubled add: (elements at: i)*2 .
>       ].
>       ^doubled  an OrderedCollection(2 4 10 12 18) .

(k) Reescribir el algoritmo utilizando while y luego utilizando do ¿Donde se acumulan los resultados?

> Los resultados los acumulo en el una nueva colección llamado doubled. Arriba está con do
>
>       | elements index doubled | 
>       elements:= #(1 2 5 6 9).
>
>       doubled := OrderedCollection new. 
>       index := 1.
>
>       [index <= elements size] 
>       whileTrue: [
>       doubled add: (elements at: index) *2 . 
>           index := index +1.
>       ].
>       ^doubled. an OrderedCollection(2 4 10 12 18) .

(m) Encontrar luego un mensaje mejor en colecciones y dejar el algoritmo más compacto. ¿Qué retorna el nuevo mensaje?

>       | elements |
>       elements:= #(1 2 5 6 9).
>       ^elements *2 
>
>       Devuelve: #(2 4 10 12 18) .

(n) Crear una nueva secuencia de colaboraciones para encontrar el primer número par, utilizando otro mensaje de colecciones. Como siempre primero con while: luego con do: y luego con un mensaje específico. Ejemplo: dado #(1 2 5 6 9) debería retornar 2

> Con while
>
>       | elements index  | 
>       elements:= #(1  58 5  9).
>       index := 1.
>       [index <= elements size] 
>           whileTrue: [
>           (elements at: index) even ifTrue: [^elements at: index].
>           index := index +1.
>       ].
>       ^elements .
>
> Con do:
>
>       | elements  | 
>       elements:= #(1  58 5  9).
>       (1 to: elements size ) do: [:index |
>	    (elements at: index) even ifTrue: [^elements at: index].
>	    ].
>       ^elements .
>
> Con un mensaje específico ... PREGUNTAR no encontré

(ñ) Utilizar la secuencia de colaboraciones con una colección sin pares. Por ejemplo #(1 5 9). ¿Qué ocurre?

> (while) En el primero hago que devuelva el arreglo original.
>
> (do) idem.
>
> PREGUNTAR

(o) Modificar la secuencia para generar un error en caso de no contener pares utilizando self error: ‘No hay pares’. Evaluarlo en una colección con pares (retorna el primero) y sin pares (se genera un error con el mensaje específico)

>       | elements  | 
>       elements:= #(1  5  9).
>       (1 to: elements size ) do: [:index |
>	        (elements at: index) even ifTrue: [^elements at: index].
>	    ].
>       ^self error: 'No hay pares'.

(p) Sumar los números de una colección utilizando primero while, luego do y luego un mensaje de sumar colecciones. Hay un mensaje específico para la suma y otro para acumular elementos llamado inject:into: Solucionarlo utilizando ambos.

> Con while
>
>       | elements index  sum | 
>       elements:= #(1  5  9).
>       sum := 0.
>       index := 1.
>       [index <= elements size] 
>       whileTrue: [
>           sum := sum + (elements at: index).
>       index := index +1.
>       ].
>       ^sum. 
>
> Con do:
>
>       | elements  sum | 
>       elements:= #(1  5  9).
>       sum := 0.
>       (1 to: elements size ) do: [:index |
>           sum := sum + (elements at: index).
>       ].
>       ^sum. 
>
> Con inject:into:
>
>       | elements| 
>       elements:= #(1  5  9).  
>       ^elements inject: 0 into: [:subTotal :next | subTotal + next]
>
> Con suma? '+' ? PREGUNTAR

(q) ¿Cuántos colaboradores recibe inject:into: ? Pruebe debuggearlo con el menú o poniendo self halt. antes de las colaboraciones (esto detendrá la ejecución y abrirá el debugger)

> inject:into: recibe dos colaboradores. PREGUNTAR donde se pone self halt

(r) Crear una nueva secuencia para extraer únicamente las vocales en el orden que aparecen en un string.