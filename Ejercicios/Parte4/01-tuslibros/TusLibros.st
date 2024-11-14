!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/14/2024 20:08:21'!
aSimpleCatalog

	^Dictionary new 
		at: self itemSellByStore put: self itemSellByStorePrice; 
		yourself! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/5/2024 20:32:06'!
createCart

	^Cart withTheStoreCatalog: self aSimpleCatalog.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/14/2024 20:09:01'!
itemSellByStore

	^'valid item 1'! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/14/2024 20:09:21'!
itemSellByStorePrice

	^ (20000 * peso)! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/6/2024 16:58:56'!
notInCatalogItem

	^'invalid item'! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/5/2024 20:28:07'!
test01NewCartIsCreatedEmpty

	self assert: self createCart isEmpty .! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/6/2024 16:09:30'!
test02CantAddItemsThatNotBelongToStore

	| carrito |
	
	carrito := self createCart .
	
	self should: [ carrito add: self notInCatalogItem] 
		raise: Error 
		withExceptionDo: [ :anException |
		self assert: carrito invalidItemMsgError equals: anException messageText.
		self assert: true equals: carrito isEmpty.
	]! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/14/2024 20:10:28'!
test03AfterAddingAItemToCartIsNotEmptyAnymore

	| carrito |
	
	carrito := self createCart .
	
	 carrito add: self itemSellByStore .
	self deny: carrito isEmpty! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/14/2024 20:12:06'!
test04CannotAddNonPositiveNumberOfItems

	| carrito |
	
	carrito := self createCart .
	
	self should: [ carrito add: self itemSellByStore amount: 0] 
		raise: Error 
		withExceptionDo: [ :anException |
		self assert: carrito invalidQuantityMsgError equals: anException messageText.
		self assert: carrito isEmpty.
	]! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/6/2024 16:09:30'!
test05CannotAddMoreThanOneNotSellByTheStore

	| carrito |
	
	carrito := self createCart .
	
	self should: [ carrito add: self notInCatalogItem amount: 2] 
		raise: Error 
		withExceptionDo: [ :anException |
		self assert: carrito invalidItemMsgError equals: anException messageText.
		self assert: carrito isEmpty.
	]! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/14/2024 20:12:22'!
test06CartCanRememberAddedItems

	| carrito aItem |
	
	carrito := self createCart .
	aItem := self itemSellByStore .
	carrito add: aItem.
	
	self assert: carrito includes: aItem.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/14/2024 20:12:32'!
test07CartRemembersNumberOfAddedItems

	| carrito aItem |
	
	carrito := self createCart .
	aItem := self itemSellByStore .
	carrito add: aItem amount: 10 .
	
	self assert: (carrito occurrencesOf: aItem) = 10.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/14/2024 20:12:43'!
test08CartDoesntHoldNotAddedItem

	| carrito aItem |
	
	carrito := self createCart .
	aItem := self itemSellByStore .
	
	
	self deny: (carrito includes: aItem).! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'ml 11/14/2024 20:26:56'!
setUp

	testObjectsFactory := TestObjectFactory new.! !

!CashierTest methodsFor: 'tests' stamp: 'ml 11/14/2024 20:41:17'!
test01CannotCheckoutAnEmptyCart

	self should: [ Cashier recievesA: testObjectsFactory createCart charge: testObjectsFactory createExpiredCard] 
		raise: Error 
		withExceptionDo: [ :anException |
		self assert: Cashier cartCanNotBeEmptyMsgError equals: anException messageText.
	]! !

!CashierTest methodsFor: 'tests' stamp: 'ml 11/14/2024 20:41:37'!
test02CheckoutASingleElementCart

	| carrito cashier |
	carrito := testObjectsFactory createCart .
	carrito add: testObjectsFactory itemSellByStore amount: 2.
	
	cashier := Cashier recievesA: carrito charge: testObjectsFactory createExpiredCard .
	
	self assert: cashier checkout = (testObjectsFactory itemSellByStorePrice * 2)
	
	
	
! !

!CashierTest methodsFor: 'tests' stamp: 'ml 11/14/2024 20:42:23'!
test03CanNotCheckOutAnExpiredCreditCard

	| carrito |
	carrito := testObjectsFactory createCart .
	carrito add: testObjectsFactory itemSellByStore amount: 2.

	self should: [ Cashier recievesA: testObjectsFactory createCart charge: testObjectsFactory createExpiredCard ] 
		raise: Error 
		withExceptionDo: [ :anException |
		self assert: Cashier canNotUseAnExpiredCard equals: anException messageText.
	]
	
! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error msgs' stamp: 'ml 11/5/2024 21:38:29'!
invalidItemMsgError

	^'This item is not in the catalog'! !

!Cart methodsFor: 'error msgs' stamp: 'ml 11/5/2024 21:39:59'!
invalidQuantityMsgError
	
	^ 'only can add a positive number of occurrences'! !


!Cart methodsFor: 'is empty' stamp: 'ml 11/5/2024 20:59:46'!
isEmpty
	
	^items isEmpty .! !


