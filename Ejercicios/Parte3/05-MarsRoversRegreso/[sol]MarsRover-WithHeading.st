!classDefinition: #MarsRoverTest category: #'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:21:23'!
test01DoesNotMoveWhenNoCommand

	self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: '' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:12'!
test02IsAtFailsForDifferentPosition

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@2 heading: self north)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:31'!
test03IsAtFailsForDifferentHeading

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@1 heading: self south)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:17'!
test04IncrementsYAfterMovingForwardWhenHeadingNorth

	self 
		assertIsAt: 1@3 
		heading: self north 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:11'!
test06DecrementsYAfterMovingBackwardsWhenHeadingNorth

	self 
		assertIsAt: 1@1 
		heading: self north 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:59'!
test07PointToEashAfterRotatingRightWhenHeadingNorth

	self 
		assertIsAt: 1@2 
		heading: self east 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:51'!
test08PointsToWestAfterRotatingLeftWhenPointingNorth

	self 
		assertIsAt: 1@2 
		heading: self west 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:45'!
test09DoesNotProcessInvalidCommand

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: self north.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: self north) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:39'!
test10CanProcessMoreThanOneCommand

	self 
		assertIsAt: 1@4 
		heading: self north 
		afterProcessing: 'ff' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:31'!
test11IncrementsXAfterMovingForwareWhenHeadingEast

	self 
		assertIsAt: 2@2 
		heading: self east 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:19'!
test12DecrementsXAfterMovingBackwardWhenHeadingEast

	self 
		assertIsAt: 0@2 
		heading: self east 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:14'!
test13PointsToSouthAfterRotatingRightWhenHeadingEast

		self 
		assertIsAt: 1@2 
		heading: self south 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:05'!
test14PointsToNorthAfterRotatingLeftWhenPointingEast

		self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:00'!
test15ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingSouth

	self 
		assertIsAt: 1@1 
		heading: self west 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self south 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:52'!
test16ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingWest

	self 
		assertIsAt: 0@2 
		heading: self north 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self west 
! !


!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:31'!
east

	^ MarsRoverHeadingEast ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:38'!
north

	^ MarsRoverHeadingNorth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:45'!
south

	^ MarsRoverHeadingSouth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:54'!
west

	^ MarsRoverHeadingWest ! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'HAW 10/7/2021 20:20:47'!
assertIsAt: newPosition heading: newHeadingType afterProcessing: commands whenStartingAt: startPosition heading: startHeadingType

	| marsRover |
	
	marsRover := MarsRover at: startPosition heading: startHeadingType. 
	
	marsRover process: commands.
	
	self assert: (marsRover isAt: newPosition heading: newHeadingType)! !


!classDefinition: #ObserversMarsRoverTest category: #'MarsRover-WithHeading'!
TestCase subclass: #ObserversMarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!ObserversMarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 11/12/2024 20:17:23'!
assertIsAt: newPosition heading: newHeadingType afterProcessing: commands whenStartingAt: startPosition heading: startHeadingType

	| marsRover |
	
	marsRover := MarsRover at: startPosition heading: startHeadingType. 
	
	marsRover process: commands.
	
	self assert: (marsRover isAt: newPosition heading: newHeadingType)! !

!ObserversMarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 11/12/2024 20:17:43'!
north

	^ MarsRoverHeadingNorth ! !

!ObserversMarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 11/13/2024 16:36:21'!
test01LogOnlySaveWhenMarsRoverStateChanges
	
	| log marsRover |
	
	log := Log new.
	
	marsRover := MarsRover at: 1@1  heading: self north. 
	
	marsRover attachPosition: log.
	
	marsRover process: '' .
	
	self assert: (log isEmpty ).
! !

!ObserversMarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 11/13/2024 16:36:57'!
test02LogSaveAChangeOfMarsRoverPosition
	
	| log marsRover |
	
	log := Log new.
	
	marsRover := MarsRover at: 1@1  heading: self north. 
	
	marsRover attachPosition: log.
	
	marsRover process: 'f' .
	
	self assert: (log  lastRegister: ('1@2')).
! !

!ObserversMarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 11/13/2024 16:57:59'!
test03LogSaveMultiplesChangesOfMarsRoverPosition
	
	| log marsRover |
	
	log := Log new.
	
	marsRover := MarsRover at: 1@1  heading: self north. 
	
	marsRover attachPosition: log.
	
	marsRover process: 'ff' .
	
	self assert: true.
! !

!ObserversMarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 11/13/2024 16:52:49'!
test04LogSaveAChangeOfMarsRoverHeading
	
	| log marsRover |
	
	log := Log new.
	
	marsRover := MarsRover at: 1@1  heading: self north. 
	
	marsRover attachHeading: log.
	
	marsRover process: 'r' .
	
	self assert: (log  lastRegister: ('East')).
! !

!ObserversMarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 11/13/2024 16:57:22'!
test05LogSaveMultiplesChangesOfMarsRoverHeading
	
	| log marsRover |
	
	log := Log new.
	
	marsRover := MarsRover at: 1@1  heading: self north. 
	
	marsRover attachHeading: log.
	
	marsRover process: 'rr' .
	
	self assert: true.
! !

!ObserversMarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 11/13/2024 17:31:16'!
test06WindowShouldBeEmptyWhenMarsRoverStateDoenstChange
	
	| win marsRover |
	
	win := Window new.
	
	marsRover := MarsRover at: 1@1  heading: self north. 
	
	marsRover attachHeading: win.
	marsRover attachPosition: win.
	
	marsRover process: '' .
	
	self assert: (win havePosition: '' andHeading: '').
! !

!ObserversMarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 11/13/2024 17:35:46'!
test07WindowOnlyChangesPositionWhenMoving
	
	| win marsRover |
	
	win := Window new.
	
	marsRover := MarsRover at: 1@1  heading: self north. 
	
	marsRover attachHeading: win.
	marsRover attachPosition: win.
	
	marsRover process: 'f' .
	
	self assert: (win havePosition: '1@2' andHeading: '').
! !

!ObserversMarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 11/13/2024 17:36:33'!
test08WindowOnlyChangesHeadingWhenRotate
	
	| win marsRover |
	
	win := Window new.
	
	marsRover := MarsRover at: 1@1  heading: self north. 
	
	marsRover attachHeading: win.
	marsRover attachPosition: win.
	
	marsRover process: 'r' .
	
	self assert: (win havePosition: '' andHeading: 'East').
! !

!ObserversMarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 11/13/2024 17:43:10'!
test09WindowAndLogShouldChangeRegisterWhenProcessCommand
	
	| win marsRover log |
	
	win := Window new.
	log := Log new.
	
	marsRover := MarsRover at: 1@1  heading: self north. 
	
	marsRover attachHeading: win.
	marsRover attachPosition: win.
	marsRover attachPosition: log.
	
	marsRover process: 'f' .
	
	self assert: (win havePosition: '1@2' andHeading: '').
	self assert: (log  lastRegister: ('1@2')).
! !


!classDefinition: #MarsRover category: #'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head positionObservers headingObservers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'ml 11/13/2024 17:47:56'!
initializeAt: aPosition heading: aHeadingType

	position := aPosition.
	head := aHeadingType for: self.
	positionObservers := OrderedCollection new.
	headingObservers := OrderedCollection new.! !


!MarsRover methodsFor: 'heading' stamp: 'ml 11/13/2024 17:50:08'!
headEast
	
	head := MarsRoverHeadingEast for: self.
	headingObservers do: [:observer | observer notifyChangeHeading: 'East'] .! !

!MarsRover methodsFor: 'heading' stamp: 'ml 11/13/2024 17:51:11'!
headNorth
	
	head := MarsRoverHeadingNorth for: self .
	headingObservers do: [:observer | observer notifyChangeHeading: 'North'] .! !

!MarsRover methodsFor: 'heading' stamp: 'ml 11/13/2024 17:51:25'!
headSouth
	
	head := MarsRoverHeadingSouth for: self.
	headingObservers do: [:observer | observer notifyChangeHeading: 'South'] .! !

!MarsRover methodsFor: 'heading' stamp: 'ml 11/13/2024 17:51:33'!
headWest
	
	head := MarsRoverHeadingWest for: self .
	headingObservers do: [:observer | observer notifyChangeHeading: 'West'] .! !


