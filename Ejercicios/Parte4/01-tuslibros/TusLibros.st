!classDefinition: #VentaLibrosOnlineTest category: 'TusLibros'!
TestCase subclass: #VentaLibrosOnlineTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!VentaLibrosOnlineTest methodsFor: 'as yet unclassified' stamp: 'ml 11/5/2024 14:32:14'!
test01AgregarLibroAUnCarritoDeberiaAumentarSaldo

	| carrito libro |
	libro := Libro conNombre: 'El Principito' isbn: '978-950-23-1447-1' precio: (18000 * peso) .
	carrito := Carrito new.
	
	carrito agregar: libro.
	
	self assert: (libro precio) equals: carrito saldo.! !

!VentaLibrosOnlineTest methodsFor: 'as yet unclassified' stamp: 'ml 11/5/2024 14:47:35'!
test02AgregarDosLibrosAUnCarritoDeberiaSumarLosPreciosParaElSaldo

	| carrito libro libro2 |
	libro := Libro conNombre: 'El Principito' isbn: '978-950-23-1447-1' precio: (18000 * peso) .
	libro2 := Libro conNombre: 'El Principito2' isbn: '978-950-23-1447-2' precio: (20000 * peso) .
	carrito := Carrito new.
	
	carrito agregar: libro.
	carrito agregar: libro2.
	
	self assert: (libro precio + libro2 precio) equals: carrito saldo.! !


!classDefinition: #Carrito category: 'TusLibros'!
Object subclass: #Carrito
	instanceVariableNames: 'librosEnCarrito'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Carrito methodsFor: 'as yet unclassified' stamp: 'ml 11/5/2024 14:49:09'!
agregar: unLibro

	librosEnCarrito add: unLibro .! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'ml 11/5/2024 14:48:54'!
initialize

	librosEnCarrito := OrderedCollection new.! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'ml 11/5/2024 14:49:42'!
saldo

	^librosEnCarrito sum: [:unLibro | unLibro precio].! !


!classDefinition: #Libro category: 'TusLibros'!
Object subclass: #Libro
	instanceVariableNames: 'nombreDeLibro isbn precio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Libro methodsFor: 'inicializacion' stamp: 'ml 11/5/2024 13:40:08'!
initializeCon: unNombreDeLibro isbn: idLibro precio: precioLibro 
	nombreDeLibro := unNombreDeLibro.
	isbn := idLibro.
	precio := precioLibro.! !


!Libro methodsFor: 'nil' stamp: 'ml 11/5/2024 14:31:54'!
precio

	^precio .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Libro class' category: 'TusLibros'!
Libro class
	instanceVariableNames: ''!

!Libro class methodsFor: 'creation' stamp: 'ml 11/5/2024 14:43:02'!
conNombre: unNombreDeLibro isbn: idLibro precio: precioLibro 
	
	^self new initializeCon: unNombreDeLibro isbn: idLibro precio: precioLibro .! !

