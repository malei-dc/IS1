!classDefinition: #PowerStatus category: #'3.Replace-if-Type+State'!
Object subclass: #PowerStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!PowerStatus methodsFor: 'move' stamp: 'ml 9/11/2024 21:32:29'!
accelerate: aVehicleType

	self subclassResponsibility .! !


!classDefinition: #Off category: #'3.Replace-if-Type+State'!
PowerStatus subclass: #Off
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Off methodsFor: 'move' stamp: 'ml 9/11/2024 21:31:37'!
accelerate: aVehicleType

	aVehicleType canNotAccelerateErrorMessage .! !


!classDefinition: #On category: #'3.Replace-if-Type+State'!
PowerStatus subclass: #On
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!On methodsFor: 'move' stamp: 'ml 9/11/2024 21:28:09'!
accelerate: aVehicleType

	aVehicleType accelerateWhenOn.! !


!classDefinition: #Vehicle category: #'3.Replace-if-Type+State'!
Object subclass: #Vehicle
	instanceVariableNames: 'powerStatus speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Vehicle methodsFor: 'initialization' stamp: 'ml 9/11/2024 21:00:59'!
initialize

	powerStatus := Off new.
	speed := 0 * kilometer / hour.! !


!Vehicle methodsFor: 'move' stamp: 'ml 9/11/2024 21:08:33'!
accelerate

	self subclassResponsibility .
! !


!Vehicle methodsFor: 'on/off' stamp: 'ml 9/11/2024 21:49:39'!
turnOff

	self subclassResponsibility.! !

!Vehicle methodsFor: 'on/off' stamp: 'ml 9/11/2024 21:49:53'!
turnOn

	self subclassResponsibility .! !


!Vehicle methodsFor: 'error messages' stamp: 'ml 9/11/2024 21:29:57'!
canNotAccelerateErrorMessage

	self subclassResponsibility.! !


!classDefinition: #Helicopter category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!
!Helicopter commentStamp: '<historical>' prior: 0!
| heli1 |
heli1:=Helicopter new.
heli1 accelerate  a Helicopter .!


!Helicopter methodsFor: 'initialization' stamp: 'ml 9/11/2024 21:01:42'!
initialize

	super initialize .
	altitude := 0 * meter.! !


!Helicopter methodsFor: 'on/off' stamp: 'ml 9/11/2024 21:34:37'!
turnOff

	powerStatus := Off new.! !

!Helicopter methodsFor: 'on/off' stamp: 'ml 9/11/2024 21:34:47'!
turnOn

	powerStatus := On new.! !


!Helicopter methodsFor: 'move' stamp: 'ml 9/11/2024 21:27:11'!
accelerate

	powerStatus accelerate: self.
! !

!Helicopter methodsFor: 'move' stamp: 'ml 9/11/2024 21:26:51'!
accelerateWhenOn

	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter).
! !


!Helicopter methodsFor: 'cantMoveMsg' stamp: 'ml 9/11/2024 21:31:02'!
canNotAccelerateErrorMessage

	^'Can not fly when turned off'
! !


!classDefinition: #Motorcycle category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Motorcycle methodsFor: 'initialization' stamp: 'ml 9/11/2024 21:04:40'!
initialize

	super initialize .! !


!Motorcycle methodsFor: 'on/off' stamp: 'ml 9/11/2024 21:35:02'!
turnOff

	powerStatus := Off new.! !

!Motorcycle methodsFor: 'on/off' stamp: 'ml 9/11/2024 21:34:54'!
turnOn

	powerStatus := On new.! !


!Motorcycle methodsFor: 'cantMoveMsg' stamp: 'ml 9/11/2024 21:30:46'!
canNotAccelerateErrorMessage

	^'Can not run when turned off'! !


!Motorcycle methodsFor: 'move' stamp: 'ml 9/11/2024 21:27:20'!
accelerate

	powerStatus accelerate: self.! !

!Motorcycle methodsFor: 'move' stamp: 'ml 9/11/2024 21:26:38'!
accelerateWhenOn

	speed := speed + (20 * kilometer / hour).! !
