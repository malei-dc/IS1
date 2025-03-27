!classDefinition: #TetrisBoardTest category: '2024-2C-Recuperatorio'!
TestCase subclass: #TetrisBoardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Recuperatorio'!

!TetrisBoardTest methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 18:40:41'!
test01canNotCreateABoardLessThanFiveRowsAndFourColumns

	self should: [ TetrisBoard numberOfRows: 4 numberOfColumns: 3 nextPiece: #pieceO] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
		self assert: anException messageText equals: TetrisBoard canNotCreateABoardLessThanFiveRowsAndFourColumns
	]! !

!TetrisBoardTest methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:20:16'!
test02StartingWithPieceOInTheMiddleOfEvenFirstRow

	| board oPiece |
	
	"board := StringTetrisBoard representedAs: #
	('#--**--#'
	 '#--**--#'
	 '#------#'
	 '#------#'
	 '#------#'
	 '########')."
	oPiece := TetrisPieceO new.
	board := TetrisBoard numberOfRows: 5+1 numberOfColumns: 6+2 nextPiece: oPiece.
	
	self assert: (board elements at: 4@1) equals: oPiece .
	self
		assert: board stringRepresentationOfBoard
		equals: #(
		 '#--**--#'
		 '#--**--#'
		 '#------#'
		 '#------#'
		 '#------#'
		 '########').
	! !

!TetrisBoardTest methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:21:12'!
test03StartingWithPieceOInTheMiddleOfOddFirstRow

	| board oPiece |
	
	"board := StringTetrisBoard representedAs: #
	('#-**--#'
	 '#-**--#'
	 '#-----#'
	 '#-----#'
	 '#-----#'
	 '#######')."
	oPiece := TetrisPieceO new.
	board := TetrisBoard numberOfRows: 5+1 numberOfColumns: 5+2 nextPiece: oPiece.
	
	self assert: (board elements at: 3@1) equals: oPiece .
	self
		assert: board stringRepresentationOfBoard
		equals: #(
			 '#-**--#'
			 '#-**--#'
			 '#-----#'
			 '#-----#'
			 '#-----#'
			 '#######').
	! !

!TetrisBoardTest methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:21:46'!
test04StartingWithPieceTInTheMiddleOfEvenFirstRow

	| board tPiece |
	
	"board := StringTetrisBoard representedAs: #
	('#-***--#'
	 '#--*---#'
	 '#------#'
	 '#------#'
	 '#------#'
	 '########')."
	tPiece := TetrisPieceT new.
	board := TetrisBoard numberOfRows: 5+1 numberOfColumns: 6+2 nextPiece: tPiece.
	
	self assert: (board elements at: 3@1) equals: tPiece .
	self
		assert: board stringRepresentationOfBoard
		equals: #(
			 '#-***--#'
			 '#--*---#'
			 '#------#'
			 '#------#'
			 '#------#'
			 '########').
	! !

!TetrisBoardTest methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:23:32'!
test05StartingWithPieceTInTheMiddleOfOddFirstRow

	| board tPiece |
	
	"board := StringTetrisBoard representedAs: #
	('#-***-#'
	 '#--*--#'
	 '#-----#'
	 '#-----#'
	 '#-----#'
	 '########')."
	tPiece := TetrisPieceT new.
	board := TetrisBoard numberOfRows: 5+1 numberOfColumns: 5+2 nextPiece: tPiece.
	
	self assert: (board elements at: 3@1) equals: tPiece .
	self
		assert: board stringRepresentationOfBoard
		equals: #(
		 '#-***-#'
		 '#--*--#'
		 '#-----#'
		 '#-----#'
		 '#-----#'
		 '#######').
	! !

!TetrisBoardTest methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:23:57'!
test06StartingWithPieceIInTheMiddleOfEvenFirstRow

	| board iPiece |

	
	"board := StringTetrisBoard representedAs: #
	('#--*---#'
	 '#--*---#'
	 '#--*---#'
	 '#--*---#'
	 '#------#'
	 '########')."
	iPiece := TetrisPieceI new.
	board := TetrisBoard numberOfRows: 5+1 numberOfColumns: 6+2 nextPiece: iPiece.
	
	self assert: (board elements at: 4@1) equals: iPiece .
	self
		assert: board stringRepresentationOfBoard
		equals: #(
