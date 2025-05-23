!classDefinition: #MarsRoverTest category: #MarsRover!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 21:50:43'!
test01marsRoverCantProcessEmptyCommand

	| marsRover |
	marsRover := MarsRover lookingAt: MarsRoverHeadingNorth new withPosition: 1@1.
	
	self 
		should: [ marsRover receiveCommand: '' ] 
		raise: Error-MessageNotUnderstood 
		withMessageText: marsRover emptyCommandErrorMessage.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 21:52:18'!
test02moveFowardOnceLookingAtNorth

	| marsRover north |
	north := MarsRoverHeadingNorth new.
	marsRover := MarsRover lookingAt: north withPosition: 1@1.
	
	marsRover receiveCommand: 'f'.
	
	self assert: (marsRover hasPosition: 1@2 lookingAt: north).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 21:58:23'!
test03moveFowardTwiceLookingAtNorth

	| marsRover north |
	north := MarsRoverHeadingNorth new.
	marsRover := MarsRover lookingAt: north withPosition: 1@1.
	
	marsRover receiveCommand: 'ff'.
	
	self assert: (marsRover hasPosition: 1@3 lookingAt: north).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 21:59:06'!
test04moveFowardOnceLookingAtSouth

	| marsRover south |
	south := MarsRoverHeadingSouth new.
	marsRover := MarsRover lookingAt: south withPosition: 1@1.
	
	marsRover receiveCommand: 'f'.
	
	self assert: (marsRover hasPosition: 1@0 lookingAt: south).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:00:12'!
test05moveFowardOnceLookingAtWest

	| marsRover west |
	west := MarsRoverHeadingWest new.
	marsRover := MarsRover lookingAt: west withPosition: 1@1.
	
	marsRover receiveCommand: 'f'.
	
	self assert: (marsRover hasPosition: 0@1 lookingAt: west).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:01:27'!
test06moveFowardOnceLookingAtEast

	| marsRover east |
	east := MarsRoverHeadingEast new.
	marsRover := MarsRover lookingAt: east withPosition: 1@1.
	
	marsRover receiveCommand: 'f'.
	
	self assert: (marsRover hasPosition: 2@1 lookingAt: east).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:03:55'!
test07moveBackwardOnceLookingAtNorth

	| marsRover north |
	north := MarsRoverHeadingNorth new.
	marsRover := MarsRover lookingAt: north withPosition: 1@1.
	
	marsRover receiveCommand: 'b'.
	
	self assert: (marsRover hasPosition: 1@0 lookingAt: north).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:07:35'!
test08moveBackwardOnceLookingAtSouth

	| marsRover south |
	south := MarsRoverHeadingSouth new.
	marsRover := MarsRover lookingAt: south withPosition: 1@1.
	
	marsRover receiveCommand: 'b'.
	
	self assert: (marsRover hasPosition: 1@2 lookingAt: south).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:08:04'!
test09moveBackwardOnceLookingAtWest

	| marsRover west |
	west := MarsRoverHeadingWest new.
	marsRover := MarsRover lookingAt: west withPosition: 1@1.
	
	marsRover receiveCommand: 'b'.
	
	self assert: (marsRover hasPosition: 2@1 lookingAt: west).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:08:42'!
test10moveBackwardOnceLookingAtEast

	| marsRover east |
	east := MarsRoverHeadingEast new.
	marsRover := MarsRover lookingAt: east withPosition: 1@1.
	
	marsRover receiveCommand: 'b'.
	
	self assert: (marsRover hasPosition: 0@1 lookingAt: east).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:15:54'!
test11rotateLeftLookingAtNorth

	| marsRover north |
	north := MarsRoverHeadingNorth new.
	marsRover := MarsRover lookingAt: north withPosition: 1@1.
	
	marsRover receiveCommand: 'l'.
	
	self assert: (marsRover hasPosition: 1@1 lookingAt: MarsRoverHeadingWest new).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:22:56'!
