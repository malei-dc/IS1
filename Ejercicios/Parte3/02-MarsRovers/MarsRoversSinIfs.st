!classDefinition: #TestMarsRovers category: #MarsRovers!
TestCase subclass: #TestMarsRovers
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers'!

!TestMarsRovers methodsFor: 'cardinal points' stamp: 'ml 10/13/2024 21:37:43'!
east

	^ East new.
	! !

!TestMarsRovers methodsFor: 'cardinal points' stamp: 'ml 10/13/2024 21:38:00'!
north

	^ North new.
	! !

!TestMarsRovers methodsFor: 'cardinal points' stamp: 'ml 10/13/2024 21:38:13'!
south

	^ South new.
	! !

!TestMarsRovers methodsFor: 'cardinal points' stamp: 'ml 10/13/2024 21:37:27'!
west

	^ West new.
	! !


!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:39:45'!
test01anEmptyCommandLineShouldNotMoveMarsRover

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: self west.
	robotito receiveCommandLine: ''.
	
	self assert: (robotito hasPosition: 10@10 lookingAt: self west).
	! !

!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:40:12'!
test02rotateRight

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: self west.
	robotito receiveCommandLine: 'r'.
	
	self assert: (robotito hasPosition: 10@10 lookingAt: self north).
	! !

!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:40:34'!
test03rotateRight180degrees

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: self west.
	robotito receiveCommandLine: 'rr'.
	
	self assert: (robotito hasPosition: 10@10 lookingAt: self east).
	! !

!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:40:58'!
test04rotateRight270degrees

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: self west.
	robotito receiveCommandLine: 'rrr'.
	
	self assert: (robotito hasPosition: 10@10 lookingAt: self south).
	! !

!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:41:20'!
test05rotateRight360degrees

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: self west .
	robotito receiveCommandLine: 'rrrr'.
	
	self assert: (robotito hasPosition: 10@10 lookingAt: self west  ).
	! !

!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:41:43'!
test06rotateLeft

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: self west .
	robotito receiveCommandLine: 'l'.

	
	self assert: (robotito hasPosition: 10@10 lookingAt: self south ).
	! !

!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:42:11'!
test07rotateLeft180degrees

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: self west .
	robotito receiveCommandLine: 'll'.

	
	self assert: (robotito hasPosition: 10@10 lookingAt: self east ).
	! !

!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:42:30'!
test08fowardLookingWest

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: self west .
	robotito receiveCommandLine: 'f'.
	
	self assert: (robotito hasPosition: 9@10 lookingAt: self west  ).
	! !

!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:42:49'!
test09fowardLookingSouth

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: self south .
	robotito receiveCommandLine: 'f'.
	
	self assert: (robotito hasPosition: 10@9 lookingAt: self south  ).
	! !

!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:43:09'!
test10fowardLookingNorth

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: self north .
	robotito receiveCommandLine: 'f'.
	
	self assert: (robotito hasPosition: 10@11 lookingAt: self north ).
	! !

!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:43:29'!
test11fowardLookingEast

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: self east .
	robotito receiveCommandLine: 'f'.
	
	self assert: (robotito hasPosition: 11@10 lookingAt: self east ).
	! !

!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:43:48'!
test12backwardLookingEast

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: self east .
	robotito receiveCommandLine: 'b'.
	
	self assert: (robotito hasPosition: 9@10 lookingAt: self east ).
	! !

!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:44:09'!
test13backwardLookingWest

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: self west .
	robotito receiveCommandLine: 'b'.
	
	self assert: (robotito hasPosition: 11@10 lookingAt: self west  ).
	! !

!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:44:28'!
test14backwardLookingNorth

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: self north .
	robotito receiveCommandLine: 'b'.
	
	self assert: (robotito hasPosition: 10@9 lookingAt: self north ).
	! !

!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:44:51'!
test15backwardLookingSouth

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: self south .
	robotito receiveCommandLine: 'b'.
	
	self assert: (robotito hasPosition: 10@11 lookingAt: self south ).
	! !

