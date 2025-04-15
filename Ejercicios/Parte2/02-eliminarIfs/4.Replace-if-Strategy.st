!classDefinition: #VehicleTests category: #'4.Replace-if-Strategy'!
TestCase subclass: #VehicleTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleTests methodsFor: 'creation' stamp: 'ml 4/14/2025 21:03:12'!
electricMotorcycle

	^ Motorcycle new initializeWithEngineType: ElectricEngine new andSpeedlimit: (70 * kilometer / hour).
! !

!VehicleTests methodsFor: 'creation' stamp: 'ml 4/14/2025 21:03:24'!
gasolineMotorcycle

	^ Motorcycle new  initializeWithEngineType: GasolineEngine new andSpeedlimit: (130 * kilometer / hour)
! !

!VehicleTests methodsFor: 'creation' stamp: 'ml 4/14/2025 21:03:33'!
helicopter

	^ Helicopter new initializeWithEngineType: JetFueledEngine new andSpeedlimit: (500 * kilometer / hour)! !


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


!classDefinition: #Engine category: #'4.Replace-if-Strategy'!
Object subclass: #Engine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Engine methodsFor: 'move' stamp: 'ml 4/6/2025 00:29:12'!
getAcceleration: forAVehicle

	self subclassResponsibility! !


!classDefinition: #ElectricEngine category: #'4.Replace-if-Strategy'!
Engine subclass: #ElectricEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!ElectricEngine methodsFor: 'move' stamp: 'ml 4/6/2025 00:40:12'!
getAcceleration: forAVehicle

	^forAVehicle electricEngineAcceleration .! !


!classDefinition: #GasolineEngine category: #'4.Replace-if-Strategy'!
Engine subclass: #GasolineEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!GasolineEngine methodsFor: 'move' stamp: 'ml 4/6/2025 00:40:41'!
getAcceleration: forAVehicle

	^forAVehicle gasolineEngineAcceleration .! !


!classDefinition: #JetFueledEngine category: #'4.Replace-if-Strategy'!
Engine subclass: #JetFueledEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!JetFueledEngine methodsFor: 'move' stamp: 'ml 4/6/2025 00:40:47'!
getAcceleration: forAVehicle

	^forAVehicle jetFueledEngineAcceleration .! !


!classDefinition: #SpeedLimiter category: #'4.Replace-if-Strategy'!
Object subclass: #SpeedLimiter
	instanceVariableNames: 'limit'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!SpeedLimiter methodsFor: 'as yet unclassified' stamp: 'ml 4/14/2025 21:00:27'!
initializeWith: aSpeedLimit

	limit := aSpeedLimit .! !

!SpeedLimiter methodsFor: 'as yet unclassified' stamp: 'ml 4/14/2025 21:01:25'!
limitToCheck

	^limit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SpeedLimiter class' category: #'4.Replace-if-Strategy'!
SpeedLimiter class
	instanceVariableNames: ''!

!SpeedLimiter class methodsFor: 'as yet unclassified' stamp: 'ml 4/14/2025 20:58:42'!
limit: aSpeedLimitForVehicle

	^self new initializeWith: aSpeedLimitForVehicle .! !


!classDefinition: #Vehicle category: #'4.Replace-if-Strategy'!
Object subclass: #Vehicle
	instanceVariableNames: 'state speed engineType speedLimiter'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Vehicle methodsFor: 'initialization' stamp: 'ml 4/14/2025 20:57:23'!
initializeWithEngineType: anEngineType andSpeedlimit: aSpeedLimitForTheLimiter

	state := StateOff on: self.
	engineType := anEngineType.
	speedLimiter := SpeedLimiter limit: aSpeedLimitForTheLimiter.
	speed := 0 * kilometer / hour.! !


!Vehicle methodsFor: 'speed' stamp: 'ml 4/14/2025 21:06:30'!
checkSpeedLimit

	speed := (speedLimiter limitToCheck) min: speed.
	"speed := (70 * kilometer / hour) min: speed .	
	speed > (70 * kilometer / hour) ifTrue: [ speed := 70 * kilometer / hour ]"
! !

!Vehicle methodsFor: 'speed' stamp: 'NR 9/7/2024 18:23:27'!
speedAt: aSpeed

	^ speed = aSpeed! !


!Vehicle methodsFor: 'on/off' stamp: 'ml 4/14/2025 20:35:49'!
turnOff

	state := StateOff on:self.
	speed := 0 * kilometer / hour! !

!Vehicle methodsFor: 'on/off' stamp: 'ml 4/14/2025 20:35:56'!
turnOn

	state := StateOn on: self.! !


!Vehicle methodsFor: 'error messages' stamp: 'ml 4/5/2025 21:10:31'!
canNotAccelerateErrorMessage

	self subclassResponsibility! !


