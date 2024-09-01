!classDefinition: #Bill category: 'Seccion1Part1Ejercicio2: BillZoombie'!
DenotativeObject subclass: #Bill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio2: BillZoombie'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bill class' category: 'Seccion1Part1Ejercicio2: BillZoombie'!
Bill class
	instanceVariableNames: 'energia'!

!Bill class methodsFor: '-- all --' stamp: 'ml 8/21/2024 21:19:15'!
caminar: unacantkilometro
	"por cada kilómetro que realiza consume un día de vida más 3 días"
	energia := energia - (3 *day) -(unacantkilometro *day)

! !

!Bill class methodsFor: '-- all --' stamp: 'ml 8/21/2024 21:00:11'!
come: unaCantKilos
	"adquiere 4 días de vida por cada kilo de cerebro que come"
	
	energia := energia + (4*day*unaCantKilos) ! !

!Bill class methodsFor: '-- all --' stamp: 'ml 8/21/2024 21:30:59'!
energia
	"devuelve energia restante"
	^ energia! !

!Bill class methodsFor: '--** private fileout/in **--' stamp: 'ml 8/31/2024 20:15:56'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energia := (SimpleMeasure basicNew instVarAt: 1 put: 99; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'day'; instVarAt: 2 put: 'days'; instVarAt: 3 put: 'NO SIGN'; yourself); yourself).! !


!Bill class methodsFor: '--** private fileout/in **--' stamp: 'ml 8/31/2024 20:15:56'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energia := (SimpleMeasure basicNew instVarAt: 1 put: 99; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'day'; instVarAt: 2 put: 'days'; instVarAt: 3 put: 'NO SIGN'; yourself); yourself).! !

Bill initializeAfterFileIn!