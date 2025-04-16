!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'stack operations' stamp: 'ml 4/15/2025 21:16:31'!
pop

	self top.
	"(elements size = 1) ifTrue: [state:= OOStackStateEmpty with: self]."
	^elements removeLast ! !

!OOStack methodsFor: 'stack operations' stamp: 'ml 4/15/2025 21:16:22'!
push: aElementToPush 
	
	elements add: aElementToPush .
	"state := OOStackStateNotEmpty with: self."! !

!OOStack methodsFor: 'stack operations' stamp: 'ml 4/16/2025 17:45:54'!
top

	"state tryToGetElement.
	elements isEmpty ifTrue: [self error: self class stackEmptyErrorDescription ]."
	
	| actualState |
	actualState := self state.
	actualState tryToGetElement.
	^elements first ! !


!OOStack methodsFor: 'initialize' stamp: 'ml 4/15/2025 21:19:08'!
initialize

	elements := OrderedCollection new.
	"state := OOStackStateEmpty with: self."! !


!OOStack methodsFor: 'stack operation - private' stamp: 'ml 4/14/2025 21:52:52'!
tryToGetElementWhenEmpty.

	self error: self class stackEmptyErrorDescription.! !


!OOStack methodsFor: 'stack state' stamp: 'ml 4/14/2025 21:16:52'!
isEmpty

	^elements isEmpty! !

!OOStack methodsFor: 'stack state' stamp: 'ml 4/14/2025 21:19:35'!
size
	^elements size .! !

!OOStack methodsFor: 'stack state' stamp: 'ml 4/16/2025 18:22:55'!
state

	^OOStackState getStateOf: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #OOStackState category: #'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackState methodsFor: 'initialize' stamp: 'ml 4/16/2025 18:14:27'!
initializeWith: aStack

	stack := aStack .! !


!OOStackState methodsFor: 'operation' stamp: 'ml 4/16/2025 18:14:34'!
tryToGetElement
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: #'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'get state' stamp: 'ml 4/16/2025 18:32:47'!
getStateOf: aStackToCheck

	| allSubclasses actualState |
	allSubclasses := self allSubclasses.
	
	actualState := allSubclasses detect:[ :subclass| (subclass iHaveAnEmpty: aStackToCheck) ].	
	^actualState new initializeWith: aStackToCheck .
	! !

!OOStackState class methodsFor: 'get state' stamp: 'ml 4/16/2025 18:17:46'!
iHaveAnEmpty: aStackToCheck

	self subclassResponsibility .! !


!classDefinition: #OOStackStateEmpty category: #'Stack-Exercise'!
OOStackState subclass: #OOStackStateEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackStateEmpty methodsFor: 'operation' stamp: 'ml 4/14/2025 21:53:08'!
tryToGetElement

	stack tryToGetElementWhenEmpty.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackStateEmpty class' category: #'Stack-Exercise'!
OOStackStateEmpty class
	instanceVariableNames: ''!

!OOStackStateEmpty class methodsFor: 'get state' stamp: 'ml 4/16/2025 18:17:56'!
iHaveAnEmpty: aStackToCheck

	^aStackToCheck isEmpty .! !


!classDefinition: #OOStackStateNotEmpty category: #'Stack-Exercise'!
OOStackState subclass: #OOStackStateNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackStateNotEmpty methodsFor: 'operation' stamp: 'ml 4/14/2025 21:53:25'!
tryToGetElement

	^self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackStateNotEmpty class' category: #'Stack-Exercise'!
OOStackStateNotEmpty class
	instanceVariableNames: ''!

!OOStackStateNotEmpty class methodsFor: 'get state' stamp: 'ml 4/16/2025 18:18:06'!
iHaveAnEmpty: aStacktoCheck

	^ aStacktoCheck isEmpty not .! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
