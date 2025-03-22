!classDefinition: #AlgebraDeBooleTest category: #Ejercicio3!
DenotativeObject subclass: #AlgebraDeBooleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlgebraDeBooleTest class' category: #Ejercicio3!
AlgebraDeBooleTest class
	instanceVariableNames: ''!

!AlgebraDeBooleTest class methodsFor: '-- all --' stamp: 'ml 3/21/2025 20:38:53'!
test01Negado

	Assert that: Falso negado isEqualTo: Verdadero.
	Assert that: Verdadero negado isEqualTo: Falso! !

!AlgebraDeBooleTest class methodsFor: '-- all --' stamp: 'ml 3/21/2025 20:41:12'!
test02Y

	Assert that: (Falso y: Falso ) isEqualTo: Falso.
	Assert that: (Falso y: Verdadero ) isEqualTo: Falso.
	Assert that: (Verdadero y: Falso) isEqualTo: Falso.
	Assert that: (Verdadero y: Verdadero ) isEqualTo: Verdadero ! !

!AlgebraDeBooleTest class methodsFor: '-- all --' stamp: 'ml 3/21/2025 20:44:03'!
test03O

	Assert that: (Falso o: Falso ) isEqualTo: Falso.
	Assert that: (Falso o: Verdadero ) isEqualTo: Verdadero .
	Assert that: (Verdadero o: Falso ) isEqualTo: Verdadero .
	Assert that: (Verdadero o: Verdadero ) isEqualTo: Verdadero .! !

!AlgebraDeBooleTest class methodsFor: '-- all --' stamp: 'ml 3/21/2025 21:06:20'!
test04VerdaderoSiVerdaderoRealizar

	Assert that: (Verdadero siVerdadero:[ ^Pepe hola]) isEqualTo: ([Pepe hola] value)! !

!AlgebraDeBooleTest class methodsFor: '-- all --' stamp: 'ml 3/21/2025 21:00:59'!
test05FalsoSiVerdaderoIgnoro

	| mensaje |
	mensaje := 'inicio'.

	Falso siVerdadero:[ mensaje := 'cambio texto'].
	Assert that: mensaje isEqualTo: 'inicio'.! !

!AlgebraDeBooleTest class methodsFor: '-- all --' stamp: 'ml 3/21/2025 21:03:42'!
test06VerdaderoSiFalsoIgnoro

	| mensaje |
	mensaje := 'inicio'.

	Verdadero siFalso: [ mensaje := 'cambio texto'].
	Assert that: mensaje isEqualTo: 'inicio'.! !

!AlgebraDeBooleTest class methodsFor: '-- all --' stamp: 'ml 3/21/2025 21:06:13'!
test07FalsoSiFalsoEjecutoClosure

	Assert that: (Falso siFalso:[ ^Pepe hola]) isEqualTo: ([Pepe hola] value )! !


!classDefinition: #Falso category: #Ejercicio3!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: #Ejercicio3!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'operaciones logicas' stamp: 'ml 3/21/2025 19:28:06'!
negado
	
	^Verdadero ! !

!Falso class methodsFor: 'operaciones logicas' stamp: 'ml 3/21/2025 19:48:46'!
o: unBooleano 
	^unBooleano .! !

!Falso class methodsFor: 'operaciones logicas' stamp: 'ml 3/21/2025 19:38:44'!
y: unBooleano
	^self.! !



!Falso class methodsFor: 'operaciones logicas' stamp: 'ml 3/21/2025 19:28:06'!
negado
	
	^Verdadero ! !

!Falso class methodsFor: 'operaciones logicas' stamp: 'ml 3/21/2025 19:48:46'!
o: unBooleano 
	^unBooleano .! !

!Falso class methodsFor: '-- all --' stamp: 'ml 3/21/2025 20:48:53'!
siFalso: unaAccionARealizarUIgnorar 
	unaAccionARealizarUIgnorar value.! !

!Falso class methodsFor: '-- all --' stamp: 'ml 3/21/2025 20:48:44'!
siVerdadero: unaAccionARealizarUIgnorar 
	^self ! !

!Falso class methodsFor: 'operaciones logicas' stamp: 'ml 3/21/2025 19:38:44'!
y: unBooleano
	^self.! !


!classDefinition: #Verdadero category: #Ejercicio3!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: #Ejercicio3!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'operaciones logicas' stamp: 'ml 3/21/2025 19:26:07'!
negado
	^Falso! !


!Verdadero class methodsFor: 'operaciones logicas' stamp: 'ml 3/21/2025 19:26:07'!
negado
	^Falso! !

!Verdadero class methodsFor: '-- all --' stamp: 'ml 3/21/2025 19:42:13'!
o: unBooleano
	^self .! !

!Verdadero class methodsFor: '-- all --' stamp: 'ml 3/21/2025 20:49:00'!
siFalso: unaAccionARealizarUIgnorar
	^self.! !

!Verdadero class methodsFor: '-- all --' stamp: 'ml 3/21/2025 20:49:05'!
siVerdadero: unaAccionARealizarUIgnorar 
	^ unaAccionARealizarUIgnorar value .! !

!Verdadero class methodsFor: '-- all --' stamp: 'ml 3/21/2025 19:35:29'!
y: unBooleano 
	^ unBooleano ! !