!MarsRover methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:16:32'!
isAt: aPosition heading: aHeadingType

	^position = aPosition and: [ head isHeading: aHeadingType ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	head moveBackward! !

!MarsRover methodsFor: 'moving' stamp: 'ml 11/13/2024 17:50:47'!
moveEast
	
	position := position + (1@0).
	positionObservers do: [:observer | observer notifyChangePosition: position] .! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	head moveForward! !

!MarsRover methodsFor: 'moving' stamp: 'ml 11/13/2024 17:49:28'!
moveNorth
	
	position := position + (0@1).
	positionObservers do: [:observer | observer notifyChangePosition: position] .! !

!MarsRover methodsFor: 'moving' stamp: 'ml 11/13/2024 17:50:35'!
moveSouth
	
	position := position + (0@-1).
	positionObservers do: [:observer | observer notifyChangePosition: position] .! !

!MarsRover methodsFor: 'moving' stamp: 'ml 11/13/2024 17:50:39'!
moveWest
	
	position := position + (-1@0).
	positionObservers do: [:observer | observer notifyChangePosition: position] .! !


!MarsRover methodsFor: 'command processing' stamp: 'HAW 6/30/2018 19:48:26'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 8/22/2019 12:08:50'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !


!MarsRover methodsFor: 'rotate' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	head rotateLeft! !

!MarsRover methodsFor: 'rotate' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	head rotateRight! !


!MarsRover methodsFor: 'observer attach' stamp: 'ml 11/13/2024 17:48:16'!
attachHeading: aObserver 
	
	headingObservers add: aObserver .! !

!MarsRover methodsFor: 'observer attach' stamp: 'ml 11/13/2024 17:48:10'!
attachPosition: aObserver 
	
	positionObservers add: aObserver .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:10:30'!
at: aPosition heading: aHeadingType
	
	^self new initializeAt: aPosition heading: aHeadingType! !


!classDefinition: #MarsRoverHeading category: #'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:15:38'!
isHeading: aHeadingType

	^self isKindOf: aHeadingType ! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'initialization' stamp: 'HAW 10/7/2021 20:11:59'!
initializeFor: aMarsRover 
	
	marsRover := aMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: #'MarsRover-WithHeading'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:11:35'!
for: aMarsRover 
	
	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverHeadingEast category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headSouth! !


!classDefinition: #MarsRoverHeadingNorth category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headEast! !


!classDefinition: #MarsRoverHeadingSouth category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headWest! !


!classDefinition: #MarsRoverHeadingWest category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	^marsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headNorth! !


!classDefinition: #Observer category: #'MarsRover-WithHeading'!
Object subclass: #Observer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!Observer methodsFor: 'as yet unclassified' stamp: 'ml 11/13/2024 17:45:24'!
initialize

	self subclassResponsibility! !

!Observer methodsFor: 'as yet unclassified' stamp: 'ml 11/13/2024 17:44:48'!
notifyChangeHeading: aNewHeading

	self subclassResponsibility! !

!Observer methodsFor: 'as yet unclassified' stamp: 'ml 11/13/2024 17:45:00'!
notifyChangePosition: aNewPosition

	self subclassResponsibility! !


!classDefinition: #Log category: #'MarsRover-WithHeading'!
Observer subclass: #Log
	instanceVariableNames: 'storedData'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!Log methodsFor: 'initialize' stamp: 'ml 11/13/2024 16:13:14'!
initialize

	storedData := OrderedCollection new.
! !


!Log methodsFor: 'notify' stamp: 'ml 11/13/2024 16:44:19'!
notifyChangeHeading: aNewHeading 
	
	storedData add: aNewHeading .! !

!Log methodsFor: 'notify' stamp: 'ml 11/13/2024 16:30:34'!
notifyChangePosition: aNewPosition 
	
	storedData add: (aNewPosition asString) .! !


!Log methodsFor: 'as yet unclassified' stamp: 'ml 11/13/2024 16:13:14'!
isEmpty

	^storedData isEmpty.! !

!Log methodsFor: 'as yet unclassified' stamp: 'ml 11/13/2024 16:26:35'!
lastRegister: aPositionToAssert	
	
	^  (storedData ifEmpty: [''] ifNotEmpty: [ storedData atLast: (storedData size )]) = aPositionToAssert .! !


!classDefinition: #Window category: #'MarsRover-WithHeading'!
Observer subclass: #Window
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!Window methodsFor: 'notify' stamp: 'ml 11/13/2024 17:37:05'!
notifyChangeHeading: aNewHeading 

	heading := aNewHeading .! !

!Window methodsFor: 'notify' stamp: 'ml 11/13/2024 17:34:55'!
notifyChangePosition: aNewPosition 

	position := aNewPosition asString .	! !


!Window methodsFor: 'initialize' stamp: 'ml 11/13/2024 17:29:47'!
initialize
	
	position := ''.
	heading := ''.! !


!Window methodsFor: 'as yet unclassified' stamp: 'ml 11/13/2024 17:29:18'!
havePosition: aPositionToAssert andHeading: aHeadingToAssert 

	^ position =  aPositionToAssert and: heading = aHeadingToAssert .! !