test12rotateLeftLookingAtWest

	| marsRover west |
	west := MarsRoverHeadingWest new.
	marsRover := MarsRover lookingAt: west withPosition: 1@1.
	
	marsRover receiveCommand: 'l'.
	
	self assert: (marsRover hasPosition: 1@1 lookingAt: MarsRoverHeadingSouth new).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:24:57'!
test13rotateLeftLookingAtSouth

	| marsRover south |
	south := MarsRoverHeadingSouth new.
	marsRover := MarsRover lookingAt: south withPosition: 1@1.
	
	marsRover receiveCommand: 'l'.
	
	self assert: (marsRover hasPosition: 1@1 lookingAt: MarsRoverHeadingEast new).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:26:08'!
test14rotateLeftLookingAtEast

	| marsRover east |
	east := MarsRoverHeadingEast new.
	marsRover := MarsRover lookingAt: east withPosition: 1@1.
	
	marsRover receiveCommand: 'l'.
	
	self assert: (marsRover hasPosition: 1@1 lookingAt: MarsRoverHeadingNorth new).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:27:52'!
test15rotateRightLookingAtNorth

	| marsRover north |
	north := MarsRoverHeadingNorth new.
	marsRover := MarsRover lookingAt: north withPosition: 1@1.
	
	marsRover receiveCommand: 'r'.
	
	self assert: (marsRover hasPosition: 1@1 lookingAt: MarsRoverHeadingEast new).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:29:57'!
test16rotateRightLookingAtEast

	| marsRover east |
	east := MarsRoverHeadingEast new.
	marsRover := MarsRover lookingAt: east withPosition: 1@1.
	
	marsRover receiveCommand: 'r'.
	
	self assert: (marsRover hasPosition: 1@1 lookingAt: MarsRoverHeadingSouth new).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:31:54'!
test17rotateRightLookingAtSouth

	| marsRover south |
	south := MarsRoverHeadingSouth new.
	marsRover := MarsRover lookingAt: south withPosition: 1@1.
	
	marsRover receiveCommand: 'r'.
	
	self assert: (marsRover hasPosition: 1@1 lookingAt: MarsRoverHeadingWest new).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:32:32'!
test18rotateRightLookingAtWest

	| marsRover west |
	west := MarsRoverHeadingWest new.
	marsRover := MarsRover lookingAt: west withPosition: 1@1.
	
	marsRover receiveCommand: 'r'.
	
	self assert: (marsRover hasPosition: 1@1 lookingAt: MarsRoverHeadingNorth new).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:32:45'!
test19marsRoverCantProcessInvalidCommand

	| marsRover |
	marsRover := MarsRover lookingAt: MarsRoverHeadingNorth new withPosition: 1@1.
	
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


!MarsRover methodsFor: 'testing' stamp: 'ml 5/22/2025 22:19:16'!
hasPosition: aPositionToCompare lookingAt: aDirectionToCompare
 
	^(heading isKindOf: aDirectionToCompare class) and: (position = aPositionToCompare )! !


!MarsRover methodsFor: 'error msg' stamp: 'ml 5/19/2025 22:17:09'!
emptyCommandErrorMessage
	
	^'command should not be empty.'! !

!MarsRover methodsFor: 'error msg' stamp: 'ml 5/21/2025 11:40:30'!
invalidCommandErrorMessage
	
	^'invalid command.'! !


!MarsRover methodsFor: 'move' stamp: 'ml 5/22/2025 22:04:46'!
moveBackward
	
	heading toMoveBackwardBy: self
	"
	heading = #N ifTrue: [self moveOnceToSouth ].
	heading = #S ifTrue: [self moveOnceToNorth ].
	heading = #W ifTrue: [self moveOnceToEast ].
	heading = #E ifTrue: [self moveOnceToWest ].
	"! !

!MarsRover methodsFor: 'move' stamp: 'ml 5/22/2025 21:56:40'!
moveFoward

	heading toMoveForwardBy: self.
	"
	heading = #N ifTrue: [self moveOnceToNorth].
	heading = #S ifTrue: [self moveOnceToSouth].
	heading = #W ifTrue: [self moveOnceToWest].
	heading = #E ifTrue: [self moveOnceToEast].
	"! !


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


