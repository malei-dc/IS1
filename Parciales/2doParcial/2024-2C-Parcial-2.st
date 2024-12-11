!classDefinition: #PacmanGameTest category: #'2024-2C-Parcial-2'!
TestCase subclass: #PacmanGameTest
	instanceVariableNames: 'visitedElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'ml 12/9/2024 21:58:00'!
test01PacmanStartsMovingLeft

	| board game |
	
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#-p--#'
		'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	game tick.
	self
	assert: game stringRepresentationOfBoard
	equals: #(
		'######'
		'#-BC-#'
		'#p=--#'
		'######').! !

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'ml 12/9/2024 22:23:50'!
test02PacmanCanMoveRight

	| board game |
	
	board := StringPacmanBoard representedAs:#(
		'######'
		'#B-C-#'
		'#-p--#'
		'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	game startMovingPacmanRight.
	game tick.
	self
	assert: game stringRepresentationOfBoard
	equals: #(
		'######'
		'#B-C-#'
		'#-=p-#'
		'######').! !

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'ml 12/9/2024 22:26:50'!
test03PacmanCanMoveUp

	| board game |
	
	board := StringPacmanBoard representedAs:#(
		'######'
		'#B-C-#'
		'#-p--#'
		'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	game startMovingPacmanUp.
	game tick.
	self
	assert: game stringRepresentationOfBoard
	equals: #(
		'######'
		'#BpC-#'
		'#-=--#'
		'######').! !

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'ml 12/9/2024 22:27:41'!
test04PacmanCanMoveDown

	| board game |
	
	board := StringPacmanBoard representedAs:#(
		'######'
		'#BpC-#'
		'#----#'
		'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame on: board.
	game startMovingPacmanDown.
	game tick.
	self
	assert: game stringRepresentationOfBoard
	equals: #(
		'######'
		'#B=C-#'
		'#-p--#'
		'######').! !

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 01:40:50'!
test05PacmanMovesCorrectlyMoreThanOneTick

	| board game |
	
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#--p-#'
		'######').
		
	game := PacmanGame on: board.
	game tick. game tick.
	self
	assert: game stringRepresentationOfBoard
	equals: #(
		'######'
		'#-BC-#'
		'#p==-#'
		'######').! !

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 19:16:59'!
test06GameStartWithZeroPoints

	| board game |
	
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#--p-#'
		'######').
		
	game := PacmanGame on: board.
	self assert: 0 equals: game points.! !

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 17:29:23'!
test07GameStartWithPacmanWithThreeLives

	| board game |
	
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#--p-#'
		'######').
		
	game := PacmanGame on: board.
	game tick. game tick.
	self assert: 3 equals: game pacmanLives.! !

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 17:34:47'!
test08AddsOnePointWhenEatingSmallPill

	| board game |
	
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#-p--#'
		'######').
		
	game := PacmanGame on: board.
	game tick.
	
	self assert: 1 equals: game points.
	self
		assert: game stringRepresentationOfBoard
		equals: #(
		'######'
		'#-BC-#'
		'#p=--#'
		'######').! !

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 19:21:49'!
test09AddsTwoPointsWhenEatingBigPill

	| board game |
	
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#*p--#'
		'######').
		
	game := PacmanGame on: board.
	game tick.
	
	self assert: 2 equals: game points.
	self
		assert: game stringRepresentationOfBoard
		equals: #(
		'######'
		'#-BC-#'
		'#p=--#'
		'######').! !

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 22:29:46'!
test10PacmanCanNotMoveIntoWall

	| board game |
	
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#p---#'
		'######').
		
	game := PacmanGame on: board.
	game tick.
	self
		assert: game stringRepresentationOfBoard
		equals: #(
		'######'
		'#-BC-#'
		'#p---#'
		'######').! !

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 22:30:32'!
test11PacmanCanMoveIntoSpace

	| board game |
	
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#=p--#'
		'######').
		
	game := PacmanGame on: board.
	game tick.
	self
		assert: game stringRepresentationOfBoard
		equals: #(
		'######'
		'#-BC-#'
		'#p=--#'
		'######').! !