!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:45:17'!
test16makeAnLFormFoward

	| robotito |
	robotito := MarsRover inPosition: 0@0 lookingAt: self south .
	robotito receiveCommandLine: 'fflf'.

	
	self assert: (robotito hasPosition: 1@-2 lookingAt: self east ).
	! !

!TestMarsRovers methodsFor: 'tests' stamp: 'ml 10/13/2024 21:45:45'!
test17makeAnLFormReverse

	| robotito |
	robotito := MarsRover inPosition: 1@-2 lookingAt: self east .
	robotito receiveCommandLine: 'brbb'.
	
	self assert: (robotito hasPosition: 0@0 lookingAt: self south ).
	! !


!classDefinition: #MarsRover category: #MarsRovers!
Object subclass: #MarsRover
	instanceVariableNames: 'position lookingDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers'!

!MarsRover methodsFor: 'initialize' stamp: 'ml 10/13/2024 20:34:37'!
startingAt: aPosition lookingAt: aCardinalPoint 

	position := aPosition .
	lookingDirection := aCardinalPoint.! !


!MarsRover methodsFor: 'testing' stamp: 'ml 10/13/2024 20:40:46'!
hasPosition: aPositionToCompare lookingAt: aCardinalPointToCompare 
	
	^(position = aPositionToCompare) and: (lookingDirection class = aCardinalPointToCompare class)! !


!MarsRover methodsFor: 'receive commands' stamp: 'ml 10/12/2024 01:02:31'!
receiveCommandLine: aCommandString
	aCommandString collect: [:aCommand | 
		aCommand = $r ifTrue: [self rotateRight].
		aCommand = $l ifTrue: [self rotateLeft].
		aCommand = $f ifTrue: [self goFoward].
		aCommand = $b ifTrue: [self goBackward]
		].! !


!MarsRover methodsFor: 'execute commands' stamp: 'ml 10/13/2024 21:14:32'!
goBackward

	lookingDirection movingBackwardBy: self at: position.
	
	"lookingDirection = #East ifTrue: [self moveToWest: position].
	lookingDirection = #West ifTrue: [self moveToEast: position].
	lookingDirection = #North ifTrue: [self moveToSouth: position].
	lookingDirection = #South ifTrue: [self moveToNorth: position]."! !

!MarsRover methodsFor: 'execute commands' stamp: 'ml 10/13/2024 21:11:42'!
goFoward
	
	lookingDirection movingFowardBy: self at: position.
	
	"lookingDirection = #West ifTrue: [self moveToWest: position].
	lookingDirection = #South ifTrue: [self moveToSouth: position].
	lookingDirection = #East ifTrue: [self moveToEast: position].
	lookingDirection = #North ifTrue: [self moveToNorth: position]."! !

!MarsRover methodsFor: 'execute commands' stamp: 'ml 10/13/2024 21:11:46'!
rotateLeft

	lookingDirection rotatingLeftBy: self.
	
	"lookingDirection = #North ifTrue: [lookingDirection := #West. ^self].
	lookingDirection = #East ifTrue: [lookingDirection := #North. ^self].
	lookingDirection = #South ifTrue: [lookingDirection := #East. ^self].
	lookingDirection = #West ifTrue: [lookingDirection := #South. ^self]."
	! !

!MarsRover methodsFor: 'execute commands' stamp: 'ml 10/13/2024 21:11:49'!
rotateRight
	
	lookingDirection rotatingRigthBy: self.
	
	"lookingAt = #South ifTrue: [lookingAt := #West. ^self.].
	lookingAt = #East ifTrue: [lookingAt := #South. ^self.].
	lookingAt = #North ifTrue: [lookingAt := #East. ^self.].
	lookingAt = #West ifTrue: [lookingAt := #North. ^self.]."! !