!Cart methodsFor: 'initialization' stamp: 'ml 11/5/2024 21:27:52'!
initializeAcceptingItems: aStoreCatalog 

	catalog := aStoreCatalog.
	items := Bag new.! !


!Cart methodsFor: 'add a item' stamp: 'ml 11/6/2024 16:29:18'!
add: aItemToAdd

	^self add: aItemToAdd amount: 1.

	"(catalog includes: aItemToAdd) ifTrue: [items add: aItemToAdd] ifFalse: [self error: self invalidItemMsgError]."! !

!Cart methodsFor: 'add a item' stamp: 'ml 11/6/2024 16:33:19'!
add: aItemToAdd amount: aQuantity

	self assertAValidItem: aItemToAdd.
	self assertAValidQuantity: aQuantity.

	items add: aItemToAdd withOccurrences: aQuantity .
	! !

!Cart methodsFor: 'add a item' stamp: 'ml 11/14/2024 20:11:37'!
assertAValidItem: aItemToAdd

	^ (catalog includesKey: aItemToAdd) ifFalse: [self error: self invalidItemMsgError]! !

!Cart methodsFor: 'add a item' stamp: 'ml 11/6/2024 16:39:45'!
assertAValidQuantity: aQuantity

	^ aQuantity > 0 ifFalse: [self error: self invalidQuantityMsgError]! !


!Cart methodsFor: 'queries' stamp: 'ml 11/6/2024 16:43:09'!
includes: anItemToCheck

	^ items includes: anItemToCheck ! !

!Cart methodsFor: 'queries' stamp: 'ml 11/6/2024 16:51:21'!
occurrencesOf: aItem 

	^items occurrencesOf: aItem .! !



!Cart methodsFor: 'as yet unclassified' stamp: 'ml 11/14/2024 20:16:31'!
catalog

	^ catalog .

	! !

!Cart methodsFor: 'as yet unclassified' stamp: 'ml 11/14/2024 20:17:53'!
itemsDo: aBlock 
	
	^items do: aBlock ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'creation' stamp: 'ml 11/5/2024 20:49:47'!
withTheStoreCatalog: aStoreCatalog
	
	^self new initializeAcceptingItems: aStoreCatalog.! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart creditCard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialize' stamp: 'ml 11/14/2024 20:39:18'!
initializeWith: aCartToCheckout charge: aCreditCard

	cart := aCartToCheckout .
	creditCard := aCreditCard .
	! !


!Cashier methodsFor: 'checkout' stamp: 'ml 11/14/2024 20:14:55'!
checkout

	| priceList total |
	
	priceList := cart catalog.
	total := 0.
	cart itemsDo: [ :anItem | total := total + (priceList at: anItem)].
	
	^total! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'creation' stamp: 'ml 11/14/2024 20:43:45'!
recievesA: aCartToCheckout charge: aCreditCard

	self assertNotEmptyCart: aCartToCheckout.
	self assertNotExpiredCreditCard: aCreditCard .
	
	^self new initializeWith: aCartToCheckout charge: aCreditCard .! !


!Cashier class methodsFor: 'assertions' stamp: 'ml 11/14/2024 20:00:14'!
assertNotEmptyCart: cartToCheckout

	^ cartToCheckout isEmpty ifTrue: [ self error: self cartCanNotBeEmptyMsgError]! !

!Cashier class methodsFor: 'assertions' stamp: 'ml 11/14/2024 20:45:16'!
assertNotExpiredCreditCard: creditCardToCharge

	^ creditCardToCharge isExpired ifTrue: [ self error: self canNotUseAnExpiredCard ]! !


!Cashier class methodsFor: 'msg errors' stamp: 'ml 11/14/2024 20:33:49'!
canNotUseAnExpiredCard

	^'Can not use an expired credit card'! !

!Cashier class methodsFor: 'msg errors' stamp: 'ml 11/14/2024 20:00:14'!
cartCanNotBeEmptyMsgError
	
	^'Cannot checkout an empty cart'.! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'as yet unclassified' stamp: 'ml 11/14/2024 20:36:46'!
isExpired

	^ true.! !


!classDefinition: #TestObjectFactory category: #TusLibros!
Object subclass: #TestObjectFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TestObjectFactory methodsFor: 'as yet unclassified' stamp: 'ml 11/14/2024 20:25:43'!
aSimpleCatalog

	^Dictionary new 
		at: self itemSellByStore put: self itemSellByStorePrice; 
		yourself! !

!TestObjectFactory methodsFor: 'as yet unclassified' stamp: 'ml 11/14/2024 20:25:51'!
createCart

	^Cart withTheStoreCatalog: self aSimpleCatalog.! !

!TestObjectFactory methodsFor: 'as yet unclassified' stamp: 'ml 11/14/2024 20:36:17'!
createExpiredCard

	^ CreditCard new.! !

!TestObjectFactory methodsFor: 'as yet unclassified' stamp: 'ml 11/14/2024 20:25:59'!
itemSellByStore

	^'valid item 1'! !

!TestObjectFactory methodsFor: 'as yet unclassified' stamp: 'ml 11/14/2024 20:26:06'!
itemSellByStorePrice

	^ (20000 * peso)! !