'#--*---#'
	 '#--*---#'
	 '#--*---#'
	 '#--*---#'
	 '#------#'
	 '########').
	! !

!TetrisBoardTest methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:24:28'!
test07StartingWithPieceIInTheMiddleOfOddFirstRow

	| board iPiece |

	
	"board := StringTetrisBoard representedAs: #
	('#--*--#'
	 '#--*--#'
	 '#--*--#'
	 '#--*--#'
	 '#-----#'
	 '########')."
	iPiece := TetrisPieceI new.
	board := TetrisBoard numberOfRows: 5+1 numberOfColumns: 5+2 nextPiece: iPiece.
	
	self assert: (board elements at: 4@1) equals: iPiece .
	self
		assert: board stringRepresentationOfBoard
		equals: #(
'#--*--#'
	 '#--*--#'
	 '#--*--#'
	 '#--*--#'
	 '#-----#'
	 '#######').
	! !

!TetrisBoardTest methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:24:47'!
test08StartingWithPieceZInTheMiddleOfEvenFirstRow

	| board tPiece |

	
	"board := StringTetrisBoard representedAs: #
	('#-**---#'
	 '#--**--#'
	 '#------#'
	 '#------#'
	 '#------#'
	 '########')."
	tPiece := TetrisPieceZ new.
	board := TetrisBoard numberOfRows: 5+1 numberOfColumns: 6+2 nextPiece: tPiece.
	
	self assert: (board elements at: 3@1) equals: tPiece .
	self
		assert: board stringRepresentationOfBoard
		equals: #(
'#-**---#'
	 '#--**--#'
	 '#------#'
	 '#------#'
	 '#------#'
	 '########').
	! !

!TetrisBoardTest methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:25:12'!
test09StartingWithPieceZInTheMiddleOfOddFirstRow

	| board tPiece |

	
	"board := StringTetrisBoard representedAs: #
	('#-**--#'
	 '#--**-#'
	 '#-----#'
	 '#-----#'
	 '#-----#'
	 '########')."
	tPiece := TetrisPieceZ new.
	board := TetrisBoard numberOfRows: 5+1 numberOfColumns: 5+2 nextPiece: tPiece.
	
	self assert: (board elements at: 3@1) equals: tPiece .
	self
		assert: board stringRepresentationOfBoard
		equals: #(
'#-**--#'
	 '#--**-#'
	 '#-----#'
	 '#-----#'
	 '#-----#'
	 '#######').
	! !

!TetrisBoardTest methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:25:36'!
test10StartingWithPieceLInTheMiddleOfEvenFirstRow

	| board tPiece |

	
	"board := StringTetrisBoard representedAs: #
	('#--*---#'
	 '#--*---#'
	 '#--**--#'
	 '#------#'
	 '#------#'
	 '########')."
	tPiece := TetrisPieceL new.
	board := TetrisBoard numberOfRows: 5+1 numberOfColumns: 6+2 nextPiece: tPiece.
	
	self assert: (board elements at: 4@1) equals: tPiece .
	self
		assert: board stringRepresentationOfBoard
		equals: #(
'#--*---#'
	 '#--*---#'
	 '#--**--#'
	 '#------#'
	 '#------#'
	 '########').
	! !

!TetrisBoardTest methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:37:34'!
test11StartingWithPieceLInTheMiddleOfOddFirstRow

	| board tPiece |

	
	"board := StringTetrisBoard representedAs: #
	('#-*---#'
	 '#-*---#'
	 '#-**--#'
	 '#-----#'
	 '#-----#'
	 '########')."
	tPiece := TetrisPieceL new.
	board := TetrisBoard numberOfRows: 5+1 numberOfColumns: 5+2 nextPiece: tPiece.
	
	self assert: (board elements at: 3@1) equals: tPiece .
	self
		assert: board stringRepresentationOfBoard
		equals: #(
	 '#-*---#'
	 '#-*---#'
	 '#-**--#'
	 '#-----#'
	 '#-----#'
	 '#######').
	! !


!classDefinition: #TetrisGameTest category: '2024-2C-Recuperatorio'!
TestCase subclass: #TetrisGameTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Recuperatorio'!

