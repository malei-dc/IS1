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

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/21/2025 11:56:08'!
test02moveFowardOnceLookingAtNorth

	| marsRover |
	marsRover := MarsRover lookingAt: #N withPosition: 1@1.
	
	marsRover receiveCommand: 'f'.
	
	self assert: (marsRover hasPosition: 1@2 lookingAt: #N).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/21/2025 11:56:01'!
test03moveFowardTwiceLookingAtNorth

	| marsRover |
	marsRover := MarsRover lookingAt: #N withPosition: 1@1.
	
	marsRover receiveCommand: 'ff'.
	
	self assert: (marsRover hasPosition: 1@3 lookingAt: #N).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/21/2025 11:57:20'!
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

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/21/2025 10:51:57'!
test11rotateLeftLookingAtNorth

	| marsRover |
	marsRover := MarsRover lookingAt: #N withPosition: 1@1.
	
	marsRover receiveCommand: 'l'.
	
	self assert: (marsRover hasPosition: 1@1 lookingAt: #W).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/21/2025 10:55:03'!
test12rotateLeftLookingAtWest

	| marsRover |
	marsRover := MarsRover lookingAt: #W withPosition: 1@1.
	
	marsRover receiveCommand: 'l'.
	
	self assert: (marsRover hasPosition: 1@1 lookingAt: #S).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/21/2025 10:57:33'!
test13rotateLeftLookingAtSouth

	| marsRover |
	marsRover := MarsRover lookingAt: #S withPosition: 1@1.
	
	marsRover receiveCommand: 'l'.
	
	self assert: (marsRover hasPosition: 1@1 lookingAt: #E).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/21/2025 10:58:37'!
test14rotateLeftLookingAtEast

	| marsRover |
	marsRover := MarsRover lookingAt: #E withPosition: 1@1.
	
	marsRover receiveCommand: 'l'.
	
	self assert: (marsRover hasPosition: 1@1 lookingAt: #N).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/21/2025 11:03:38'!
test15rotateRightLookingAtNorth

	| marsRover |
	marsRover := MarsRover lookingAt: #N withPosition: 1@1.
	
	marsRover receiveCommand: 'r'.
	
	self assert: (marsRover hasPosition: 1@1 lookingAt: #E).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/21/2025 11:05:10'!
test16rotateRightLookingAtEast

	| marsRover |
	marsRover := MarsRover lookingAt: #E withPosition: 1@1.
	
	marsRover receiveCommand: 'r'.
	
	self assert: (marsRover hasPosition: 1@1 lookingAt: #S).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/21/2025 11:08:31'!
test17rotateRightLookingAtSouth

	| marsRover |
	marsRover := MarsRover lookingAt: #S withPosition: 1@1.
	
	marsRover receiveCommand: 'r'.
	
	self assert: (marsRover hasPosition: 1@1 lookingAt: #W).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/21/2025 11:09:54'!
test18rotateRightLookingAtWest

	| marsRover |
	marsRover := MarsRover lookingAt: #W withPosition: 1@1.
	
	marsRover receiveCommand: 'r'.
	
	self assert: (marsRover hasPosition: 1@1 lookingAt: #N).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/21/2025 11:38:59'!
test19marsRoverCantProcessInvalidCommand

	| marsRover |
	marsRover := MarsRover lookingAt: #N withPosition: 1@1.
	
	self 
		should: [ marsRover receiveCommand: 'g' ] 
		raise: Error-MessageNotUnderstood 
		withMessageText: marsRover invalidCommandErrorMessage.
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


!MarsRover methodsFor: 'testing' stamp: 'ml 5/20/2025 00:14:38'!
hasPosition: aPositionToCompare lookingAt: aDirectionToCompare
 
	^heading = aDirectionToCompare and: position = aPositionToCompare ! !


!MarsRover methodsFor: 'error msg' stamp: 'ml 5/19/2025 22:17:09'!
emptyCommandErrorMessage
	
	^'command should not be empty.'! !

!MarsRover methodsFor: 'error msg' stamp: 'ml 5/21/2025 11:40:30'!
invalidCommandErrorMessage
	
	^'invalid command.'! !


!MarsRover methodsFor: 'move' stamp: 'ml 5/20/2025 23:32:06'!
moveBackward
	
	heading = #N ifTrue: [self moveOnceToSouth ].
	heading = #S ifTrue: [self moveOnceToNorth ].
	heading = #W ifTrue: [self moveOnceToEast ].
	heading = #E ifTrue: [self moveOnceToWest ].! !

!MarsRover methodsFor: 'move' stamp: 'ml 5/20/2025 23:20:44'!
moveFoward

	heading = #N ifTrue: [self moveOnceToNorth].
	heading = #S ifTrue: [self moveOnceToSouth].
	heading = #W ifTrue: [self moveOnceToWest].
	heading = #E ifTrue: [self moveOnceToEast].! !


!MarsRover methodsFor: 'move to some direction' stamp: 'ml 5/21/2025 11:20:54'!
changePositionOneUnitToEast

	^ ((position x)+1) @position y! !

!MarsRover methodsFor: 'move to some direction' stamp: 'ml 5/21/2025 11:21:36'!
changePositionOneUnitToNorth

	^ position x@((position y)+1)! !

!MarsRover methodsFor: 'move to some direction' stamp: 'ml 5/21/2025 11:21:54'!
changePositionOneUnitToSouth

	^ position x@((position y)-1)! !

!MarsRover methodsFor: 'move to some direction' stamp: 'ml 5/21/2025 11:22:21'!
changePositionOneUnitToWest

	^ ((position x)-1)@position y! !

!MarsRover methodsFor: 'move to some direction' stamp: 'ml 5/21/2025 11:20:54'!
moveOnceToEast

	^ position := self changePositionOneUnitToEast! !

!MarsRover methodsFor: 'move to some direction' stamp: 'ml 5/21/2025 11:21:37'!
moveOnceToNorth

	^ position := self changePositionOneUnitToNorth! !

!MarsRover methodsFor: 'move to some direction' stamp: 'ml 5/21/2025 11:21:54'!
moveOnceToSouth

	^ position := self changePositionOneUnitToSouth! !

!MarsRover methodsFor: 'move to some direction' stamp: 'ml 5/21/2025 11:22:21'!
moveOnceToWest

	^ position := self changePositionOneUnitToWest! !


!MarsRover methodsFor: 'command processing' stamp: 'ml 5/21/2025 12:00:44'!
receiveCommand: aCommandLineToProccess 
	
	aCommandLineToProccess size = 0 ifTrue: [self error: self emptyCommandErrorMessage ].
	
	aCommandLineToProccess collect: [:aCommand | 
		aCommand = $f ifTrue: [self moveFoward].
		aCommand = $b ifTrue: [self moveBackward].
		aCommand = $l ifTrue: [self rotateLeft].
		aCommand = $r ifTrue: [self rotateRight].
		(self validCommands includes: aCommand) ifFalse: [self error: self invalidCommandErrorMessage.]
		].
	! !

!MarsRover methodsFor: 'command processing' stamp: 'ml 5/21/2025 11:54:18'!
validCommands

	^ #($f $b $l $r)! !


!MarsRover methodsFor: 'rotate' stamp: 'ml 5/21/2025 11:07:23'!
rotateLeft
	
	(heading = #S) ifTrue: [^ heading := #E].
	(heading = #W) ifTrue: [^heading := #S].
	(heading = #N) ifTrue: [^heading := #W].
	(heading = #E) ifTrue: [^heading := #N].
	
	
	
	! !

!MarsRover methodsFor: 'rotate' stamp: 'ml 5/21/2025 11:10:17'!
rotateRight
	
	(heading = #W) ifTrue: [^heading := #N].
	(heading = #S) ifTrue: [^heading := #W].
	(heading = #E) ifTrue: [^heading := #S].
	(heading = #N) ifTrue: [^heading := #E].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'ml 5/19/2025 22:29:49'!
lookingAt: aStartingDirection withPosition: aStartingPosition  

	^self new initializeHeading: aStartingDirection and: aStartingPosition ! !
