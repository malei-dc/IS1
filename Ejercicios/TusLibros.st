!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'objectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/24/2025 14:39:11'!
initialize
	objectsFactory := TusLibrosTestObjectsFactory new.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/24/2025 14:36:36'!
test01createNewCartShouldBeEmpty

	self assert: (objectsFactory createCart) isEmpty ! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/24/2025 14:36:40'!
test02CartWithItemIsNotEmptyAnymore

	| cart |
	cart := objectsFactory createCart .
		
	self assert:  (cart add: objectsFactory itemSellByStore ) isEmpty equals: false. ! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/24/2025 14:36:45'!
test03CartCanOnlyAddItemsFromTheCatalog

	| cart |
	cart := objectsFactory createCart .
	
	self 
		should: [cart add: objectsFactory itemNotSellByStore] 
		raise: Error
		withMessageText: cart canOnlyAddItemsFromTheCatalog. ! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/24/2025 14:36:50'!
test04CartCanSelectMultipleAmountOfItemsToAdd

	| cart |
	cart := objectsFactory createCart .
	
	cart add: (objectsFactory itemSellByStore) anAmount: 2.
	
	self assert: cart elements size equals: 2.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/24/2025 14:36:55'!
test05CartCanNotSelectInvalidAmountOfItemsToAdd

	| cart |
	cart := objectsFactory createCart .
	
	self 
		should: [cart add: objectsFactory itemSellByStore anAmount: -2] 
		raise: Error
		withMessageText: cart amountShouldBeANaturalNumber . ! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/24/2025 14:37:00'!
test06CartCanRememberAddedItems

	| cart |
	cart := objectsFactory createCart .
	
	cart add: objectsFactory itemSellByStore .
	
	self assert: (cart elements includes: objectsFactory itemSellByStore ) equals: true.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/24/2025 14:37:08'!
test07CartCanRememberAddedItemsOccurences

	| cart |
	cart := objectsFactory createCart .
	
	cart add: objectsFactory itemSellByStore anAmount: 2. 
	
	self assert: (cart elements occurrencesOf: objectsFactory itemSellByStore ) equals: 2.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 6/24/2025 14:37:12'!
test08CartCanNotRememberNotAddedItems

	| cart |
	cart := objectsFactory createCart .
	
	self deny: (cart elements includes: objectsFactory itemSellByStore ).! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'objectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ml 6/26/2025 22:04:56'!
initialize

	objectsFactory := TusLibrosTestObjectsFactory new.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ml 6/26/2025 22:05:07'!
test01CashierCanNotProcessAnEmptyCart

	self 
		should: [Cashier withA: objectsFactory priceBook receiveA: objectsFactory createCart and: objectsFactory notExpiredCreditCard ] 
		raise: Error
		withMessageText: Cashier canNotProcessAnEmptyCart . ! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ml 6/26/2025 22:05:15'!
test02CashierProcessACartWithASingleItem

	| cart cashier |
	cart := objectsFactory createCart.
	cart add: objectsFactory itemSellByStore.
	
	cashier := Cashier withA: (objectsFactory priceBook) receiveA: cart and: objectsFactory notExpiredCreditCard .
	
	self assert: (cashier checkout) equals: objectsFactory validItemPrice .
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ml 6/26/2025 22:05:24'!
test03CashierProcessACartWithAMultipleItems

	| cart cashier |
	cart := objectsFactory createCart.
	cart add: objectsFactory itemSellByStore anAmount: 2. 
	
	cashier := Cashier withA: (objectsFactory priceBook) receiveA: cart and: objectsFactory notExpiredCreditCard .
	
	self assert: (cashier checkout) equals: (objectsFactory validItemPrice *  (cart elements occurrencesOf: objectsFactory itemSellByStore )).! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ml 6/26/2025 22:05:31'!
test04CashierReceivingAnExpiredCreditCardShouldRaiseError

	self 
		should: [Cashier withA: objectsFactory priceBook receiveA: objectsFactory createCart and: objectsFactory expiredCreditCard] 
		raise: Error
		withMessageText: Cashier theCreditCardIsExpired . ! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'items catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'testing' stamp: 'ml 6/24/2025 14:31:22'!
elements
	
	^items! !

