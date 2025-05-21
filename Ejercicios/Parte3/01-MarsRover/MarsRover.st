!classDefinition: #MarsRoverTest category: #MarsRover!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/19/2025 22:56:10'!
test01marsRoverCantProcessEmptyCommand

	| marsRover |
	marsRover := MarsRover lookingAt: #N withPosition: 1@1.
	
	self 
		should: [ marsRover receiveCommand: '' ] 
		raise: Error-MessageNotUnderstood 
		withMessageText: marsRover emptyCommandErrorMessage.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 23:26:31'!
test02moveFowardOnceLookingNorth

	| marsRover |
	marsRover := MarsRover lookingAt: #N withPosition: 1@1.
	
	marsRover receiveCommand: 'f'.
	
	self assert: (marsRover hasPosition: 1@2 lookingAt: #N).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 23:26:48'!
test03moveFowardTwiceLookingNorth

	| marsRover |
	marsRover := MarsRover lookingAt: #N withPosition: 1@1.
	
	marsRover receiveCommand: 'ff'.
	
	self assert: (marsRover hasPosition: 1@3 lookingAt: #N).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 23:27:01'!
test04moveFowardOnceLookingAtSouth

	| marsRover |
	marsRover := MarsRover lookingAt: #S withPosition: 1@1.
	
	marsRover receiveCommand: 'f'.
	
	self assert: (marsRover hasPosition: 1@0 lookingAt: #S).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 23:27:11'!
test05moveFowardOnceLookingAtWest

	| marsRover |
	marsRover := MarsRover lookingAt: #W withPosition: 1@1.
	
	marsRover receiveCommand: 'f'.
	
	self assert: (marsRover hasPosition: 0@1 lookingAt: #W).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 23:27:17'!
test06moveFowardOnceLookingAtEast

	| marsRover |
	marsRover := MarsRover lookingAt: #E withPosition: 1@1.
	
	marsRover receiveCommand: 'f'.
	
	self assert: (marsRover hasPosition: 2@1 lookingAt: #E).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 23:27:22'!
test07moveBackwardOnceLookingAtNorth

	| marsRover |
	marsRover := MarsRover lookingAt: #N withPosition: 1@1.
	
	marsRover receiveCommand: 'b'.
	
	self assert: (marsRover hasPosition: 1@0 lookingAt: #N).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 23:27:27'!
test08moveBackwardOnceLookingAtSouth

	| marsRover |
	marsRover := MarsRover lookingAt: #S withPosition: 1@1.
	
	marsRover receiveCommand: 'b'.
	
	self assert: (marsRover hasPosition: 1@2 lookingAt: #S).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 23:31:03'!
test09moveBackwardOnceLookingAtWest

	| marsRover |
	marsRover := MarsRover lookingAt: #W withPosition: 1@1.
	
	marsRover receiveCommand: 'b'.
	
	self assert: (marsRover hasPosition: 2@1 lookingAt: #W).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 23:31:37'!
test10moveBackwardOnceLookingAtEast

	| marsRover |
	marsRover := MarsRover lookingAt: #E withPosition: 1@1.
	
	marsRover receiveCommand: 'b'.
	
	self assert: (marsRover hasPosition: 0@1 lookingAt: #E).
! !


!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'heading position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'ml 5/19/2025 22:29:21'!
initializeHeading: aStartingDirection and: aStartingPosition  
	heading := aStartingDirection.
	position := aStartingPosition ! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'ml 5/19/2025 22:17:09'!
emptyCommandErrorMessage
	
	^'command should not be empty.'! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 00:14:38'!
hasPosition: aPositionToCompare lookingAt: aDirectionToCompare
 
	^heading = aDirectionToCompare and: position = aPositionToCompare ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 23:32:06'!
moveBackward
	
	heading = #N ifTrue: [self moveOnceToSouth ].
	heading = #S ifTrue: [self moveOnceToNorth ].
	heading = #W ifTrue: [self moveOnceToEast ].
	heading = #E ifTrue: [self moveOnceToWest ].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 23:20:44'!
moveFoward

	heading = #N ifTrue: [self moveOnceToNorth].
	heading = #S ifTrue: [self moveOnceToSouth].
	heading = #W ifTrue: [self moveOnceToWest].
	heading = #E ifTrue: [self moveOnceToEast].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 23:28:29'!
moveOnceToEast

	^ position := ((position x)+1) @position y! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 23:28:51'!
moveOnceToNorth

	^ position := position x@((position y)+1)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 23:29:17'!
moveOnceToSouth

	^ position := position x@((position y)-1)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 23:29:35'!
moveOnceToWest

	^ position := ((position x)-1)@position y! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ml 5/20/2025 23:22:36'!
receiveCommand: aCommandToProccess 
	
	aCommandToProccess size = 0 ifTrue: [self error: self emptyCommandErrorMessage ].
	
	aCommandToProccess collect: [:aCommand | 
		aCommand = $f ifTrue: [self moveFoward].
		aCommand = $b ifTrue: [self moveBackward].
		 ]
	"
	aCommandToProccess = 'f' ifTrue: [^position := 2@1].
	position := 0@1"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'ml 5/19/2025 22:29:49'!
lookingAt: aStartingDirection withPosition: aStartingPosition  

	^self new initializeHeading: aStartingDirection and: aStartingPosition ! !
