!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 19:41:58'!
catalog
	
	^OrderedCollection with: self itemSellByStore! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 19:58:57'!
createCart

	^Cart createAcceptingItemsFrom: self catalog .! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 19:45:40'!
itemNotSellByStore
	^'invalidItem'! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 19:42:16'!
itemSellByStore
	^'validItem'! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 19:58:01'!
test01createNewCartShouldBeEmpty

	self assert: (self createCart) isEmpty ! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 19:58:01'!
test02CartWithItemIsNotEmptyAnymore

	| cart |
	cart := self createCart .
		
	self assert:  (cart addItem: self itemSellByStore ) isEmpty equals: false. ! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 19:58:01'!
test03CartCanOnlyAddItemsFromTheCatalog

	| cart |
	cart := self createCart .
	
	self 
		should: [cart addItem: self itemNotSellByStore] 
		raise: Error
		withMessageText: cart canOnlyAddBooksFromTheCatalog. ! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 19:58:01'!
test04CartCanSelectMultipleAmountOfItemsToAdd

	| cart |
	cart := self createCart .
	
	cart addItem: (self itemSellByStore) anAmount: 2.
	
	self assert: cart elements size equals: 2.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 19:58:01'!
test05CartCanNotSelectInvalidAmountOfItemsToAdd

	| cart |
	cart := self createCart .
	
	self 
		should: [cart addItem: self itemSellByStore anAmount: -2] 
		raise: Error
		withMessageText: cart amountShouldBeANaturalNumber . ! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 19:58:01'!
test06CartCanRememberAddedItems

	| cart |
	cart := self createCart .
	
	cart addItem: self itemSellByStore .
	
	self assert: (cart elements includes: self itemSellByStore ) equals: true.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 19:58:01'!
test07CartCanRememberAddedItemsOccurences

	| cart |
	cart := self createCart .
	
	cart addItem: self itemSellByStore anAmount: 2. 
	
	self assert: (cart elements occurrencesOf: self itemSellByStore ) equals: 2.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 19:58:01'!
test08CartCanNotRememberNotAddedItems

	| cart |
	cart := self createCart .
	
	self deny: (cart elements includes: self itemSellByStore ).! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 20:06:00'!
catalog
	
	^OrderedCollection with: self itemSellByStore! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 20:06:20'!
createCart

	^Cart createAcceptingItemsFrom: self catalog .! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 20:06:30'!
itemNotSellByStore
	^'invalidItem'! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 20:06:39'!
itemSellByStore
	^'validItem'! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 20:24:18'!
priceBook
	
	| priceBook |
	priceBook := Dictionary new.
	
	priceBook add: self itemSellByStore -> self validItemPrice.
	^priceBook ! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 20:27:20'!
test01CashierCanNotProcessAnEmptyCart

	self 
		should: [Cashier withA: self priceBook receiveA: self createCart ] 
		raise: Error
		withMessageText: Cashier canNotProcessAnEmptyCart . ! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 20:23:49'!
test02CashierProcessACartWithASingleItem

	| cart cashier |
	cart := self createCart.
	cart addItem: self itemSellByStore.
	
	cashier := Cashier withA: (self priceBook) receiveA: cart.
	
	self assert: (cashier calculateXXXX) equals: self validItemPrice .
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 19:01:19'!
test03CashierProcessACartWithAMultipleItems

	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 20:13:23'!
validItemPrice
	
	^10.! !


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


!Cart methodsFor: 'adding books' stamp: 'ml 6/13/2025 19:49:37'!
addItem: aBookToAdd 
	
	self assertAddingBookShouldBeInCatalog: aBookToAdd.
	elements add: aBookToAdd .! !

!Cart methodsFor: 'adding books' stamp: 'ml 6/13/2025 19:49:37'!
addItem: aBookToAdd anAmount: timesToAdd 

	self assertThatAmountShouldBeNaturalNumber: timesToAdd	.
	
	timesToAdd timesRepeat: [self addItem: aBookToAdd].! !


!Cart methodsFor: 'initialize' stamp: 'ml 6/13/2025 19:39:15'!
initializeAcceptItemsFrom: aCatalog
	
	catalog:= aCatalog .
	elements := OrderedCollection new.! !


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

!Cart class methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 19:46:53'!
createAcceptingItemsFrom: aCatalog 
	
	^self new initializeAcceptItemsFrom: aCatalog.! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'priceBook cartToProcess'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialization' stamp: 'ml 6/13/2025 20:26:20'!
initializeWith: aPriceBook and: aCartToProcess 

	priceBook := aPriceBook.
	cartToProcess := aCartToProcess.! !


!Cashier methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 20:28:23'!
calculateXXXX
	
	^10.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 19:04:38'!
canNotProcessAnEmptyCart
	
	^'can not process an empty cart'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 20:25:55'!
withA: aPriceBook receiveA: aCartToProcess 

	aCartToProcess isEmpty ifTrue:[self error: self canNotProcessAnEmptyCart].
	
	^self new initializeWith: aPriceBook and: aCartToProcess .! !