!Cart methodsFor: 'testing' stamp: 'ml 6/24/2025 14:31:22'!
isEmpty
	
	^items isEmpty .! !


!Cart methodsFor: 'error msg' stamp: 'ml 6/24/2025 14:23:39'!
amountShouldBeANaturalNumber
	
	^'Amount should be a positive natural number'.! !

!Cart methodsFor: 'error msg' stamp: 'ml 6/24/2025 14:23:24'!
canOnlyAddItemsFromTheCatalog
	
	^'can only add items from the catalog'.! !


!Cart methodsFor: 'adding books' stamp: 'ml 6/24/2025 14:27:46'!
add: anItem 
	self add: anItem  anAmount: 1. ! !

!Cart methodsFor: 'adding books' stamp: 'ml 6/24/2025 14:31:22'!
add: anItem anAmount: aQuantity 

	self assertThatAmountShouldBeNaturalNumber: aQuantity	.
	self assertAddingItemShouldBeInCatalog: anItem.
	
	aQuantity timesRepeat: [items add: anItem ].! !


!Cart methodsFor: 'initialize' stamp: 'ml 6/24/2025 14:31:22'!
initializeAcceptItemsFrom: aCatalog
	
	catalog:= aCatalog .
	items := OrderedCollection new.! !


!Cart methodsFor: 'assertions' stamp: 'ml 6/24/2025 14:28:31'!
assertAddingItemShouldBeInCatalog: aBookToAdd

	^ (catalog includes: aBookToAdd) ifFalse: [self error: self canOnlyAddItemsFromTheCatalog ]! !

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


!Cashier methodsFor: 'as yet unclassified' stamp: 'ffg 6/17/2025 15:20:33'!
checkout
	
	^cartToProcess elements sum:[ :itemInCart | priceBook at: itemInCart ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'ml 6/13/2025 19:04:38'!
canNotProcessAnEmptyCart
	
	^'can not process an empty cart'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'ffg 6/17/2025 15:39:16'!
theCreditCardIsExpired

	^'The credit card is expired'.! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'ffg 6/17/2025 16:23:20'!
withA: aPriceBook receiveA: aCartToProcess and: aCreditCard  
	
	aCreditCard isExpired ifTrue:[self error: self theCreditCardIsExpired ].
	aCartToProcess isEmpty ifTrue:[self error: self canNotProcessAnEmptyCart].
	
	^self new initializeWith: aPriceBook and: aCartToProcess .! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'as yet unclassified' stamp: 'ffg 6/17/2025 16:22:20'!
isExpired

	^GregorianMonthOfYear current > expiration ! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'ffg 6/17/2025 15:43:21'!
withExpirationMonth: aExpirationMonth

	expiration := aExpirationMonth .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'ffg 6/17/2025 15:42:50'!
createWithExpirationMonth: aExpirationMonth

	^self new withExpirationMonth: aExpirationMonth .! !


!classDefinition: #TusLibrosTestObjectsFactory category: #TusLibros!
Object subclass: #TusLibrosTestObjectsFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'ml 6/24/2025 14:34:10'!
catalog
	
	^OrderedCollection with: self itemSellByStore! !

!TusLibrosTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'ml 6/24/2025 14:34:20'!
createCart

	^Cart createAcceptingItemsFrom: self catalog .! !

!TusLibrosTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'ml 6/26/2025 22:03:08'!
expiredCreditCard
	
	^CreditCard createWithExpirationMonth: GregorianMonthOfYear current previous ! !

!TusLibrosTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'ml 6/24/2025 14:34:27'!
itemNotSellByStore
	^'invalidItem'! !

!TusLibrosTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'ml 6/24/2025 14:34:36'!
itemSellByStore
	^'validItem'! !

!TusLibrosTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'ml 6/26/2025 22:03:30'!
notExpiredCreditCard
	
	^CreditCard createWithExpirationMonth: GregorianMonthOfYear current next ! !

!TusLibrosTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'ml 6/26/2025 22:03:54'!
priceBook
	
	| priceBook |
	priceBook := Dictionary new.
	
	priceBook add: self itemSellByStore -> self validItemPrice.
	^priceBook ! !

!TusLibrosTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'ml 6/26/2025 22:04:23'!
validItemPrice
	
	^10! !