!MarsRover methodsFor: 'rotate left' stamp: 'ml 10/13/2024 21:12:06'!
eastRotateLeft
	
	lookingDirection := North new.
	
	"lookingDirection = #North ifTrue: [lookingDirection := #West. ^self].
	lookingDirection = #East ifTrue: [lookingDirection := #North. ^self].
	lookingDirection = #South ifTrue: [lookingDirection := #East. ^self].
	lookingDirection = #West ifTrue: [lookingDirection := #South. ^self]."! !

!MarsRover methodsFor: 'rotate left' stamp: 'ml 10/13/2024 21:12:03'!
northRotateLeft
	
	lookingDirection := West new.
	
	"lookingDirection = #North ifTrue: [lookingDirection := #West. ^self].
	lookingDirection = #East ifTrue: [lookingDirection := #North. ^self].
	lookingDirection = #South ifTrue: [lookingDirection := #East. ^self].
	lookingDirection = #West ifTrue: [lookingDirection := #South. ^self]."
! !

!MarsRover methodsFor: 'rotate left' stamp: 'ml 10/13/2024 20:59:02'!
southRotateLeft
	
	lookingDirection := East new.
	
	"lookingDirection = #North ifTrue: [lookingDirection := #West. ^self].
	lookingDirection = #East ifTrue: [lookingDirection := #North. ^self].
	lookingDirection = #South ifTrue: [lookingDirection := #East. ^self].
	lookingDirection = #West ifTrue: [lookingDirection := #South. ^self]."! !

!MarsRover methodsFor: 'rotate left' stamp: 'ml 10/13/2024 21:11:58'!
westRotateLeft
	
	lookingDirection := South new.
	
	"lookingDirection = #North ifTrue: [lookingDirection := #West. ^self].
	lookingDirection = #East ifTrue: [lookingDirection := #North. ^self].
	lookingDirection = #South ifTrue: [lookingDirection := #East. ^self].
	lookingDirection = #West ifTrue: [lookingDirection := #South. ^self]."! !


!MarsRover methodsFor: 'rotate right' stamp: 'ml 10/13/2024 21:12:20'!
eastRotateRight
	
	lookingDirection := South new.
	! !

!MarsRover methodsFor: 'rotate right' stamp: 'ml 10/13/2024 20:43:51'!
northRotateRight
	
	lookingDirection := East new.
! !

!MarsRover methodsFor: 'rotate right' stamp: 'ml 10/13/2024 21:12:13'!
southRotateRight
	
	lookingDirection := West new.
	! !

!MarsRover methodsFor: 'rotate right' stamp: 'ml 10/13/2024 20:24:26'!
westRotateRight
	
	lookingDirection := North new.! !


!MarsRover methodsFor: 'move' stamp: 'ml 10/12/2024 01:12:35'!
moveToEast: actualPosition 

	position := (actualPosition x + 1)@(actualPosition y).! !

!MarsRover methodsFor: 'move' stamp: 'ml 10/12/2024 01:10:24'!
moveToNorth: actualPosition 

	position := (actualPosition x)@(actualPosition y + 1)! !

!MarsRover methodsFor: 'move' stamp: 'ml 10/12/2024 01:12:38'!
moveToSouth: actualPosition 

	position := (actualPosition x)@(actualPosition y - 1)! !

!MarsRover methodsFor: 'move' stamp: 'ml 10/12/2024 01:12:41'!
moveToWest: actualPosition 

	position := ((actualPosition x) - 1)@(actualPosition y).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRovers!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'ml 10/11/2024 20:44:51'!
inPosition: aPosition lookingAt: aCardinalPoint 
	
	^ MarsRover new startingAt: aPosition lookingAt: aCardinalPoint .! !


!classDefinition: #MarsRoverDirection category: #MarsRovers!
Object subclass: #MarsRoverDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers'!

!MarsRoverDirection methodsFor: 'rotating' stamp: 'ml 10/13/2024 20:56:10'!
rotatingLeftBy: aMarsRover

	self subclassResponsibility! !

!MarsRoverDirection methodsFor: 'rotating' stamp: 'ml 10/13/2024 20:29:45'!
rotatingRigthBy: aMarsRover

	self subclassResponsibility! !