!Vehicle methodsFor: 'acceleration' stamp: 'ml 4/14/2025 21:05:01'!
accelerate

	state accelerate: self.
	self checkSpeedLimit. 
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

!Vehicle methodsFor: 'acceleration' stamp: 'ml 4/6/2025 00:37:19'!
electricEngineAcceleration	

	^(speed + (5 * kilometer / hour)) * 2 ! !

!Vehicle methodsFor: 'acceleration' stamp: 'ml 4/6/2025 00:37:16'!
gasolineEngineAcceleration	

	^10 * kilometer / hour! !

!Vehicle methodsFor: 'acceleration' stamp: 'ml 4/6/2025 00:37:11'!
jetFueledEngineAcceleration	

	^((speed amount + 1) ^ 2) * kilometer / hour ! !

!Vehicle methodsFor: 'acceleration' stamp: 'ml 4/5/2025 21:00:50'!
tryToAccelerateWhenOff

	self error: self canNotAccelerateErrorMessage
! !

!Vehicle methodsFor: 'acceleration' stamp: 'ml 4/6/2025 00:51:44'!
tryToAccelerateWhenOn

	| acceleration |
	"
	engineType = #ElectricEngine ifTrue: [ acceleration := (speed + (5 * kilometer / hour)) * 2 ].
	engineType = #GasolineEngine ifTrue: [ acceleration := 10 * kilometer / hour ].
	engineType = #JetFueledEngine ifTrue: [ acceleration := ((speed amount + 1) ^ 2) * kilometer / hour ].
	"
	
	acceleration := engineType getAcceleration: self.

	speed := speed + acceleration! !


!classDefinition: #Helicopter category: #'4.Replace-if-Strategy'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Helicopter methodsFor: 'move' stamp: 'ml 4/5/2025 21:10:02'!
altitudeAt: anAltitude

	^ altitude = anAltitude! !

!Helicopter methodsFor: 'move' stamp: 'ml 4/6/2025 00:52:10'!
tryToAccelerateWhenOn

	super tryToAccelerateWhenOn. 
	altitude := altitude + (5 * meter)
		
! !


!Helicopter methodsFor: 'error messages' stamp: 'ml 4/5/2025 21:10:50'!
canNotAccelerateErrorMessage

	^'Can not fly when turned off'! !


!Helicopter methodsFor: 'on/off' stamp: 'ml 4/6/2025 00:19:25'!
turnOff

	super turnOff .
	altitude := 0 * meter! !


!Helicopter methodsFor: 'initialization' stamp: 'ml 4/14/2025 20:56:12'!
initializeWithEngineType: anEngineType andSpeedlimit: surroundings

	super initializeWithEngineType: anEngineType andSpeedlimit: surroundings .
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


!Motorcycle methodsFor: 'initialization' stamp: 'ml 4/14/2025 20:56:12'!
initializeWithEngineType: anEngineType andSpeedlimit: surroundings

	super initializeWithEngineType: anEngineType andSpeedlimit: surroundings .! !


!Motorcycle methodsFor: 'move' stamp: 'ml 4/6/2025 00:51:37'!
tryToAccelerateWhenOn

	super tryToAccelerateWhenOn .
	! !


!Motorcycle methodsFor: 'on/off' stamp: 'ml 4/6/2025 00:53:34'!
turnOff

	super turnOff .! !


!classDefinition: #VehicleState category: #'4.Replace-if-Strategy'!
Object subclass: #VehicleState
	instanceVariableNames: 'vehicle'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleState methodsFor: 'move' stamp: 'ml 4/14/2025 20:37:44'!
accelerate

	self subclassResponsibility! !

!VehicleState methodsFor: 'move' stamp: 'ml 4/14/2025 20:37:03'!
initializeWith: anVehicle

	vehicle:= anVehicle .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VehicleState class' category: #'4.Replace-if-Strategy'!
VehicleState class
	instanceVariableNames: ''!

!VehicleState class methodsFor: 'as yet unclassified' stamp: 'ml 4/14/2025 20:36:37'!
on: anVehicle

	^self new initializeWith: anVehicle .! !


!classDefinition: #StateOff category: #'4.Replace-if-Strategy'!
VehicleState subclass: #StateOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!StateOff methodsFor: 'move' stamp: 'ml 4/14/2025 20:37:19'!
accelerate

	vehicle tryToAccelerateWhenOff.! !


!classDefinition: #StateOn category: #'4.Replace-if-Strategy'!
VehicleState subclass: #StateOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!StateOn methodsFor: 'move' stamp: 'ml 4/14/2025 20:37:33'!
accelerate 

	vehicle tryToAccelerateWhenOn.

! !

!StateOn methodsFor: 'move' stamp: 'ml 4/5/2025 21:27:43'!
accelerate: aVehicle 

	aVehicle tryToAccelerateWhenOn.

! !
