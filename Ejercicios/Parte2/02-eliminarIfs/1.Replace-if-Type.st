!classDefinition: #Vehicle category: #'1.Replace-if-Type'!
Object subclass: #Vehicle
	instanceVariableNames: 'speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Vehicle methodsFor: 'initialization' stamp: 'ml 4/5/2025 18:41:34'!
initialize

	speed := 0 * kilometer / hour.! !


!Vehicle methodsFor: 'move' stamp: 'ml 4/5/2025 18:43:21'!
accelerate

	self subclassResponsibility .! !


!classDefinition: #Helicopter category: #'1.Replace-if-Type'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Helicopter methodsFor: 'as yet unclassified' stamp: 'ml 4/5/2025 18:42:56'!
accelerate

	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter)! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'ml 4/5/2025 18:42:09'!
initialize 

	super initialize .
	altitude := 0 * meter.! !


!classDefinition: #Motorcycle category: #'1.Replace-if-Type'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'ml 4/5/2025 18:43:30'!
accelerate

	speed := speed + (20 * kilometer / hour)! !

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'ml 4/5/2025 18:50:46'!
initialize

	super initialize .! !
