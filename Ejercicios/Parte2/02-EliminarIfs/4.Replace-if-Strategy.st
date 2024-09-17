!classDefinition: #VehicleTests category: #'4.Replace-if-Strategy'!
TestCase subclass: #VehicleTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:25:03'!
test01LandVehicleCannotAccelerateWhileTurnedOff

	| landVehicle |
	
	landVehicle := Vehicle electricMotorcycle.
	
	self should: [ landVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not run when turned off'.
		self assert: (landVehicle speedAt: (0 * kilometer / hour)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:27:17'!
test02AirVehicleCannotAccelerateWhileTurnedOff

	| airVehicle |
	
	airVehicle := Vehicle helicopter.
	
	self should: [ airVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not fly when turned off'.
		self assert: (airVehicle speedAt: (0 * kilometer / hour)).
		self assert: (airVehicle altitudeAt: (0 * meter)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:20'!
test03ElectricVehicleAccelerateAsIntended

	| electricVehicle |
	
	electricVehicle := Vehicle electricMotorcycle.
	
	electricVehicle turnOn.
	self assert: (electricVehicle speedAt: 0 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 10 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 40 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:16'!
test04GasolineVehicleAccelerateAsIntended

	| gasolineVehicle |
	
	gasolineVehicle := Vehicle gasolineMotorcycle.
	
	gasolineVehicle turnOn.
	self assert: (gasolineVehicle speedAt: 0 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 10 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 20 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:11'!
test05JetFueledVehicleAccelerateAsIntended

	| jetFueledVehicle |
	
	jetFueledVehicle := Vehicle helicopter.
	
	jetFueledVehicle turnOn.
	self assert: (jetFueledVehicle speedAt: 0 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 1 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 5 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 41 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:47:14'!
test06AirVehicleGoesUpAsItAcceleratesAsExpected

	| airVehicle |
	
	airVehicle := Vehicle helicopter.
	
	airVehicle turnOn.
	self assert: (airVehicle altitudeAt: 0 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 5 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 10 * meter)
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:05'!
test07SpeedLimiterForCityLimitsSpeedAt70Kmh

	| cityVehicle |
	
	cityVehicle := Vehicle electricMotorcycle.
	
	cityVehicle turnOn.
	self assert: (cityVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ cityVehicle accelerate ].
	
	self assert: (cityVehicle speedAt: 70 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:53:50'!
test08SpeedLimiterForOpenRoadLimitsSpeedAt130Kmh

	| openRoadVehicle |
	
	openRoadVehicle := Vehicle gasolineMotorcycle.
	
	openRoadVehicle turnOn.
	self assert: (openRoadVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ openRoadVehicle accelerate ].
	
	self assert: (openRoadVehicle speedAt: 130 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:55:32'!
test09SpeedLimiterForAirTrafficLimitsSpeedAt500Kmh

	| vehicleInAir |
	
	vehicleInAir := Vehicle helicopter.
	
	vehicleInAir turnOn.
	self assert: (vehicleInAir speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ vehicleInAir accelerate ].
	
	self assert: (vehicleInAir speedAt: 500 * kilometer / hour)
	
	
	! !


!classDefinition: #Engine category: #'4.Replace-if-Strategy'!
Object subclass: #Engine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #ElectricEngine category: #'4.Replace-if-Strategy'!
Engine subclass: #ElectricEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!ElectricEngine methodsFor: 'as yet unclassified' stamp: 'ml 9/17/2024 13:07:34'!
accelerate: currentSpeed

	^currentSpeed + ((5 * kilometer / hour) * 2).! !


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


!classDefinition: #Vehicle category: #'4.Replace-if-Strategy'!
Object subclass: #Vehicle
	instanceVariableNames: 'powerStatus speed engine speedLimiter'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Vehicle methodsFor: 'initialization' stamp: 'ml 9/17/2024 13:40:23'!
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

!Vehicle class methodsFor: 'instance creation' stamp: 'ml 9/17/2024 13:38:51'!
electricMotorcycle

	^ self new initializeWithEngine: ElectricEngine new andSpeedLimiter: #city

! !

!Vehicle class methodsFor: 'instance creation' stamp: 'ml 9/17/2024 13:38:51'!
gasolineMotorcycle

	^ self new initializeWithEngine: GasolineEngine new andSpeedLimiter: #openRoad! !

!Vehicle class methodsFor: 'instance creation' stamp: 'ml 9/17/2024 13:38:51'!
helicopter

	^ self new initializeWithEngine: #JetFueledEngine andSpeedLimiter: #skies! !


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

!Helicopter methodsFor: 'as yet unclassified' stamp: 'ml 9/17/2024 12:26:22'!
altitudeAt: anAltitude

	^ altitude = anAltitude! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'ml 9/17/2024 12:36:04'!
canNotAccelerateErrorMessage

	^'Can not fly when turned off'.
	! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'ml 9/17/2024 12:44:19'!
initializeWithEngineType: anEngineType andSurroundings: surroundings

	super initializeWithEngineType: anEngineType andSurroundings: surroundings.
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