!MarsRoverDirection methodsFor: 'moving' stamp: 'ml 10/13/2024 21:16:35'!
movingBackwardBy: aMarsRover at: actualPosition

	self subclassResponsibility! !

!MarsRoverDirection methodsFor: 'moving' stamp: 'ml 10/13/2024 21:10:51'!
movingFowardBy: aMarsRover at: actualPosition

	self subclassResponsibility! !


!classDefinition: #East category: #MarsRovers!
MarsRoverDirection subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers'!

!East methodsFor: 'rotating' stamp: 'ml 10/13/2024 20:57:40'!
rotatingLeftBy: aMarsRover 

	aMarsRover eastRotateLeft .! !

!East methodsFor: 'rotating' stamp: 'ml 10/13/2024 20:42:10'!
rotatingRigthBy: aMarsRover

	aMarsRover eastRotateRight .! !


!East methodsFor: 'moving' stamp: 'ml 10/13/2024 21:17:18'!
movingBackwardBy: aMarsRover at: actualPosition

	aMarsRover moveToWest: actualPosition .! !

!East methodsFor: 'moving' stamp: 'ml 10/13/2024 21:10:40'!
movingFowardBy: aMarsRover at: actualPosition 

	aMarsRover moveToEast: actualPosition .! !


!classDefinition: #North category: #MarsRovers!
MarsRoverDirection subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers'!

!North methodsFor: 'rotating' stamp: 'ml 10/13/2024 20:57:22'!
rotatingLeftBy: aMarsRover 

	aMarsRover northRotateLeft .! !

!North methodsFor: 'rotating' stamp: 'ml 10/13/2024 20:41:59'!
rotatingRigthBy: aMarsRover

	aMarsRover northRotateRight .! !


!North methodsFor: 'moving' stamp: 'ml 10/13/2024 21:17:58'!
movingBackwardBy: aMarsRover at: actualPosition

	aMarsRover moveToSouth: actualPosition .! !

!North methodsFor: 'moving' stamp: 'ml 10/13/2024 21:09:38'!
movingFowardBy: aMarsRover at: actualPosition 
	
	aMarsRover moveToNorth: actualPosition .! !


!classDefinition: #South category: #MarsRovers!
MarsRoverDirection subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers'!

!South methodsFor: 'rotating' stamp: 'ml 10/13/2024 20:57:09'!
rotatingLeftBy: aMarsRover 

	aMarsRover southRotateLeft .! !

!South methodsFor: 'rotating' stamp: 'ml 10/13/2024 20:41:43'!
rotatingRigthBy: aMarsRover

	aMarsRover southRotateRight .! !


!South methodsFor: 'moving' stamp: 'ml 10/13/2024 21:18:14'!
movingBackwardBy: aMarsRover at: actualPosition

	aMarsRover moveToNorth: actualPosition .! !

!South methodsFor: 'moving' stamp: 'ml 10/13/2024 21:09:09'!
movingFowardBy: aMarsRover at: actualPosition 
	
	aMarsRover moveToSouth: actualPosition .! !


!classDefinition: #West category: #MarsRovers!
MarsRoverDirection subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers'!

!West methodsFor: 'rotating' stamp: 'ml 10/13/2024 20:56:56'!
rotatingLeftBy: aMarsRover 

	aMarsRover westRotateLeft. ! !

!West methodsFor: 'rotating' stamp: 'ml 10/13/2024 20:30:05'!
rotatingRigthBy: aMarsRover

	aMarsRover westRotateRight .! !


!West methodsFor: 'moving' stamp: 'ml 10/13/2024 21:18:32'!
movingBackwardBy: aMarsRover at: actualPosition

	aMarsRover moveToEast: actualPosition .! !

!West methodsFor: 'moving' stamp: 'ml 10/13/2024 21:08:34'!
movingFowardBy: aMarsRover at: actualPosition 

	aMarsRover moveToWest: actualPosition.! !
