!classDefinition: #AlgebradeBoolTest category: 'Seccion1Part1Ejercicio3: booleanos'!
DenotativeObject subclass: #AlgebradeBoolTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio3: booleanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlgebradeBoolTest class' category: 'Seccion1Part1Ejercicio3: booleanos'!
AlgebradeBoolTest class
	instanceVariableNames: ''!

!AlgebradeBoolTest class methodsFor: '-- all --' stamp: 'ml 8/26/2024 19:43:56'!
test01FalsoSiFalsoEvaluar
	Falso siFalso: [^self].
	Assert fail.! !

!AlgebradeBoolTest class methodsFor: '-- all --' stamp: 'ml 8/26/2024 19:45:00'!
test02FalsoSiVerdaderoNoEvaluaClosure
	Falso siVerdadero: [Assert fail].! !

!AlgebradeBoolTest class methodsFor: '-- all --' stamp: 'ml 8/26/2024 19:46:24'!
test03VerdaderoSiFalsoNoEvaluaClosure
	Verdadero siFalso: [Assert fail].! !

!AlgebradeBoolTest class methodsFor: '-- all --' stamp: 'ml 8/26/2024 19:46:09'!
test04VerdaderoSiVerdaderoEvaluar
	Verdadero siVerdadero: [^self].
	Assert fail.! !

!AlgebradeBoolTest class methodsFor: '-- all --' stamp: 'ml 8/22/2024 10:55:20'!
testFalsoNegadoEsVerdadero
	Assert that: Falso no isEqualTo: Verdadero ! !

!AlgebradeBoolTest class methodsFor: '-- all --' stamp: 'ml 8/22/2024 11:04:55'!
testO
	Assert that: (Verdadero o: Verdadero) isEqualTo: Verdadero. 
	Assert that: (Falso o: Verdadero) isEqualTo: Verdadero . 
	Assert that: (Falso o: Falso ) isEqualTo: Falso.
	Assert that: (Verdadero o: Falso ) isEqualTo: Verdadero  ! !

!AlgebradeBoolTest class methodsFor: '-- all --' stamp: 'ml 8/22/2024 10:54:05'!
testVerdaderoNegadoEsFalso
	Assert that: Verdadero no isEqualTo: Falso ! !

!AlgebradeBoolTest class methodsFor: '-- all --' stamp: 'ml 8/22/2024 11:03:02'!
testY
	Assert that: (Verdadero y: Verdadero) isEqualTo: Verdadero. 
	Assert that: (Falso y: Verdadero) isEqualTo: Falso. 
	Assert that: (Falso y: Falso ) isEqualTo: Falso.
	Assert that: (Verdadero y: Falso ) isEqualTo: Falso  ! !


!classDefinition: #Falso category: 'Seccion1Part1Ejercicio3: booleanos'!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio3: booleanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: 'Seccion1Part1Ejercicio3: booleanos'!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: '-- all --' stamp: 'ml 8/22/2024 10:50:19'!
no
	"niega el valor falso"
	^Verdadero! !

!Falso class methodsFor: '-- all --' stamp: 'ml 8/22/2024 00:45:37'!
o: unBooleano
	"operacion booleana o cuando el primer colaborador es falso"
	^unBooleano ! !

!Falso class methodsFor: '-- all --' stamp: 'ml 8/26/2024 19:33:48'!
siFalso: unaAccionARealizarUIgnorar
	"en este caso ejecuta la acción"
	^ unaAccionARealizarUIgnorar value 
! !

!Falso class methodsFor: '-- all --' stamp: 'ml 8/26/2024 19:33:06'!
siVerdadero: unaAccionARealizarUIgnorar
	"en este caso ignora"
! !

!Falso class methodsFor: '-- all --' stamp: 'ml 8/22/2024 00:44:09'!
y: unBooleano
	"operacion booleana y cuando el primer colaborador es falso"
	^self! !


!classDefinition: #Verdadero category: 'Seccion1Part1Ejercicio3: booleanos'!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio3: booleanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: 'Seccion1Part1Ejercicio3: booleanos'!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: '-- all --' stamp: 'ml 8/22/2024 10:49:49'!
no
	"niega el valor verdadero"
	^Falso
	! !

!Verdadero class methodsFor: '-- all --' stamp: 'ml 8/22/2024 00:45:10'!
o: unBooleano
	"operacion booleana o cuando el primer colaborador es verdadero"
	^self ! !

!Verdadero class methodsFor: '-- all --' stamp: 'ml 8/26/2024 19:35:59'!
siFalso: unaAccionARealizarUIgnorar
	"en este caso ignora"
! !

!Verdadero class methodsFor: '-- all --' stamp: 'ml 8/26/2024 19:35:41'!
siVerdadero: unaAccionARealizarUIgnorar
	"en este caso ejecuta la acción"
	^ unaAccionARealizarUIgnorar value 
! !

!Verdadero class methodsFor: '-- all --' stamp: 'ml 8/22/2024 00:41:53'!
y: unBooleano
	"operacion booleana y cuando el primer colaborador es verdadero"
	^unBooleano ! !
