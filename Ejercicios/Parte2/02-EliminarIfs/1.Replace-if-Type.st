!classDefinition: #Vehicle category: #'1.Replace-if-Type'!
Object subclass: #Vehicle
	instanceVariableNames: 'type speed altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Vehicle methodsFor: 'initialization' stamp: 'ARM 4/29/2024 11:00:51'!
initializeWithType: typeToTake

	type := typeToTake.
	speed := 0 * kilometer / hour.
	altitude := 0 * meter! !


!classDefinition: #Helicopter category: #'1.Replace-if-Type'!
Vehicle subclass: #Helicopter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Helicopter methodsFor: 'move' stamp: 'ml 9/10/2024 11:19:48'!
accelerate
	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter)
		
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Helicopter class' category: #'1.Replace-if-Type'!
Helicopter class
	instanceVariableNames: ''!

!Helicopter class methodsFor: 'as yet unclassified' stamp: 'ml 9/10/2024 11:26:25'!
helicopter
	^self new initializeWithType: Helicopter ! !


!classDefinition: #Motorcycle category: #'1.Replace-if-Type'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!
!Motorcycle commentStamp: '<historical>' prior: 0!
Motorcycle motorcicle accelerate.
fitito := Helicopter  helicopter accelerate.
!


!Motorcycle methodsFor: 'move' stamp: 'ml 9/10/2024 11:20:38'!
accelerate

		speed := speed + (20 * kilometer / hour)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Motorcycle class' category: #'1.Replace-if-Type'!
Motorcycle class
	instanceVariableNames: ''!

!Motorcycle class methodsFor: 'as yet unclassified' stamp: 'ml 9/10/2024 11:27:07'!
motorcicle
	^self new initializeWithType: Motorcycle ! !
