!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/12/2025 14:54:15'!
test01createNewCartShouldBeEmpty

	self assert: Cart new isEmpty equals: true.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/12/2025 22:52:58'!
test02CartWithItemIsNotEmptyAnymore

	| aBookToAdd catalog cart |
	aBookToAdd := 'El sapo Pepe'.
	catalog := OrderedCollection with:'El sapo Pepe'.
	cart := Cart createCartWith: catalog.
		
	self assert:  (cart addBook: aBookToAdd) isEmpty equals: false. ! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/12/2025 22:53:15'!
test03CartCanOnlyAddItemsFromTheCatalog

	| catalog cart |
	catalog := OrderedCollection with: 'El sapo Pepe'.
	cart := Cart createCartWith: catalog .
	
	self 
		should: [cart addBook: 'El Kybalion'] 
		raise: Error
		withMessageText: cart canOnlyAddBooksFromTheCatalog. ! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/12/2025 23:00:37'!
test04CartCanSelectMultipleAmountOfItemsToAdd

	| catalog cart |
	catalog := OrderedCollection with: 'El sapo Pepe'.
	cart := Cart createCartWith: catalog .
	
	cart addBook: 'El sapo Pepe' anAmount: 2.
	
	self assert: cart elements size equals: 2.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/12/2025 14:51:18'!
test05CartCanNotSelectInvalidAmountOfBooksToAdd

	| catalog cart |
	catalog := OrderedCollection with: 'El sapo Pepe'.
	cart := Cart createCartWith: catalog .
	
	self 
		should: [cart addBook: 'El sapo Pepe' anAmount: -2] 
		raise: Error
		withMessageText: cart amountShouldBeANaturalNumber . ! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/12/2025 23:00:57'!
test06CartCanRememberAddedItems

	| catalog cart |
	catalog := OrderedCollection with: 'El sapo Pepe'.
	cart := Cart createCartWith: catalog .
	
	cart addBook: 'El sapo Pepe'.
	
	self assert: (cart elements includes: 'El sapo Pepe') equals: true.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/12/2025 23:02:47'!
test07CartCanRememberAddedItemsOccurences

	| catalog cart |
	catalog := OrderedCollection with: 'El sapo Pepe'.
	cart := Cart createCartWith: catalog .
	
	cart addBook: 'El sapo Pepe' anAmount: 2. 
	
	self assert: (cart elements occurrencesOf: 'El sapo Pepe') equals: 2.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/12/2025 23:03:39'!
test08CartCanNotRememberNotAddedItems

	| catalog cart |
	catalog := OrderedCollection with: 'El sapo Pepe'.
	cart := Cart createCartWith: catalog .
	
	self deny: (cart elements includes: 'El sapo Pepe').! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/12/2025 23:04:22'!
test09CartCanNotRememberNotAddedItemsOccurences

	| catalog cart |
	catalog := OrderedCollection with: 'El sapo Pepe'.
	cart := Cart createCartWith: catalog .
	
	self assert: (cart elements occurrencesOf: 'El sapo Pepe') equals: 0.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'elements catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'testing' stamp: 'ml 6/12/2025 14:36:45'!
elements
	
	^elements! !

!Cart methodsFor: 'testing' stamp: 'ml 6/12/2025 13:11:26'!
isEmpty
	
	^elements isEmpty .! !


!Cart methodsFor: 'error msg' stamp: 'ml 6/12/2025 14:48:33'!
amountShouldBeANaturalNumber
	
	^'Amount should be a positive integer'.! !

!Cart methodsFor: 'error msg' stamp: 'ml 6/12/2025 13:59:51'!
canOnlyAddBooksFromTheCatalog
	
	^'can only add books from the catalog'.! !


!Cart methodsFor: 'adding books' stamp: 'ml 6/12/2025 14:36:37'!
addBook: aBookToAdd 
	
	self assertAddingBookShouldBeInCatalog: aBookToAdd.
	elements add: aBookToAdd .! !

!Cart methodsFor: 'adding books' stamp: 'ml 6/12/2025 14:49:18'!
addBook: aBookToAdd anAmount: timesToAdd 

	self assertThatAmountShouldBeNaturalNumber: timesToAdd	.
	
	timesToAdd timesRepeat: [self addBook: aBookToAdd].! !


!Cart methodsFor: 'initialize' stamp: 'ml 6/12/2025 14:36:28'!
initialize
	
	catalog:= OrderedCollection new.
	elements:= OrderedCollection new.! !

!Cart methodsFor: 'initialize' stamp: 'ml 6/12/2025 14:26:28'!
refreshCatalog: aCatalog
	
	catalog:= aCatalog .! !


!Cart methodsFor: 'assertions' stamp: 'ml 6/12/2025 14:23:59'!
assertAddingBookShouldBeInCatalog: aBookToAdd

	^ (catalog includes: aBookToAdd) ifFalse: [self error: self canOnlyAddBooksFromTheCatalog ]! !

!Cart methodsFor: 'assertions' stamp: 'ml 6/12/2025 14:49:06'!
assertThatAmountShouldBeNaturalNumber: timesToAdd

	^ timesToAdd negative ifTrue: [self error: self amountShouldBeANaturalNumber]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'as yet unclassified' stamp: 'ml 6/12/2025 14:26:41'!
createCartWith: aCatalog 
	
	^self new refreshCatalog: aCatalog.! !