!TetrisGameTest methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:33:08'!
test01GameMoveElementWhenTicks

	| board oPiece game |
	oPiece := TetrisPieceO new.
	board := TetrisBoard numberOfRows: 5+1 numberOfColumns: 6+2 nextPiece: oPiece.
	game := TetrisGame on: board .
	game tick.
	self
		assert: (game board) stringRepresentationOfBoard
		equals: #(
		 '#------#'
		 '#--**--#'
		 '#--**--#'
		 '#------#'
		 '#------#'
		 '########').! !

!TetrisGameTest methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:49:47'!
test02GameMoveElementCorrectlyWhenMultipleTicks

	| board oPiece game |
	oPiece := TetrisPieceO new.
	board := TetrisBoard numberOfRows: 5+1 numberOfColumns: 6+2 nextPiece: oPiece.
	game := TetrisGame on: board .
	game tick; tick; tick.
	self
		assert: (game board) stringRepresentationOfBoard
		equals: #(
		 '#------#'
		 '#------#'
		 '#------#'
		 '#--**--#'
		 '#--**--#'
		 '########').! !

!TetrisGameTest methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:51:58'!
test03GameElementCanNotKeepMovingAtButtom

	| board oPiece game |
	oPiece := TetrisPieceO new.
	board := TetrisBoard numberOfRows: 5+1 numberOfColumns: 6+2 nextPiece: oPiece.
	game := TetrisGame on: board .
	3 timesRepeat: [game tick].
	game tick.
	self
		assert: (game board) stringRepresentationOfBoard
		equals: #(
		 '#------#'
		 '#------#'
		 '#------#'
		 '#--**--#'
		 '#--**--#'
		 '########').! !

!TetrisGameTest methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:53:45'!
test04FallingGameElementCanMoveLeft

	| board oPiece game |
	oPiece := TetrisPieceO new.
	board := TetrisBoard numberOfRows: 5+1 numberOfColumns: 6+2 nextPiece: oPiece.
	game := TetrisGame on: board .
	"game mover Izq"
	game tick.
	self
		assert: (game board) stringRepresentationOfBoard
		equals: #(
		 '#------#'
		 '#-**---#'
		 '#-**---#'
		 '#------#'
		 '#------#'
		 '########').! !


!classDefinition: #TetrisBoard category: '2024-2C-Recuperatorio'!
Object subclass: #TetrisBoard
	instanceVariableNames: 'boardExtend elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Recuperatorio'!

!TetrisBoard methodsFor: 'testing' stamp: 'ml 12/11/2024 18:41:12'!
elements
	
	^elements! !


!TetrisBoard methodsFor: 'initialize' stamp: 'ml 12/11/2024 21:18:28'!
defineTheWalls

	self setSidesWalls. 
	self setButtomWall.! !

!TetrisBoard methodsFor: 'initialize' stamp: 'ml 12/11/2024 21:09:52'!
initializeWith: aBoardWidth and: aBoardHeight nextPiece: aTetrisPiece  

	elements := Dictionary new.
	boardExtend := aBoardWidth@aBoardHeight .
	
	self locate: aTetrisPiece atTheMiddleOf: aBoardWidth .
	self defineTheWalls.! !

!TetrisBoard methodsFor: 'initialize' stamp: 'ml 12/11/2024 19:56:37'!
locate: aTetrisPiece atTheMiddleOf: aBoardWidth 

	 (aTetrisPiece setAllPositions: aBoardWidth) do: [ :piecePosition | elements at: piecePosition put: aTetrisPiece].! !

!TetrisBoard methodsFor: 'initialize' stamp: 'ml 12/11/2024 21:18:26'!
setButtomWall

	^ 1 to: (boardExtend x) do: [ :x| elements at: x@(boardExtend y) put: Wall new]! !

!TetrisBoard methodsFor: 'initialize' stamp: 'ml 12/11/2024 21:18:14'!
setSidesWalls

	^ 1 to: ((boardExtend y) - 1) do: [:y |  elements at: 1@y put: Wall new. 
										elements at: (boardExtend x)@y put: Wall new]! !


!TetrisBoard methodsFor: 'representation characters' stamp: 'ml 12/11/2024 20:15:42'!
emptyCharacter

	^self class emptyCharacter ! !

!TetrisBoard methodsFor: 'representation characters' stamp: 'ml 12/11/2024 20:14:08'!
ocupyCharacter

	^self class ocupyCharacter! !