!PacmanGameTest methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 22:51:04'!
test12BlinkyStartsMovingLeftOnFourthTick

	| board game |
	
	board := StringPacmanBoard representedAs:#(
		'######'
		'#-BC-#'
		'#=p--#'
		'######').
		
	game := PacmanGame on: board.
	3 timesRepeat: [game tick].
	game tick.
	
	self
		assert: game stringRepresentationOfBoard
		equals: #(
		'######'
		'#B=C-#'
		'#p=--#'
		'######').! !


!classDefinition: #StringPacmanBoardTest category: #'2024-2C-Parcial-2'!
TestCase subclass: #StringPacmanBoardTest
	instanceVariableNames: 'visitedElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:48:10'!
test01CannotCreateABoardWithoutThePacman

	self 
		should: [ StringPacmanBoard representedAs: #('BC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard pacmanName)
		! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:48:10'!
test02CannotCreateABoardWithMoreThanOnePacman

	self 
		should: [ StringPacmanBoard representedAs: #('BCpp') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard pacmanName)
		! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:48:10'!
test03CannotCreateABoardWithoutBlinky

	self 
		should: [ StringPacmanBoard representedAs: #('pC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard blinkyName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 14:32:55'!
test04CannotCreateABoardWithMoreThanOneBlinky

	self 
		should: [ StringPacmanBoard representedAs: #('pBBC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard blinkyName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:50:33'!
test05CannotCreateABoardWithoutClyde

	self 
		should: [ StringPacmanBoard representedAs: #('pB') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard clydeName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:50:40'!
test06CannotCreateABoardWithMoreThanOneClyde

	self 
		should: [ StringPacmanBoard representedAs: #('pBCC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard clydeName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:50:49'!
test07AllRowsHaveSameSize

	self 
		should: [ StringPacmanBoard representedAs: #('pBC' '') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: StringPacmanBoard rowsMustHaveSameSizeErrorDescription! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:51:00'!
test08VisitElementsWithRightPosition

	| board |
	
	visitedElements := Dictionary new.
	
	board := StringPacmanBoard representedAs: #('pBC#-*=').
	board visitElementsWith: self.
	
	self assert: (visitedElements at: #pacman) equals: 1@1.
	self assert: (visitedElements at: #blinky) equals: 2@1.
	self assert: (visitedElements at: #clyde) equals: 3@1.
	self assert: (visitedElements at: #wall) equals: 4@1.
	self assert: (visitedElements at: #smallPill) equals: 5@1.
	self assert: (visitedElements at: #bigPill) equals: 6@1.
	self assert: (visitedElements at: #space) equals: 7@1.
	self assert: visitedElements size equals: 7
	
	
	! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:51:11'!
test09InvalidCharactersAreNotAllowed

	self 
		should: [ StringPacmanBoard representedAs: #('pBCx') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard notAllowCharaterErrorDescriptionFor: $x)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 16:42:59'!
test10BoardTranslationExample
"
	HACER PASAR ESTE TEST ANTES DE COMENZAR: falla porque en la posicion del pacman (p) pone un string en vez de #pacman
"
	| board translator |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BC-#'
'#-p=-#'
'######').

	translator := BoardTranslatorExample on: board.
	
	self assert: translator stringRepresentationOfBoard equals: #(
'######'
'#-BC-#'
'#-p=-#'
'######').
! !


!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:25'!
visitBigPillAt: position 
	
	visitedElements at: #bigPill put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:27'!
visitBlinkyAt: position 
	
	visitedElements at: #blinky put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:56'!
visitClydeAt: position 
	
	visitedElements at: #clyde put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:10'!
visitPacmanAt: position 
	
	visitedElements at: #pacman put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:14'!
visitSmallPillAt: position 
	
	visitedElements at: #smallPill put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:17:12'!
visitSpaceAt: position 
	
	visitedElements at: #space put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:05'!
visitWallAt: position 
	
	visitedElements at: #wall put: position ! !


!classDefinition: #BoardTranslatorExample category: #'2024-2C-Parcial-2'!
Object subclass: #BoardTranslatorExample
	instanceVariableNames: 'board boardExtent'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!BoardTranslatorExample methodsFor: 'string representation' stamp: 'HAW 11/22/2024 14:38:51'!
characterRepresentationOf: anElement
	
	(anElement = #smallPill) ifTrue: [ ^StringPacmanBoard smallPillCharacter ].
	(anElement = #bigPill) ifTrue: [ ^StringPacmanBoard bigPillCharacter ].
	(anElement = #blinky) ifTrue: [ ^StringPacmanBoard blinkyCharacter ].
	(anElement = #clyde) ifTrue: [ ^StringPacmanBoard clydeCharacter ].
	(anElement = #space) ifTrue: [ ^StringPacmanBoard spaceCharacter ].
	(anElement = #wall) ifTrue: [ ^StringPacmanBoard wallCharacter ].
	(anElement = #pacman) ifTrue: [ ^StringPacmanBoard pacmanCharacter ].
	
	self error: 'Unknown pacman element type'! !

!BoardTranslatorExample methodsFor: 'string representation' stamp: 'HAW 11/22/2024 14:45:23'!
representationOfRowNumber: y
	
	^String streamContents: [ :rowStream |
		1 to: boardExtent x do: [ :x |
			rowStream nextPut: (self characterRepresentationOf: (board at: x@y))]]! !

!BoardTranslatorExample methodsFor: 'string representation' stamp: 'LL 11/22/2024 10:44:29'!
stringRepresentationOfBoard
	
	| rows |
	
	rows := OrderedCollection new.

	1 to: boardExtent y do: [ :y | 
		rows add: (self representationOfRowNumber: y) ].
	
	^rows asArray! !


!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:42:38'!
visitBigPillAt: aPosition 
	
	board at: aPosition put: #bigPill! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:40:34'!
visitBlinkyAt: aPosition 
	
	board at: aPosition put: #blinky! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:43:04'!
visitClydeAt: aPosition 
	
	board at: aPosition put: #clyde! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'ml 12/9/2024 10:25:58'!
visitPacmanAt: aPosition 
	
	board at: aPosition put: #pacman! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:43:22'!
visitSmallPillAt: aPosition 
	
	board at: aPosition put: #smallPill! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:43:30'!
visitSpaceAt: aPosition

	board at: aPosition put: #space
	
	! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:43:35'!
visitWallAt: aPosition 
	
	board at: aPosition put: #wall! !


!BoardTranslatorExample methodsFor: 'initialization' stamp: 'HAW 11/22/2024 14:43:18'!
initializeOn: aBoard

	board := Dictionary new.
	boardExtent := aBoard extent.
	aBoard visitElementsWith: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BoardTranslatorExample class' category: #'2024-2C-Parcial-2'!
BoardTranslatorExample class
	instanceVariableNames: ''!

!BoardTranslatorExample class methodsFor: 'as yet unclassified' stamp: 'LL 11/22/2024 10:37:38'!
on: aBoard

	^self new initializeOn: aBoard! !


!classDefinition: #PacmanGame category: #'2024-2C-Parcial-2'!
Object subclass: #PacmanGame
	instanceVariableNames: 'board boardExtent pacman points ticks blinky'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanGame methodsFor: 'board visiting' stamp: 'ml 12/10/2024 18:33:04'!
visitBigPillAt: aPosition 
	
	board at: aPosition put: Pill bigPill! !

!PacmanGame methodsFor: 'board visiting' stamp: 'ml 12/11/2024 01:26:30'!
visitBlinkyAt: aPosition 
	
	blinky := Blinky blinkyLocatedAt: aPosition. 
	board at: aPosition put: blinky.! !

!PacmanGame methodsFor: 'board visiting' stamp: 'ml 12/10/2024 18:58:01'!
visitClydeAt: aPosition 
	
	board at: aPosition put: Clyde new! !

!PacmanGame methodsFor: 'board visiting' stamp: 'ml 12/9/2024 22:08:24'!
visitPacmanAt: aPosition 

	pacman := Pacman locatedAt: aPosition. 
	board at: aPosition put: pacman ! !

!PacmanGame methodsFor: 'board visiting' stamp: 'ml 12/10/2024 18:33:16'!
visitSmallPillAt: aPosition 
	
	board at: aPosition put: Pill smallPill! !

!PacmanGame methodsFor: 'board visiting' stamp: 'ml 12/10/2024 18:58:19'!
visitSpaceAt: aPosition

	board at: aPosition put: Space new
	
	! !

!PacmanGame methodsFor: 'board visiting' stamp: 'ml 12/10/2024 18:58:29'!
visitWallAt: aPosition 
	
	board at: aPosition put: Wall new! !


!PacmanGame methodsFor: 'initialization' stamp: 'ml 12/11/2024 01:13:52'!
initializeOn: aBoard 

	board := Dictionary new.
	boardExtent := aBoard extent.
	aBoard visitElementsWith: self.
	
	points := 0.
	ticks := 0.
	
	
	
	! !


!PacmanGame methodsFor: 'string representation' stamp: 'ml 12/10/2024 18:56:37'!
characterRepresentationOf: anElement
	
	"(anElement = #smallPill) ifTrue: [ ^StringPacmanBoard smallPillCharacter ].
	(anElement = #bigPill) ifTrue: [ ^StringPacmanBoard bigPillCharacter ].
	(anElement = #blinky) ifTrue: [ ^StringPacmanBoard blinkyCharacter ].
	(anElement = #clyde) ifTrue: [ ^StringPacmanBoard clydeCharacter ].
	(anElement = #space) ifTrue: [ ^StringPacmanBoard spaceCharacter ].
	(anElement = #wall) ifTrue: [ ^StringPacmanBoard wallCharacter ].
	(anElement = #pacman ) ifTrue: [ ^StringPacmanBoard pacmanCharacter ].
	
	self error: 'Unknown pacman element type'"! !

!PacmanGame methodsFor: 'string representation' stamp: 'ml 12/10/2024 19:01:16'!
representationOfRowNumber: y
	
	^String streamContents: [ :rowStream |
		1 to: boardExtent x do: [ :x |
			rowStream nextPut: (board at: x@y) characterRepresentation]]! !

!PacmanGame methodsFor: 'string representation' stamp: 'ml 12/9/2024 19:04:35'!
stringRepresentationOfBoard
	
	| rows |
	
	rows := OrderedCollection new.

	1 to: boardExtent y do: [ :y | 
		rows add: (self representationOfRowNumber: y) ].
	
	^rows asArray! !


!PacmanGame methodsFor: 'events' stamp: 'ml 12/9/2024 22:28:07'!
startMovingPacmanDown
	
	pacman startMovingDown.! !

!PacmanGame methodsFor: 'events' stamp: 'ml 12/10/2024 18:13:02'!
startMovingPacmanLeft

	pacman startMovingLeft . ! !

!PacmanGame methodsFor: 'events' stamp: 'ml 12/9/2024 22:24:10'!
startMovingPacmanRight

	pacman startMovingRight .! !

!PacmanGame methodsFor: 'events' stamp: 'ml 12/9/2024 22:25:55'!
startMovingPacmanUp

	pacman startMovingUp. ! !

!PacmanGame methodsFor: 'events' stamp: 'ml 12/11/2024 01:42:25'!
tick

	| nextPositionElement |
	ticks := ticks + 1.
	
	nextPositionElement := board  at: pacman nextPosition.
	nextPositionElement pacmanWantToMoveInto: self. 
	
	ticks > 3 ifTrue: [ 
			| elementAtNextPosition |
			elementAtNextPosition := board at: blinky nextPosition.
			elementAtNextPosition ghost: blinky wantsToMoveIntoIn: self.].
! !


!PacmanGame methodsFor: 'lives and points' stamp: 'ml 12/10/2024 17:29:49'!
pacmanLives

	^pacman lives! !

!PacmanGame methodsFor: 'lives and points' stamp: 'ml 12/10/2024 17:27:35'!
points

	^points! !


!PacmanGame methodsFor: 'pacman move' stamp: 'ml 12/10/2024 19:12:23'!
movePacman

	board  at: pacman position put: Space new.
	board  at: pacman move put: pacman! !

!PacmanGame methodsFor: 'pacman move' stamp: 'ml 12/10/2024 18:32:43'!
pacmanWantsToMoveIntoPill: aPill

	points := points + aPill pointsToAdd.
	
	self movePacman .! !

!PacmanGame methodsFor: 'pacman move' stamp: 'ml 12/10/2024 22:31:41'!
pacmanWantsToMoveIntoSpace

	self movePacman .! !

!PacmanGame methodsFor: 'pacman move' stamp: 'ml 12/10/2024 22:29:14'!
pacmanWantsToMoveIntoWall! !


!PacmanGame methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 01:47:44'!
ghost: aGhost wantsToMoveIntoSpace: aPill 
	
	self move: aGhost withPreviousElement: aPill ! !

!PacmanGame methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 01:49:00'!
move: aGhost withPreviousElement: aGameElement 
	
	board at: aGhost position put: aGhost previousElement.
	board at: (aGhost moveWithPreviousElement: aGameElement ) put: aGhost! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PacmanGame class' category: #'2024-2C-Parcial-2'!
PacmanGame class
	instanceVariableNames: ''!

!PacmanGame class methodsFor: 'as yet unclassified' stamp: 'ml 12/9/2024 21:57:44'!
on: aBoard 

	^self new initializeOn: aBoard .! !


!classDefinition: #PacmanGameElements category: #'2024-2C-Parcial-2'!
Object subclass: #PacmanGameElements
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanGameElements methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 18:23:17'!
pacmanWantToMoveInto: aPacmanGame

	self subclassResponsibility .! !


!classDefinition: #Clyde category: #'2024-2C-Parcial-2'!
PacmanGameElements subclass: #Clyde
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Clyde methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 18:56:00'!
characterRepresentation

	^StringPacmanBoard clydeCharacter ! !


!classDefinition: #PacmanActors category: #'2024-2C-Parcial-2'!
PacmanGameElements subclass: #PacmanActors
	instanceVariableNames: 'displacement position'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanActors methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 01:39:33'!
nextPosition

	^ position + displacement .! !

!PacmanActors methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 01:39:18'!
position

	^position! !

!PacmanActors methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 01:39:09'!
startMovingDown
	
	displacement := 0@1.! !

!PacmanActors methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 01:39:05'!
startMovingLeft

	^displacement := (-1@0)! !

!PacmanActors methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 01:38:45'!
startMovingRight

	^displacement := (1@0)! !

!PacmanActors methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 01:38:33'!
startMovingUp
	
	displacement := (0@-1)! !


!PacmanActors methodsFor: 'initialization' stamp: 'ml 12/11/2024 01:40:03'!
characterRepresentation

	self subclassResponsibility! !


!classDefinition: #Blinky category: #'2024-2C-Parcial-2'!
PacmanActors subclass: #Blinky
	instanceVariableNames: 'charRepresentation previousElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Blinky methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 01:36:18'!
characterRepresentation

	^ charRepresentation ! !

!Blinky methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 01:50:08'!
moveWithPreviousElement: aGameElement 

	previousElement := aGameElement .
	^position := self nextPosition ! !

!Blinky methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 01:49:14'!
previousElement
	
	^previousElement! !


!Blinky methodsFor: 'initialization' stamp: 'ml 12/11/2024 01:45:23'!
initializeWith: aPosition representedWith: aCharRepresentation 

	position := aPosition.
	charRepresentation := aCharRepresentation.
	previousElement := Space new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Blinky class' category: #'2024-2C-Parcial-2'!
Blinky class
	instanceVariableNames: ''!

!Blinky class methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 01:31:01'!
blinkyLocatedAt: aPosition 

	^(self locatedAt: aPosition representedWith: StringPacmanBoard blinkyCharacter)
		startMovingLeft;
		yourself ! !

!Blinky class methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 01:34:45'!
locatedAt: aPosition representedWith: aCharRepresentation 
	
	^self new initializeWith: aPosition representedWith: aCharRepresentation ! !


!classDefinition: #Pacman category: #'2024-2C-Parcial-2'!
PacmanActors subclass: #Pacman
	instanceVariableNames: 'lives'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Pacman methodsFor: 'initialization' stamp: 'ml 12/10/2024 18:46:04'!
characterRepresentation

	^StringPacmanBoard pacmanCharacter ! !

!Pacman methodsFor: 'initialization' stamp: 'ml 12/10/2024 17:30:46'!
initializeWith: aPosition 

	position := aPosition.
	lives := 3.
	
	self startMovingLeft.! !


!Pacman methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 17:30:11'!
lives

	^ lives! !

!Pacman methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 01:40:58'!
move

	^ position := self nextPosition .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pacman class' category: #'2024-2C-Parcial-2'!
Pacman class
	instanceVariableNames: ''!

!Pacman class methodsFor: 'as yet unclassified' stamp: 'ml 12/9/2024 22:16:12'!
locatedAt: aPosition 

	^ self new initializeWith: aPosition .! !


!classDefinition: #Pill category: #'2024-2C-Parcial-2'!
PacmanGameElements subclass: #Pill
	instanceVariableNames: 'pointsToAdd charRepresentation'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Pill methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 18:50:22'!
characterRepresentation

	^charRepresentation .! !

!Pill methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 01:47:08'!
ghost: aGhost wantsToMoveIntoIn: aPacmanGame 

	aPacmanGame ghost: aGhost wantsToMoveIntoSpace: self! !

!Pill methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 18:24:16'!
pacmanWantToMoveInto: aPacmanGame

	aPacmanGame pacmanWantsToMoveIntoPill: self.! !

!Pill methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 18:30:34'!
pointsToAdd

	^pointsToAdd.! !


!Pill methodsFor: 'initialization' stamp: 'ml 12/10/2024 18:50:03'!
initializePointsToAddWhenEated: apointToAdd characterRepresentation: aCharacter

	pointsToAdd := apointToAdd.
	charRepresentation := aCharacter .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pill class' category: #'2024-2C-Parcial-2'!
Pill class
	instanceVariableNames: ''!

!Pill class methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 18:51:11'!
bigPill

	^ self pointsToAddWhenEated: 2 characterRepresentation: StringPacmanBoard bigPillCharacter .! !

!Pill class methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 18:49:35'!
pointsToAddWhenEated: pointToAdd characterRepresentation: aCharacter

	^self new initializePointsToAddWhenEated: pointToAdd characterRepresentation: aCharacter.! !

!Pill class methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 18:48:55'!
smallPill

	^ self pointsToAddWhenEated: 1 characterRepresentation: StringPacmanBoard smallPillCharacter .! !


!classDefinition: #Space category: #'2024-2C-Parcial-2'!
PacmanGameElements subclass: #Space
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Space methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 18:55:50'!
characterRepresentation

	^StringPacmanBoard spaceCharacter ! !

!Space methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 22:30:52'!
pacmanWantToMoveInto: aPacmanGame

	aPacmanGame pacmanWantsToMoveIntoSpace! !


!classDefinition: #Wall category: #'2024-2C-Parcial-2'!
PacmanGameElements subclass: #Wall
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Wall methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 18:55:38'!
characterRepresentation

	^StringPacmanBoard wallCharacter .! !

!Wall methodsFor: 'as yet unclassified' stamp: 'ml 12/10/2024 22:29:22'!
pacmanWantToMoveInto: aPacmanGame

	aPacmanGame pacmanWantsToMoveIntoWall! !


!classDefinition: #StringPacmanBoard category: #'2024-2C-Parcial-2'!
Object subclass: #StringPacmanBoard
	instanceVariableNames: 'stringRepresentation'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!StringPacmanBoard methodsFor: 'initialization' stamp: 'HAW 11/18/2024 19:29:26'!
initializeRepresentedAs: aStringRepresentation 
	
	stringRepresentation := aStringRepresentation.! !


!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:23:48'!
bigPillCharacter

	^self class bigPillCharacter! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:20'!
blinkyCharacter

	^ self class blinkyCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:30'!
clydeCharacter

	^ self class clydeCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:52'!
pacmanCharacter

	^ self class pacmanCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:25:15'!
smallPillCharacter

	^self class smallPillCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:25:37'!
spaceCharacter

	^self class spaceCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:26:00'!
wallCharacter

	^self class wallCharacter! !


!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:21'!
isBigPill: anElement

	^ anElement = self bigPillCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:36'!
isBlinky: anElement

	^ anElement = self blinkyCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:09'!
isClyde: anElement

	^ anElement = self clydeCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:17'!
isPacman: anElement

	^ anElement = self pacmanCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:12'!
isSmalltPill: anElement

	^ anElement = self smallPillCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:29'!
isSpace: anElement

	^ anElement = self spaceCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:03'!
isWall: anElement

	^ anElement = self wallCharacter! !


!StringPacmanBoard methodsFor: 'visiting' stamp: 'HAW 11/22/2024 14:38:19'!
visit: anElement at: position with: aPacmanBoardVisitor

	(self isWall: anElement) ifTrue: [ ^aPacmanBoardVisitor visitWallAt: position ].
	(self isSmalltPill: anElement) ifTrue: [ ^aPacmanBoardVisitor visitSmallPillAt: position ].
	(self isBigPill: anElement) ifTrue: [ ^aPacmanBoardVisitor visitBigPillAt: position ].
	(self isBlinky: anElement) ifTrue: [ ^aPacmanBoardVisitor visitBlinkyAt: position ].
	(self isClyde: anElement) ifTrue: [ ^aPacmanBoardVisitor visitClydeAt: position ].
	(self isPacman: anElement) ifTrue: [ ^aPacmanBoardVisitor visitPacmanAt: position ].
	(self isSpace: anElement) ifTrue: [ ^aPacmanBoardVisitor visitSpaceAt: position ].
	
	"No hay necesidad de generar un error porque no se permite crear un board con caracteres distintos a todos estos - Hernan"! !

!StringPacmanBoard methodsFor: 'visiting' stamp: 'HAW 11/20/2024 17:22:41'!
visitElementsWith: aPacmanBoardVisitor

	stringRepresentation withIndexDo: [ :aRow :y |
		aRow withIndexDo: [ :anElement :x | 
			self visit: anElement at: x@y with: aPacmanBoardVisitor.]]! !


!StringPacmanBoard methodsFor: 'extent' stamp: 'HAW 11/22/2024 10:50:10'!
extent
	
	"There is always a row and their size is the same to all - Hernan"
	^stringRepresentation first size @ stringRepresentation size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StringPacmanBoard class' category: #'2024-2C-Parcial-2'!
StringPacmanBoard class
	instanceVariableNames: ''!

!StringPacmanBoard class methodsFor: 'instance creation' stamp: 'HAW 11/22/2024 10:48:32'!
representedAs: aStringRepresentation 
	
	| elementCharactersCount |
	
	elementCharactersCount := self elementCharacterCountOf: aStringRepresentation.	
	self asserltAllActorsAreIn: elementCharactersCount.
	"If I get here the there is always a row - Hernan"
	self assertAllRowsHaveSameSizeIn: aStringRepresentation.
	
	^self new initializeRepresentedAs: aStringRepresentation 
	! !


!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 16:58:30'!
characterIsMissingErrorDescriptionFor: aCharacterName
	
	^aCharacterName, ' is missing'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 17:39:12'!
notAllowCharaterErrorDescriptionFor: aCharacter

	^'Character ', aCharacter asString, ' is not allowed'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 17:07:31'!
rowsMustHaveSameSizeErrorDescription
	
	^'Rows must have same number of columns'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 16:58:01'!
shouldBeUniqueErrorDescriptionFor: aCharacterName
	
	^'There should be only one ', aCharacterName ! !


!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/21/2024 20:17:42'!
allowedCharacters
	
	^ {
	self pacmanCharacter.
	self blinkyCharacter.
	self clydeCharacter.
	self wallCharacter.
	self bigPillCharacter.
	self smallPillCharacter.
	self spaceCharacter.
	}! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:24:06'!
bigPillCharacter
	
	^ $*! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:56:25'!
blinkyCharacter
	
	^$B! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:56:42'!
clydeCharacter
	
	^$C! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:41:25'!
pacmanCharacter
	
	^$p! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:25:24'!
smallPillCharacter
	
	^ $-! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:25:46'!
spaceCharacter
	
	^ $=! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:26:06'!
wallCharacter
	
	^ $#! !


!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:12'!
blinkyName

	^ #blinky! !

!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:29'!
clydeName

	^ #clyde! !

!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:05'!
pacmanName

	^ #pacman! !


!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/21/2024 19:59:27'!
asserltAllActorsAreIn: elementCharactersCount

	{ self pacmanName. self blinkyName. self clydeName } do: [ :aCharacterName | 
		self assertActorIsCorrect: aCharacterName in: elementCharactersCount ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:04'!
assert: anElementCharacter isAllowed: allowedCharacters

	(allowedCharacters includes: anElementCharacter) ifFalse: [ self error: (self notAllowCharaterErrorDescriptionFor: anElementCharacter) ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:48:41'!
assertActorIsCorrect: aCharacterName in: elements 
	
	| characterIdentifier |
	
	characterIdentifier := self perform: (aCharacterName, #Character) asSymbol.
	(elements includes: characterIdentifier)
		ifFalse: [ self error: (self characterIsMissingErrorDescriptionFor: aCharacterName) ].
		
	(elements occurrencesOf: characterIdentifier) > 1
		ifTrue: [ self error: (self shouldBeUniqueErrorDescriptionFor: aCharacterName) ].
! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:16'!
assertAllRowsHaveSameSizeIn: aStringRepresentation

	(aStringRepresentation allSatisfy: [ :aRow | aRow size = aStringRepresentation first size ]) ifFalse: [ 
		self error: self rowsMustHaveSameSizeErrorDescription ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:30'!
elementCharacterCountOf: aStringRepresentation

	| elementCharactersCount allowedCharacters |
	
	elementCharactersCount := Bag new.
	allowedCharacters := self allowedCharacters.
	
	aStringRepresentation do: [ :aRow |
		aRow do: [ :anElementCharacter | 
			self assert: anElementCharacter isAllowed: allowedCharacters.
			elementCharactersCount add: anElementCharacter ]].
	
	^elementCharactersCount ! !