!MarsRover methodsFor: 'rotate' stamp: 'ml 5/22/2025 22:25:23'!
nowHeadingToEast

	^ heading := MarsRoverHeadingEast new.! !

!MarsRover methodsFor: 'rotate' stamp: 'ml 5/22/2025 22:26:43'!
nowHeadingToNorth

	^ heading := MarsRoverHeadingNorth new.! !

!MarsRover methodsFor: 'rotate' stamp: 'ml 5/22/2025 22:23:47'!
nowHeadingToSouth

	^ heading := MarsRoverHeadingSouth new.! !

!MarsRover methodsFor: 'rotate' stamp: 'ml 5/22/2025 22:15:32'!
nowHeadingToWest

	^ heading := MarsRoverHeadingWest new! !

!MarsRover methodsFor: 'rotate' stamp: 'ml 5/22/2025 22:12:57'!
rotateLeft

	heading toRotateLeftBy: self	
	"
	(heading = #S) ifTrue: [^ self nowHeadingToEast].
	(heading = #W) ifTrue: [^self nowHeadingToSouth].
	(heading = #N) ifTrue: [^self nowHeadingToWest].
	(heading = #E) ifTrue: [^self nowHeadingToNorth].
	"! !

!MarsRover methodsFor: 'rotate' stamp: 'ml 5/22/2025 22:28:39'!
rotateRight
	
	heading toRotateRightBy: self
	"
	(heading = #W) ifTrue: [^ self nowHeadingToNorth].
	(heading = #S) ifTrue: [^ self nowHeadingToWest].
	(heading = #E) ifTrue: [^self nowHeadingToSouth].
	(heading = #N) ifTrue: [^self nowHeadingToEast].
	"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'ml 5/19/2025 22:29:49'!
lookingAt: aStartingDirection withPosition: aStartingPosition  

	^self new initializeHeading: aStartingDirection and: aStartingPosition ! !


!classDefinition: #MarsRoverHeading category: #MarsRover!
Object subclass: #MarsRoverHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeading methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:05:54'!
toMoveBackwardBy: aMovingMarsRover

	self subclassResponsibility! !

!MarsRoverHeading methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:03:21'!
toMoveForwardBy: aMovingMarsRover

	self subclassResponsibility! !

!MarsRoverHeading methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:22:29'!
toRotateLeftBy: aMarsRover

	self subclassResponsibility! !

!MarsRoverHeading methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:33:20'!
toRotateRightBy: aMarsRover

	self subclassResponsibility! !


!classDefinition: #MarsRoverHeadingEast category: #MarsRover!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadingEast methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:06:22'!
toMoveBackwardBy: aMovingMarsRover 

	aMovingMarsRover moveOnceToWest .! !

!MarsRoverHeadingEast methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:01:47'!
toMoveForwardBy: aMovingMarsRover

	aMovingMarsRover moveOnceToEast .! !

!MarsRoverHeadingEast methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:21:06'!
toRotateLeftBy: aMarsRover 
	
	aMarsRover nowHeadingToNorth .
	"
	(heading = #S) ifTrue: [^ self nowHeadingToEast].
	(heading = #W) ifTrue: [^self nowHeadingToSouth].
	(heading = #N) ifTrue: [^self nowHeadingToWest].
	(heading = #E) ifTrue: [^self nowHeadingToNorth].
	"! !

!MarsRoverHeadingEast methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:30:30'!
toRotateRightBy: aMarsRover 
	
	aMarsRover nowHeadingToSouth.
	"
	(heading = #W) ifTrue: [^ self nowHeadingToNorth].
	(heading = #S) ifTrue: [^ self nowHeadingToWest].
	(heading = #E) ifTrue: [^self nowHeadingToSouth].
	(heading = #N) ifTrue: [^self nowHeadingToEast].
	"! !


!classDefinition: #MarsRoverHeadingNorth category: #MarsRover!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadingNorth methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:05:35'!
toMoveBackwardBy: aMovingMarsRover 

	aMovingMarsRover moveOnceToSouth .! !

!MarsRoverHeadingNorth methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 21:57:34'!
toMoveForwardBy: aMovingMarsRover

	aMovingMarsRover moveOnceToNorth .! !

!MarsRoverHeadingNorth methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:20:48'!
toRotateLeftBy: aMarsRover 
	
	aMarsRover nowHeadingToWest.
	"
	(heading = #S) ifTrue: [^ self nowHeadingToEast].
	(heading = #W) ifTrue: [^self nowHeadingToSouth].
	(heading = #N) ifTrue: [^self nowHeadingToWest].
	(heading = #E) ifTrue: [^self nowHeadingToNorth].
	"! !

!MarsRoverHeadingNorth methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:29:13'!
toRotateRightBy: aMarsRover 
	
	aMarsRover nowHeadingToEast.
	"
	(heading = #W) ifTrue: [^ self nowHeadingToNorth].
	(heading = #S) ifTrue: [^ self nowHeadingToWest].
	(heading = #E) ifTrue: [^self nowHeadingToSouth].
	(heading = #N) ifTrue: [^self nowHeadingToEast].
	"! !


!classDefinition: #MarsRoverHeadingSouth category: #MarsRover!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadingSouth methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:06:44'!
toMoveBackwardBy: aMovingMarsRover 

	aMovingMarsRover moveOnceToNorth .! !

!MarsRoverHeadingSouth methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 21:59:33'!
toMoveForwardBy: aMovingMarsRover

	aMovingMarsRover moveOnceToSouth .! !

!MarsRoverHeadingSouth methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:21:56'!
toRotateLeftBy: aMarsRover 
	
	aMarsRover nowHeadingToEast.
	"
	(heading = #S) ifTrue: [^ self nowHeadingToEast].
	(heading = #W) ifTrue: [^self nowHeadingToSouth].
	(heading = #N) ifTrue: [^self nowHeadingToWest].
	(heading = #E) ifTrue: [^self nowHeadingToNorth].
	"! !

!MarsRoverHeadingSouth methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:30:53'!
toRotateRightBy: aMarsRover 
	
	aMarsRover nowHeadingToWest .
	"
	(heading = #W) ifTrue: [^ self nowHeadingToNorth].
	(heading = #S) ifTrue: [^ self nowHeadingToWest].
	(heading = #E) ifTrue: [^self nowHeadingToSouth].
	(heading = #N) ifTrue: [^self nowHeadingToEast].
	"! !


!classDefinition: #MarsRoverHeadingWest category: #MarsRover!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadingWest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:06:57'!
toMoveBackwardBy: aMovingMarsRover 

	aMovingMarsRover moveOnceToEast .! !

!MarsRoverHeadingWest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:00:34'!
toMoveForwardBy: aMovingMarsRover

	aMovingMarsRover moveOnceToWest .! !

!MarsRoverHeadingWest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:22:14'!
toRotateLeftBy: aMarsRover 
	
	aMarsRover nowHeadingToSouth.
	"
	(heading = #S) ifTrue: [^ self nowHeadingToEast].
	(heading = #W) ifTrue: [^self nowHeadingToSouth].
	(heading = #N) ifTrue: [^self nowHeadingToWest].
	(heading = #E) ifTrue: [^self nowHeadingToNorth].
	"! !

!MarsRoverHeadingWest methodsFor: 'as yet unclassified' stamp: 'ml 5/22/2025 22:31:04'!
toRotateRightBy: aMarsRover 
	
	aMarsRover nowHeadingToNorth .
	"
	(heading = #W) ifTrue: [^ self nowHeadingToNorth].
	(heading = #S) ifTrue: [^ self nowHeadingToWest].
	(heading = #E) ifTrue: [^self nowHeadingToSouth].
	(heading = #N) ifTrue: [^self nowHeadingToEast].
	"! !