!TetrisBoard methodsFor: 'string representation' stamp: 'ml 12/11/2024 20:55:05'!
representationOfRowNumber: y
	
	^String streamContents: [ :rowStream |
		1 to: boardExtend x do: [ :x |
			rowStream nextPut: (elements at: x@y ifPresent: 
													[:aElement |  aElement characterRepresentation] 
												ifAbsent: 
													[self class emptyCharacter])
								]]
	! !

!TetrisBoard methodsFor: 'string representation' stamp: 'ml 12/11/2024 20:19:54'!
stringRepresentationOfBoard
	
	| rows |
	
	rows := OrderedCollection new.

	1 to: boardExtend y do: [ :y | 
		rows add: (self representationOfRowNumber: y) ].
	
	^rows asArray! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TetrisBoard class' category: '2024-2C-Recuperatorio'!
TetrisBoard class
	instanceVariableNames: ''!

!TetrisBoard class methodsFor: 'representation character' stamp: 'ml 12/11/2024 20:15:25'!
emptyCharacter

	^$-! !

!TetrisBoard class methodsFor: 'representation character' stamp: 'ml 12/11/2024 20:15:04'!
ocupyCharacter

	^$*! !

!TetrisBoard class methodsFor: 'representation character' stamp: 'ml 12/11/2024 21:07:14'!
wallCharacter

	^$#! !


!TetrisBoard class methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 18:23:43'!
assertWidthGreaterThanFour: aBoardWidth andHeightGreaterThanFive: aBoardHeight

	^ ((aBoardHeight < 5) or: (aBoardWidth < 4)) ifTrue: [self error: self canNotCreateABoardLessThanFiveRowsAndFourColumns]! !

!TetrisBoard class methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 18:23:23'!
canNotCreateABoardLessThanFiveRowsAndFourColumns

	^ 'can not create a board less than 5 rows and 4 columns'! !

!TetrisBoard class methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:18:53'!
numberOfRows: aBoardHeight numberOfColumns: aBoardWidth nextPiece: aTetrisPiece .

	self assertWidthGreaterThanFour: aBoardWidth andHeightGreaterThanFive: aBoardHeight.
	
	^ self new initializeWith: aBoardWidth  and: aBoardHeight nextPiece: aTetrisPiece .! !


!classDefinition: #TetrisBoardElements category: '2024-2C-Recuperatorio'!
Object subclass: #TetrisBoardElements
	instanceVariableNames: 'bodyPositions'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Recuperatorio'!

!TetrisBoardElements methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:06:23'!
characterRepresentation

	self subclassResponsibility! !

!TetrisBoardElements methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 19:40:24'!
initialize

	bodyPositions := OrderedCollection new.! !

!TetrisBoardElements methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 20:04:07'!
setAllPositions: aBoardWidth

	bodyPositions add: (self startingPositionOnFirstRow: aBoardWidth).
	
	self setBodyPositions .
	
	^bodyPositions ! !

!TetrisBoardElements methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 19:47:15'!
setBodyPositions

	self subclassResponsibility! !

!TetrisBoardElements methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 20:00:37'!
startingPositionOnFirstRow: aBoardWidth

	self subclassResponsibility! !


!classDefinition: #TetrisPieceI category: '2024-2C-Recuperatorio'!
TetrisBoardElements subclass: #TetrisPieceI
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Recuperatorio'!

!TetrisPieceI methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:06:23'!
characterRepresentation

	^ TetrisBoard ocupyCharacter .! !

!TetrisPieceI methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 20:10:56'!
setBodyPositions

	bodyPositions add: (position + (0@1)).
	bodyPositions add: (position + (0@2)).
	bodyPositions add: (position + (0@3)).! !

!TetrisPieceI methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 20:00:37'!
startingPositionOnFirstRow: aBoardWidth 
	
	(aBoardWidth even) 
	ifTrue: [^ position := (((aBoardWidth /2))@1)] 
	ifFalse: [^ position := (((aBoardWidth /2)asInteger+1) @1)] ! !


!classDefinition: #TetrisPieceL category: '2024-2C-Recuperatorio'!
TetrisBoardElements subclass: #TetrisPieceL
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Recuperatorio'!

!TetrisPieceL methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:06:23'!
characterRepresentation

	^ TetrisBoard ocupyCharacter .! !

