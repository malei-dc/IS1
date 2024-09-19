!classDefinition: #VehicleTests category: #'4.Replace-if-Strategy'!
TestCase subclass: #VehicleTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleTests methodsFor: 'testing' stamp: 'ml 9/18/2024 17:54:08'!
test01LandVehicleCannotAccelerateWhileTurnedOff

	| landVehicle |
	
	landVehicle := self electricMotorcycle.
	
	self should: [ landVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not run when turned off'.
		self assert: (landVehicle speedAt: (0 * kilometer / hour)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'ml 9/18/2024 17:54:48'!
test02AirVehicleCannotAccelerateWhileTurnedOff

	| airVehicle |
	
	airVehicle := self helicopter.
	
	self should: [ airVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not fly when turned off'.
		self assert: (airVehicle speedAt: (0 * kilometer / hour)).
		self assert: (airVehicle altitudeAt: (0 * meter)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'ml 9/18/2024 18:03:15'!
test03ElectricVehicleAccelerateAsIntended

	| electricVehicle |
	
	electricVehicle := self electricMotorcycle.
	
	electricVehicle turnOn.
	self assert: (electricVehicle speedAt: 0 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 10 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 40 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'ml 9/18/2024 18:04:31'!
test04GasolineVehicleAccelerateAsIntended

	| gasolineVehicle |
	
	gasolineVehicle := self gasolineMotorcycle.
	
	gasolineVehicle turnOn.
	self assert: (gasolineVehicle speedAt: 0 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 10 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 20 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'ml 9/18/2024 18:04:36'!
test05JetFueledVehicleAccelerateAsIntended

	| jetFueledVehicle |
	
	jetFueledVehicle := self helicopter.
	
	jetFueledVehicle turnOn.
	self assert: (jetFueledVehicle speedAt: 0 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 1 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 5 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 41 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'ml 9/18/2024 18:04:41'!
test06AirVehicleGoesUpAsItAcceleratesAsExpected

	| airVehicle |
	
	airVehicle := self helicopter.
	
	airVehicle turnOn.
	self assert: (airVehicle altitudeAt: 0 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 5 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 10 * meter)
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'ml 9/18/2024 18:04:45'!
test07SpeedLimiterForCityLimitsSpeedAt70Kmh

	| cityVehicle |
	
	cityVehicle := self electricMotorcycle.
	
	cityVehicle turnOn.
	self assert: (cityVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ cityVehicle accelerate ].
	
	self assert: (cityVehicle speedAt: 70 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'ml 9/18/2024 18:04:50'!
test08SpeedLimiterForOpenRoadLimitsSpeedAt130Kmh

	| openRoadVehicle |
	
	openRoadVehicle := self gasolineMotorcycle.
	
	openRoadVehicle turnOn.
	self assert: (openRoadVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ openRoadVehicle accelerate ].
	
	self assert: (openRoadVehicle speedAt: 130 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'ml 9/18/2024 18:04:54'!
test09SpeedLimiterForAirTrafficLimitsSpeedAt500Kmh

	| vehicleInAir |
	
	vehicleInAir := self helicopter.
	
	vehicleInAir turnOn.
	self assert: (vehicleInAir speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ vehicleInAir accelerate ].
	
	self assert: (vehicleInAir speedAt: 500 * kilometer / hour)
	
	
	! !


!VehicleTests methodsFor: 'as yet unclassified' stamp: 'ml 9/18/2024 17:50:23'!
electricMotorcycle

	^ Motorcycle withEngine: ElectricEngine new andSpeedLimiter: (SpeedLimiter limit: 70 * kilometer / hour)! !

!VehicleTests methodsFor: 'as yet unclassified' stamp: 'ml 9/18/2024 18:04:24'!
gasolineMotorcycle

	^ Motorcycle withEngine: GasolineEngine new andSpeedLimiter: (SpeedLimiter limit: 130 * kilometer / hour)! !

!VehicleTests methodsFor: 'as yet unclassified' stamp: 'ml 9/18/2024 17:49:22'!
helicopter

	^ Helicopter withEngine: JetFueledEngine new andSpeedLimiter: (SpeedLimiter limit: 500 * kilometer / hour)
	
! !


!classDefinition: #Engine category: #'4.Replace-if-Strategy'!
Object subclass: #Engine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Engine methodsFor: 'as yet unclassified' stamp: 'ml 9/18/2024 18:06:57'!
accelerate: currentSpeed

	self subclassResponsibility! !


!classDefinition: #ElectricEngine category: #'4.Replace-if-Strategy'!
Engine subclass: #ElectricEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!ElectricEngine methodsFor: 'as yet unclassified' stamp: 'ml 9/18/2024 18:34:19'!
accelerate: currentSpeed

	^(currentSpeed + (5 * kilometer / hour) * 2).! !


!classDefinition: #GasolineEngine category: #'4.Replace-if-Strategy'!
Engine subclass: #GasolineEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!GasolineEngine methodsFor: 'as yet unclassified' stamp: 'ml 9/17/2024 13:08:19'!
accelerate: currentSpeed

	^ 10 * kilometer / hour .
	! !


!classDefinition: #JetFueledEngine category: #'4.Replace-if-Strategy'!
Engine subclass: #JetFueledEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!JetFueledEngine methodsFor: 'as yet unclassified' stamp: 'ml 9/17/2024 13:09:10'!
accelerate: currentSpeed
	
	^((currentSpeed amount + 1) ^ 2) * kilometer / hour.! !


!classDefinition: #PowerStatus category: #'4.Replace-if-Strategy'!
Object subclass: #PowerStatus
	instanceVariableNames: 'vehicle'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!PowerStatus methodsFor: 'as yet unclassified' stamp: 'ml 9/17/2024 12:54:02'!
accelerate

	self subclassResponsibility.! !

!PowerStatus methodsFor: 'as yet unclassified' stamp: 'ml 9/17/2024 12:53:11'!
initializeStatusOf: aVehicle
	vehicle:= aVehicle .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PowerStatus class' category: #'4.Replace-if-Strategy'!
PowerStatus class
	instanceVariableNames: ''!

!PowerStatus class methodsFor: 'as yet unclassified' stamp: 'ml 9/18/2024 17:32:48'!
of: aVehicle

	^ self new initializeStatusOf: aVehicle ! !


!classDefinition: #Off category: #'4.Replace-if-Strategy'!
PowerStatus subclass: #Off
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Off methodsFor: 'as yet unclassified' stamp: 'ml 9/17/2024 12:54:59'!
accelerate
	vehicle accelerateWhenOff .! !


!classDefinition: #On category: #'4.Replace-if-Strategy'!
PowerStatus subclass: #On
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!On methodsFor: 'as yet unclassified' stamp: 'ml 9/17/2024 12:55:37'!
accelerate
	vehicle accelerateWhenOn .! !


!classDefinition: #SpeedLimiter category: #'4.Replace-if-Strategy'!
Object subclass: #SpeedLimiter
	instanceVariableNames: 'limit'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!SpeedLimiter methodsFor: 'as yet unclassified' stamp: 'ml 9/18/2024 17:39:34'!
initializeWithLimit: aSpeedLimit
	
	limit := aSpeedLimit .! !

!SpeedLimiter methodsFor: 'as yet unclassified' stamp: 'ml 9/18/2024 17:52:58'!
limit: aSpeed
	
	^ aSpeed min: limit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SpeedLimiter class' category: #'4.Replace-if-Strategy'!
SpeedLimiter class
	instanceVariableNames: ''!

!SpeedLimiter class methodsFor: 'as yet unclassified' stamp: 'ml 9/18/2024 17:38:43'!
limit: aSpeedLimit

	^ self new initializeWithLimit: aSpeedLimit ! !


!classDefinition: #Vehicle category: #'4.Replace-if-Strategy'!
Object subclass: #Vehicle
	instanceVariableNames: 'powerStatus speed engine speedLimiter'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Vehicle methodsFor: 'initialization' stamp: 'ml 9/18/2024 17:31:16'!
initializeWithEngine: anEngine andSpeedLimiter: aSpeedLimiter

	powerStatus := Off of: self.
	engine := anEngine.
	speedLimiter := aSpeedLimiter.
	speed := 0 * kilometer / hour.
	! !


!Vehicle methodsFor: 'move' stamp: 'ml 9/17/2024 13:32:41'!
accelerate

	powerStatus accelerate .
	


"	 [ speed > (70 * kilometer / hour) ifTrue: [ speed := 70 * kilometer / hour ] ].
	[ speed > (130 * kilometer / hour) ifTrue: [ speed := 130 * kilometer / hour ] ].
	[ speed > (500 * kilometer / hour) ifTrue: [ speed := 500 * kilometer / hour ] ]"! !

!Vehicle methodsFor: 'move' stamp: 'NR 9/7/2024 18:23:27'!
speedAt: aSpeed

	^ speed = aSpeed! !


!Vehicle methodsFor: 'on/off' stamp: 'ml 9/17/2024 13:02:39'!
turnOff

	powerStatus := Off of: self .
	speed := 0 * kilometer / hour! !

!Vehicle methodsFor: 'on/off' stamp: 'ml 9/17/2024 13:02:43'!
turnOn

	powerStatus := On of: self .! !


!Vehicle methodsFor: 'error messages' stamp: 'ml 9/17/2024 12:41:10'!
accelerateWhenOff

	self error: self canNotAccelerateErrorMessage.! !

!Vehicle methodsFor: 'error messages' stamp: 'ml 9/17/2024 13:29:25'!
accelerateWhenOn

	speed := speedLimiter limit: self accelerationSpeed.! !

!Vehicle methodsFor: 'error messages' stamp: 'ml 9/17/2024 13:36:19'!
accelerationSpeed

	^ speed + (engine accelerate: speed)! !

!Vehicle methodsFor: 'error messages' stamp: 'ml 9/17/2024 12:35:40'!
canNotAccelerateErrorMessage

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'4.Replace-if-Strategy'!
Vehicle class
	instanceVariableNames: ''!


!Vehicle class methodsFor: 'as yet unclassified' stamp: 'ml 9/18/2024 17:49:00'!
withEngine: anEngine andSpeedLimiter: aSpeedLimiter

	^ self new initializeWithEngine: anEngine andSpeedLimiter: aSpeedLimiter! !


!classDefinition: #Helicopter category: #'4.Replace-if-Strategy'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Helicopter methodsFor: 'as yet unclassified' stamp: 'ml 9/17/2024 13:27:42'!
accelerate
	super accelerate .
	altitude := altitude + (5 * meter).! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'ml 9/18/2024 17:42:22'!
altitudeAt: anAltitude

	^ altitude = anAltitude! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'ml 9/18/2024 18:00:34'!
canNotAccelerateErrorMessage

	^'Can not fly when turned off'.
	! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'ml 9/18/2024 18:29:36'!
initializeWithEngine: anEngine andSpeedLimiter: aSpeedLimiter

	super initializeWithEngine: anEngine andSpeedLimiter: aSpeedLimiter.
	altitude := 0 * meter.
	! !


!classDefinition: #Motorcycle category: #'4.Replace-if-Strategy'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'ml 9/17/2024 12:36:24'!
canNotAccelerateErrorMessage

	^'Can not run when turned off'.! !
