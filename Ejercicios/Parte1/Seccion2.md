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



- Convertir el Set del punto **a3** en Array

- ¿Qué retorna convertir el Dictionary en Array?