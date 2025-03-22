!classDefinition: #Bill category: 'Ejercicio2'!
DenotativeObject subclass: #Bill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bill class' category: 'Ejercicio2'!
Bill class
	instanceVariableNames: 'energia'!

!Bill class methodsFor: 'acciones' stamp: 'ml 3/21/2025 15:40:00'!
comer: unaCantidadDeKilosDeCerebro 
	energia := energia + (unaCantidadDeKilosDeCerebro * (4*day)).
	^energia ! !

!Bill class methodsFor: 'acciones' stamp: 'ml 3/21/2025 15:38:53'!
energia
	^energia! !

!Bill class methodsFor: 'acciones' stamp: 'ml 3/21/2025 15:38:13'!
nace
	energia := 28 * day.
	^energia ! !


!Bill class methodsFor: 'as yet unclassified' stamp: 'ml 3/21/2025 15:42:12'!
caminar: unaCantidadDeKilometros 
	energia := energia - (unaCantidadDeKilometros * day) - (3 * day).
	^energia.! !


!Bill class methodsFor: '--** private fileout/in **--' stamp: 'ml 3/21/2025 21:46:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energia := (SimpleMeasure basicNew instVarAt: 1 put: 35; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'day'; instVarAt: 2 put: 'days'; instVarAt: 3 put: 'NO SIGN'; yourself); yourself).! !

Bill initializeAfterFileIn!