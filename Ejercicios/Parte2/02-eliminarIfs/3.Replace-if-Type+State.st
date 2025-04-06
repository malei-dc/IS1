!classDefinition: #Vehicle category: #'3.Replace-if-Type+State'!
Object subclass: #Vehicle
	instanceVariableNames: 'state speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Vehicle methodsFor: 'initialization' stamp: 'ml 4/5/2025 19:42:37'!
initialize

	state := StateOff new.
	speed := 0 * kilometer / hour.! !


!Vehicle methodsFor: 'move' stamp: 'ml 4/5/2025 20:27:54'!
accelerate

	state accelerate: self.

	"
	state = #Off ifTrue:[self error: self canNotAccelerateErrorMessage].
	
	type = #Helicopter
		ifTrue:[speed := speed + (10 * kilometer / hour).
			altitude := altitude + (5 * meter)].
		
	type = #Motorcycle
		ifTrue:[speed := speed + (20 * kilometer / hour)].
	"! !

!Vehicle methodsFor: 'move' stamp: 'ml 4/5/2025 19:58:56'!
restoreAccelerationWhenTurnOff

	speed := 0 * kilometer / hour.! !

!Vehicle methodsFor: 'move' stamp: 'ml 4/5/2025 19:40:12'!
tryAccelerateWhenOff

	self subclassResponsibility! !

!Vehicle methodsFor: 'move' stamp: 'ml 4/5/2025 19:43:45'!
tryAccelerateWhenOn

	self subclassResponsibility! !


!Vehicle methodsFor: 'on/off' stamp: 'ml 4/5/2025 20:25:26'!
turnOff

	state tryChangeState: self.
	state := StateOff new.! !

!Vehicle methodsFor: 'on/off' stamp: 'ml 4/5/2025 19:34:44'!
turnOn

	state := StateOn new.! !


!Vehicle methodsFor: 'error messages' stamp: 'ml 4/5/2025 20:28:29'!
canNotAccelerateErrorMessage

	self subclassResponsibility
	
	"
	type = #Helicopter ifTrue:[^'Can not fly when turned off'].
	type = #Motorcycle ifTrue:[^'Can not run when turned off'].
	"! !


!classDefinition: #Helicopter category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Helicopter methodsFor: 'error messages' stamp: 'ml 4/5/2025 19:40:40'!
canNotAccelerateErrorMessage

	^'Can not fly when turned off'! !


!Helicopter methodsFor: 'move' stamp: 'ml 4/5/2025 19:58:56'!
restoreAccelerationWhenTurnOff

	super restoreAccelerationWhenTurnOff .
	altitude := 0 * meter.! !

!Helicopter methodsFor: 'move' stamp: 'ml 4/5/2025 19:40:12'!
tryAccelerateWhenOff

	self error: self canNotAccelerateErrorMessage! !

!Helicopter methodsFor: 'move' stamp: 'ml 4/5/2025 19:44:18'!
tryAccelerateWhenOn

	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter)
		
! !


!Helicopter methodsFor: 'initialization' stamp: 'ml 4/5/2025 19:42:21'!
initialize

	super initialize .
	altitude := 0 * meter.
! !


!Helicopter methodsFor: 'on/off' stamp: 'ml 4/5/2025 20:25:45'!
turnOff

	state tryChangeState: self.
	state := StateOff new.! !


!classDefinition: #Motorcycle category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Motorcycle methodsFor: 'error messages' stamp: 'ml 4/5/2025 19:40:57'!
canNotAccelerateErrorMessage

	^'Can not run when turned off'! !


!Motorcycle methodsFor: 'move' stamp: 'ml 4/5/2025 19:58:56'!
restoreAccelerationWhenTurnOff

	super restoreAccelerationWhenTurnOff .! !

!Motorcycle methodsFor: 'move' stamp: 'ml 4/5/2025 19:40:12'!
tryAccelerateWhenOff

	self error: self canNotAccelerateErrorMessage! !

!Motorcycle methodsFor: 'move' stamp: 'ml 4/5/2025 19:44:34'!
tryAccelerateWhenOn
		
	speed := speed + (20 * kilometer / hour)! !


!Motorcycle methodsFor: 'initialization' stamp: 'ml 4/5/2025 19:42:31'!
initialize

	super initialize.
! !


!Motorcycle methodsFor: 'on/off' stamp: 'ml 4/5/2025 20:25:26'!
turnOff

	state tryChangeState: self.
	state := StateOff new.! !


!classDefinition: #VehicleState category: #'3.Replace-if-Type+State'!
Object subclass: #VehicleState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!VehicleState methodsFor: 'move' stamp: 'ml 4/5/2025 19:31:23'!
accelerate: aVehicle

	self subclassResponsibility! !


!VehicleState methodsFor: 'on/off' stamp: 'ml 4/5/2025 20:25:26'!
tryChangeState: aVehicle

	self subclassResponsibility! !


!classDefinition: #StateOff category: #'3.Replace-if-Type+State'!
VehicleState subclass: #StateOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!StateOff methodsFor: 'move' stamp: 'ml 4/5/2025 19:33:16'!
accelerate: aVehicle 

	aVehicle tryAccelerateWhenOff .	! !


!StateOff methodsFor: 'on/off' stamp: 'ml 4/5/2025 20:25:26'!
tryChangeState: aVehicle

	^self.! !


!classDefinition: #StateOn category: #'3.Replace-if-Type+State'!
VehicleState subclass: #StateOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!StateOn methodsFor: 'move' stamp: 'ml 4/5/2025 19:43:24'!
accelerate: aVehicle 

	aVehicle tryAccelerateWhenOn.	! !


!StateOn methodsFor: 'on/off' stamp: 'ml 4/5/2025 20:25:26'!
tryChangeState: aVehicle

	aVehicle restoreAccelerationWhenTurnOff ! !