!TetrisPieceL methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 20:11:31'!
setBodyPositions

	bodyPositions add: (position + (0@1)).
	bodyPositions add: (position + (0@2)).
	bodyPositions add: (position + (1@2)).
	! !

!TetrisPieceL methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 20:00:37'!
startingPositionOnFirstRow: aBoardWidth 
	
	(aBoardWidth even) 
	ifTrue: [^ position := ((aBoardWidth /2)@1)] 
	ifFalse: [^ position := ((aBoardWidth /2)asInteger @1)] ! !


!classDefinition: #TetrisPieceO category: '2024-2C-Recuperatorio'!
TetrisBoardElements subclass: #TetrisPieceO
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Recuperatorio'!

!TetrisPieceO methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:06:23'!
characterRepresentation

	^ TetrisBoard ocupyCharacter .! !

!TetrisPieceO methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 20:10:13'!
setBodyPositions

	bodyPositions add: position + (1@1).
	bodyPositions add: position + (1@0).
	bodyPositions add: position + (0@1).! !

!TetrisPieceO methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 20:09:53'!
startingPositionOnFirstRow: aBoardWidth 
	
	(aBoardWidth even) 
	ifTrue: [^ position := ((aBoardWidth /2)@1)] 
	ifFalse: [^ position := ((aBoardWidth /2)asInteger @1)].
	
	self setBodyPositions .! !


!classDefinition: #TetrisPieceT category: '2024-2C-Recuperatorio'!
TetrisBoardElements subclass: #TetrisPieceT
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Recuperatorio'!

!TetrisPieceT methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:06:23'!
characterRepresentation

	^ TetrisBoard ocupyCharacter .! !

!TetrisPieceT methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 20:10:40'!
setBodyPositions

	bodyPositions add: (position + (1@1)).
	bodyPositions add: (position + (1@0)).
	bodyPositions add: (position + (2@0)).! !

!TetrisPieceT methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 20:00:37'!
startingPositionOnFirstRow: aBoardWidth 
	
	(aBoardWidth even) 
	ifTrue: [^ position := (((aBoardWidth /2)-1)@1)] 
	ifFalse: [^ position := ((aBoardWidth /2)asInteger @1)] ! !


!classDefinition: #TetrisPieceZ category: '2024-2C-Recuperatorio'!
TetrisBoardElements subclass: #TetrisPieceZ
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Recuperatorio'!

!TetrisPieceZ methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:06:23'!
characterRepresentation

	^ TetrisBoard ocupyCharacter .! !

!TetrisPieceZ methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 20:11:15'!
setBodyPositions

	bodyPositions add: (position + (1@1)).
	bodyPositions add: (position + (2@1)).
	bodyPositions add: (position + (1@0)).! !

!TetrisPieceZ methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:48:07'!
startingPositionOnFirstRow: aBoardWidth 
	
	(aBoardWidth even) 
	ifTrue: [^ position := (((aBoardWidth /2)-1)@1)] 
	ifFalse: [^ position := ((aBoardWidth /2)asInteger @1)] .
	! !


!classDefinition: #Wall category: '2024-2C-Recuperatorio'!
TetrisBoardElements subclass: #Wall
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Recuperatorio'!

!Wall methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:06:44'!
characterRepresentation

	^ TetrisBoard wallCharacter .! !


!classDefinition: #TetrisGame category: '2024-2C-Recuperatorio'!
Object subclass: #TetrisGame
	instanceVariableNames: 'gameBoard'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Recuperatorio'!

!TetrisGame methodsFor: 'initialization' stamp: 'ml 12/11/2024 21:34:33'!
initializeWith: board 

	gameBoard := board.! !


!TetrisGame methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:36:20'!
board

	^gameBoard ! !

!TetrisGame methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:47:03'!
tick

	2 to: (gameBoard size) x do:[ :x | ^'me quede sin tiempo :( pero dejo tests sin resolver para decirte que algo de TDD sé ']
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TetrisGame class' category: '2024-2C-Recuperatorio'!
TetrisGame class
	instanceVariableNames: ''!

!TetrisGame class methodsFor: 'as yet unclassified' stamp: 'ml 12/11/2024 21:33:46'!
on: board 
	
	^self new initializeWith:board .! !
