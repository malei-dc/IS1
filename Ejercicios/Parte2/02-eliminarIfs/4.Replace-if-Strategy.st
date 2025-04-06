!classDefinition: #VehicleTests category: #'4.Replace-if-Strategy'!
TestCase subclass: #VehicleTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleTests methodsFor: 'creation' stamp: 'ml 4/5/2025 21:48:34'!
electricMotorcycle

	^ Motorcycle new initializeWithEngineType: #ElectricEngine andSurroundings: City new.
! !

!VehicleTests methodsFor: 'creation' stamp: 'ml 4/5/2025 21:50:11'!
gasolineMotorcycle

	^ Motorcycle new  initializeWithEngineType: #GasolineEngine andSurroundings: OpenRoad new
! !

!VehicleTests methodsFor: 'creation' stamp: 'ml 4/5/2025 21:50:36'!
helicopter

	^ Helicopter new initializeWithEngineType: #JetFueledEngine andSurroundings: Skies new! !


!VehicleTests methodsFor: 'testing' stamp: 'ml 4/5/2025 21:21:25'!
test01LandVehicleCannotAccelerateWhileTurnedOff

	| landVehicle |
	
	landVehicle := self electricMotorcycle.
	
	self should: [ landVehicle accelerate.] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not run when turned off'.
		self assert: (landVehicle speedAt: (0 * kilometer / hour)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'ml 4/5/2025 21:24:55'!
test02AirVehicleCannotAccelerateWhileTurnedOff

	| airVehicle |
	
	airVehicle := self helicopter.
	
	self should: [ airVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not fly when turned off'.
		self assert: (airVehicle speedAt: (0 * kilometer / hour)).
		self assert: (airVehicle altitudeAt: (0 * meter)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'ml 4/5/2025 21:26:16'!
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

!VehicleTests methodsFor: 'testing' stamp: 'ml 4/5/2025 21:26:22'!
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

!VehicleTests methodsFor: 'testing' stamp: 'ml 4/5/2025 21:25:03'!
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

!VehicleTests methodsFor: 'testing' stamp: 'ml 4/5/2025 21:25:07'!
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

!VehicleTests methodsFor: 'testing' stamp: 'ml 4/5/2025 21:26:28'!
test07SpeedLimiterForCityLimitsSpeedAt70Kmh

	| cityVehicle |
	
	cityVehicle := self electricMotorcycle.
	
	cityVehicle turnOn.
	self assert: (cityVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ cityVehicle accelerate ].
	
	self assert: (cityVehicle speedAt: 70 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'ml 4/5/2025 21:26:32'!
test08SpeedLimiterForOpenRoadLimitsSpeedAt130Kmh

	| openRoadVehicle |
	
	openRoadVehicle := self gasolineMotorcycle.
	
	openRoadVehicle turnOn.
	self assert: (openRoadVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ openRoadVehicle accelerate ].
	
	self assert: (openRoadVehicle speedAt: 130 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'ml 4/5/2025 21:25:12'!
test09SpeedLimiterForAirTrafficLimitsSpeedAt500Kmh

	| vehicleInAir |
	
	vehicleInAir := self helicopter.
	
	vehicleInAir turnOn.
	self assert: (vehicleInAir speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ vehicleInAir accelerate ].
	
	self assert: (vehicleInAir speedAt: 500 * kilometer / hour)
	
	
	! !


!classDefinition: #Surrounding category: #'4.Replace-if-Strategy'!
Object subclass: #Surrounding
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Surrounding methodsFor: 'move' stamp: 'ml 4/5/2025 21:59:33'!
checkSpeedLimitFor: aVehicle

	self subclassResponsibility! !


!classDefinition: #City category: #'4.Replace-if-Strategy'!
Surrounding subclass: #City
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!City methodsFor: 'move' stamp: 'ml 4/5/2025 21:59:33'!
checkSpeedLimitFor: aVehicle

	aVehicle speedLimitForCity.! !


!classDefinition: #OpenRoad category: #'4.Replace-if-Strategy'!
Surrounding subclass: #OpenRoad
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!OpenRoad methodsFor: 'move' stamp: 'ml 4/5/2025 21:59:33'!
checkSpeedLimitFor: aVehicle

	aVehicle speedLimitForOpenRoad .! !


!classDefinition: #Skies category: #'4.Replace-if-Strategy'!
Surrounding subclass: #Skies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Skies methodsFor: 'move' stamp: 'ml 4/5/2025 21:59:33'!
checkSpeedLimitFor: aVehicle

	aVehicle speedLimitForSkies .! !


!classDefinition: #Vehicle category: #'4.Replace-if-Strategy'!
Object subclass: #Vehicle
	instanceVariableNames: 'state speed engineType where'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Vehicle methodsFor: 'initialization' stamp: 'ml 4/5/2025 21:16:48'!
initializeWithEngineType: anEngineType andSurroundings: surroundings

	state := StateOff new.
	engineType := anEngineType.
	where := surroundings.
	speed := 0 * kilometer / hour.! !


!Vehicle methodsFor: 'move' stamp: 'ml 4/5/2025 21:59:33'!
accelerate

	state accelerate: self.
	where checkSpeedLimitFor: self. 
	"
	state = #Off ifTrue: [ self error: self canNotAccelerateErrorMessage ].
	
	engineType = #ElectricEngine ifTrue: [ acceleration := (speed + (5 * kilometer / hour)) * 2 ].
	engineType = #GasolineEngine ifTrue: [ acceleration := 10 * kilometer / hour ].
	engineType = #JetFueledEngine ifTrue: [ acceleration := ((speed amount + 1) ^ 2) * kilometer / hour ].

	
	type = #Helicopter
		ifTrue:[ speed := speed + acceleration.
			altitude := altitude + (5 * meter) ].
		
	type = #Motorcycle
		ifTrue:[ speed := speed + acceleration ].
		
	where = #city ifTrue: [ speed > (70 * kilometer / hour) ifTrue: [ speed := 70 * kilometer / hour ] ].
	where = #openRoad ifTrue: [ speed > (130 * kilometer / hour) ifTrue: [ speed := 130 * kilometer / hour ] ].
	where = #skies ifTrue: [ speed > (500 * kilometer / hour) ifTrue: [ speed := 500 * kilometer / hour ] ]
	"! !

!Vehicle methodsFor: 'move' stamp: 'NR 9/7/2024 18:23:27'!
speedAt: aSpeed

	^ speed = aSpeed! !

!Vehicle methodsFor: 'move' stamp: 'ml 4/5/2025 21:54:32'!
speedLimitForCity

	speed > (70 * kilometer / hour) ifTrue: [ speed := 70 * kilometer / hour ]
! !

!Vehicle methodsFor: 'move' stamp: 'ml 4/5/2025 21:55:04'!
speedLimitForOpenRoad

	speed > (130 * kilometer / hour) ifTrue: [ speed := 130 * kilometer / hour ]
! !

!Vehicle methodsFor: 'move' stamp: 'ml 4/5/2025 21:55:25'!
speedLimitForSkies

	speed > (500 * kilometer / hour) ifTrue: [ speed := 500 * kilometer / hour ].! !

!Vehicle methodsFor: 'move' stamp: 'ml 4/5/2025 21:00:50'!
tryToAccelerateWhenOff

	self error: self canNotAccelerateErrorMessage
! !

!Vehicle methodsFor: 'move' stamp: 'ml 4/5/2025 21:30:59'!
tryToAccelerateWhenOn

	self subclassResponsibility! !


!Vehicle methodsFor: 'on/off' stamp: 'ml 4/5/2025 21:04:39'!
turnOff

	state := StateOff new.
	speed := 0 * kilometer / hour! !

!Vehicle methodsFor: 'on/off' stamp: 'ml 4/5/2025 20:54:49'!
turnOn

	state := StateOn new.! !


!Vehicle methodsFor: 'error messages' stamp: 'ml 4/5/2025 21:10:31'!
canNotAccelerateErrorMessage

	self subclassResponsibility! !


!classDefinition: #Helicopter category: #'4.Replace-if-Strategy'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Helicopter methodsFor: 'move' stamp: 'ml 4/5/2025 21:10:02'!
altitudeAt: anAltitude

	^ altitude = anAltitude! !

!Helicopter methodsFor: 'move' stamp: 'ml 4/5/2025 21:32:03'!
tryToAccelerateWhenOn

	| acceleration |
	engineType = #ElectricEngine ifTrue: [ acceleration := (speed + (5 * kilometer / hour)) * 2 ].
	engineType = #GasolineEngine ifTrue: [ acceleration := 10 * kilometer / hour ].
	engineType = #JetFueledEngine ifTrue: [ acceleration := ((speed amount + 1) ^ 2) * kilometer / hour ].
	
	speed := speed + acceleration.
	altitude := altitude + (5 * meter)
		
! !


!Helicopter methodsFor: 'error messages' stamp: 'ml 4/5/2025 21:10:50'!
canNotAccelerateErrorMessage

	^'Can not fly when turned off'! !


!Helicopter methodsFor: 'initialization' stamp: 'ml 4/5/2025 21:16:31'!
initializeWithEngineType: anEngineType andSurroundings: surroundings

	super initializeWithEngineType: anEngineType andSurroundings: surroundings .
	altitude := 0 * meter
	! !


!classDefinition: #Motorcycle category: #'4.Replace-if-Strategy'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Motorcycle methodsFor: 'error messages' stamp: 'ml 4/5/2025 21:11:03'!
canNotAccelerateErrorMessage

	^'Can not run when turned off'! !


!Motorcycle methodsFor: 'initialization' stamp: 'ml 4/5/2025 21:17:10'!
initializeWithEngineType: anEngineType andSurroundings: surroundings

	super initializeWithEngineType: anEngineType andSurroundings: surroundings .! !


!Motorcycle methodsFor: 'move' stamp: 'ml 4/5/2025 21:32:39'!
tryToAccelerateWhenOn

	
	| acceleration |
	engineType = #ElectricEngine ifTrue: [ acceleration := (speed + (5 * kilometer / hour)) * 2 ].
	engineType = #GasolineEngine ifTrue: [ acceleration := 10 * kilometer / hour ].
	engineType = #JetFueledEngine ifTrue: [ acceleration := ((speed amount + 1) ^ 2) * kilometer / hour ].

	speed := speed + acceleration
	! !


!classDefinition: #VehicleState category: #'4.Replace-if-Strategy'!
Object subclass: #VehicleState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleState methodsFor: 'move' stamp: 'ml 4/5/2025 20:55:44'!
accelerate: aVehicle

	self subclassResponsibility! !


!classDefinition: #StateOff category: #'4.Replace-if-Strategy'!
VehicleState subclass: #StateOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!StateOff methodsFor: 'move' stamp: 'ml 4/5/2025 20:58:24'!
accelerate: aVehicle 

	aVehicle tryToAccelerateWhenOff.! !


!classDefinition: #StateOn category: #'4.Replace-if-Strategy'!
VehicleState subclass: #StateOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!StateOn methodsFor: 'move' stamp: 'ml 4/5/2025 21:27:43'!
accelerate: aVehicle 

	aVehicle tryToAccelerateWhenOn.

! !
