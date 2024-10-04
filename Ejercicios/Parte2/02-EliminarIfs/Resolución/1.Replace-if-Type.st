!classDefinition: #Vehicle category: #'1.Replace-if-Type'!
Object subclass: #Vehicle
	instanceVariableNames: 'speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!
!Vehicle commentStamp: '<historical>' prior: 0!
| fitito |
fitito:= Motorcycle new.
fitito accelerate !


!Vehicle methodsFor: 'move' stamp: 'ml 9/11/2024 17:09:42'!
accelerate
	self subclassResponsibility.
		
! !


!Vehicle methodsFor: 'initialization' stamp: 'ml 9/11/2024 17:09:54'!
initialize

	speed := 0 * kilometer / hour.
! !


!classDefinition: #Helicopter category: #'1.Replace-if-Type'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Helicopter methodsFor: 'initialization' stamp: 'ml 9/11/2024 17:08:58'!
initialize

	super initialize.
	altitude := 0 * meter! !


!Helicopter methodsFor: 'move' stamp: 'ml 9/10/2024 11:19:48'!
accelerate
	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter)
		
! !


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


!Motorcycle methodsFor: 'initialization' stamp: 'ml 9/11/2024 17:07:50'!
initialize

	speed := 0 * kilometer / hour.
! !


!Motorcycle methodsFor: 'move' stamp: 'ml 9/10/2024 11:20:38'!
accelerate

		speed := speed + (20 * kilometer / hour)! !
