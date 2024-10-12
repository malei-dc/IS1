!classDefinition: #TestMarsRovers category: #MarsRovers!
TestCase subclass: #TestMarsRovers
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers'!

!TestMarsRovers methodsFor: 'as yet unclassified' stamp: 'ml 10/11/2024 21:44:34'!
test01anEmptyCommandLineShouldNotMoveMarsRover

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: #West.
	robotito receiveCommandLine: ''.
	
	self assert: (robotito hasPosition: 10@10 lookingAt: #West).
	! !

!TestMarsRovers methodsFor: 'as yet unclassified' stamp: 'ml 10/11/2024 21:56:54'!
test02rotateRight

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: #West.
	robotito receiveCommandLine: 'r'.
	
	self assert: (robotito hasPosition: 10@10 lookingAt: #North).
	! !

!TestMarsRovers methodsFor: 'as yet unclassified' stamp: 'ml 10/11/2024 21:56:36'!
test03rotateRight180degrees

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: #West.
	robotito receiveCommandLine: 'rr'.
	
	self assert: (robotito hasPosition: 10@10 lookingAt: #East).
	! !

!TestMarsRovers methodsFor: 'as yet unclassified' stamp: 'ml 10/11/2024 21:58:05'!
test04rotateRight270degrees

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: #West.
	robotito receiveCommandLine: 'rrr'.
	
	self assert: (robotito hasPosition: 10@10 lookingAt: #South).
	! !

!TestMarsRovers methodsFor: 'as yet unclassified' stamp: 'ml 10/11/2024 21:58:19'!
test05rotateRight360degrees

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: #West.
	robotito receiveCommandLine: 'rrrr'.
	
	self assert: (robotito hasPosition: 10@10 lookingAt: #West).
	! !

!TestMarsRovers methodsFor: 'as yet unclassified' stamp: 'ml 10/11/2024 22:02:16'!
test06rotateLeft

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: #West.
	robotito receiveCommandLine: 'l'.
	
	self assert: (robotito hasPosition: 10@10 lookingAt: #South).
	! !

!TestMarsRovers methodsFor: 'as yet unclassified' stamp: 'ml 10/11/2024 22:03:47'!
test07rotateLeft180degrees

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: #West.
	robotito receiveCommandLine: 'll'.
	
	self assert: (robotito hasPosition: 10@10 lookingAt: #East).
	! !

!TestMarsRovers methodsFor: 'as yet unclassified' stamp: 'ml 10/12/2024 00:43:13'!
test08fowardLookingWest

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: #West.
	robotito receiveCommandLine: 'f'.
	
	self assert: (robotito hasPosition: 9@10 lookingAt: #West).
	! !

!TestMarsRovers methodsFor: 'as yet unclassified' stamp: 'ml 10/12/2024 00:58:01'!
test09fowardLookingSouth

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: #South.
	robotito receiveCommandLine: 'f'.
	
	self assert: (robotito hasPosition: 10@9 lookingAt: #South).
	! !

!TestMarsRovers methodsFor: 'as yet unclassified' stamp: 'ml 10/12/2024 00:54:18'!
test10fowardLookingNorth

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: #North.
	robotito receiveCommandLine: 'f'.
	
	self assert: (robotito hasPosition: 10@11 lookingAt: #North).
	! !

!TestMarsRovers methodsFor: 'as yet unclassified' stamp: 'ml 10/12/2024 00:58:50'!
test11fowardLookingEast

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: #East.
	robotito receiveCommandLine: 'f'.
	
	self assert: (robotito hasPosition: 11@10 lookingAt: #East).
	! !

!TestMarsRovers methodsFor: 'as yet unclassified' stamp: 'ml 10/12/2024 01:01:50'!
test12backwardLookingEast

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: #East.
	robotito receiveCommandLine: 'b'.
	
	self assert: (robotito hasPosition: 9@10 lookingAt: #East).
	! !

!TestMarsRovers methodsFor: 'as yet unclassified' stamp: 'ml 10/12/2024 01:05:35'!
test13backwardLookingWest

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: #West.
	robotito receiveCommandLine: 'b'.
	
	self assert: (robotito hasPosition: 11@10 lookingAt: #West).
	! !

!TestMarsRovers methodsFor: 'as yet unclassified' stamp: 'ml 10/12/2024 01:06:02'!
test14backwardLookingNorth

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: #North.
	robotito receiveCommandLine: 'b'.
	
	self assert: (robotito hasPosition: 10@9 lookingAt: #North).
	! !

!TestMarsRovers methodsFor: 'as yet unclassified' stamp: 'ml 10/12/2024 01:07:28'!
test15backwardLookingSouth

	| robotito |
	robotito := MarsRover inPosition: 10@10 lookingAt: #South.
	robotito receiveCommandLine: 'b'.
	
	self assert: (robotito hasPosition: 10@11 lookingAt: #South).
	! !


!classDefinition: #MarsRover category: #MarsRovers!
Object subclass: #MarsRover
	instanceVariableNames: 'position lookingAt'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers'!

!MarsRover methodsFor: 'initialize' stamp: 'ml 10/11/2024 20:45:51'!
startingAt: aPosition lookingAt: aCardinalPoint 

	position := aPosition .
	lookingAt := aCardinalPoint .! !


!MarsRover methodsFor: 'testing' stamp: 'ml 10/11/2024 20:48:45'!
hasPosition: aPositionToCompare lookingAt: aCardinalPointToCompare 
	
	^(position = aPositionToCompare) and: (lookingAt = aCardinalPointToCompare )! !


!MarsRover methodsFor: 'receive commands' stamp: 'ml 10/12/2024 01:02:31'!
receiveCommandLine: aCommandString
	aCommandString collect: [:aCommand | 
		aCommand = $r ifTrue: [self rotateRight].
		aCommand = $l ifTrue: [self rotateLeft].
		aCommand = $f ifTrue: [self goFoward].
		aCommand = $b ifTrue: [self goBackward]
		].! !


!MarsRover methodsFor: 'execute commands' stamp: 'ml 10/12/2024 01:11:06'!
goBackward
	lookingAt = #East ifTrue: [self moveToWest: position].
	lookingAt = #West ifTrue: [self moveToEast: position].
	lookingAt = #North ifTrue: [self moveToSouth: position].
	lookingAt = #South ifTrue: [self moveToNorth: position].! !

!MarsRover methodsFor: 'execute commands' stamp: 'ml 10/12/2024 01:11:06'!
goFoward
	
	lookingAt = #West ifTrue: [self moveToWest: position].
	lookingAt = #South ifTrue: [self moveToSouth: position].
	lookingAt = #East ifTrue: [self moveToEast: position].
	lookingAt = #North ifTrue: [self moveToNorth: position].! !

!MarsRover methodsFor: 'execute commands' stamp: 'ml 10/11/2024 22:03:30'!
rotateLeft
	lookingAt = #North ifTrue: [lookingAt := #West. ^self].
	lookingAt = #East ifTrue: [lookingAt := #North. ^self].
	lookingAt = #South ifTrue: [lookingAt := #East. ^self].
	lookingAt = #West ifTrue: [lookingAt := #South. ^self].
	! !

!MarsRover methodsFor: 'execute commands' stamp: 'ml 10/11/2024 22:00:29'!
rotateRight
	lookingAt = #South ifTrue: [lookingAt := #West. ^self.].
	lookingAt = #East ifTrue: [lookingAt := #South. ^self.].
	lookingAt = #North ifTrue: [lookingAt := #East. ^self.].
	lookingAt = #West ifTrue: [lookingAt := #North. ^self.].! !


!MarsRover methodsFor: 'moving' stamp: 'ml 10/12/2024 01:12:35'!
moveToEast: actualPosition 

	position := (actualPosition x + 1)@(actualPosition y).! !

!MarsRover methodsFor: 'moving' stamp: 'ml 10/12/2024 01:10:24'!
moveToNorth: actualPosition 

	position := (actualPosition x)@(actualPosition y + 1)! !

!MarsRover methodsFor: 'moving' stamp: 'ml 10/12/2024 01:12:38'!
moveToSouth: actualPosition 

	position := (actualPosition x)@(actualPosition y - 1)! !

!MarsRover methodsFor: 'moving' stamp: 'ml 10/12/2024 01:12:41'!
moveToWest: actualPosition 

	position := ((actualPosition x) - 1)@(actualPosition y).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRovers!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'ml 10/11/2024 20:44:51'!
inPosition: aPosition lookingAt: aCardinalPoint 
	
	^ MarsRover new startingAt: aPosition lookingAt: aCardinalPoint .! !
