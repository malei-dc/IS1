!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/20/2024 21:41:50'!
setUp
	testObjectFactory := TestObjectFactory new.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/20/2024 21:42:01'!
test01NewCartIsCreatedEmpty

	self assert: testObjectFactory createCart isEmpty .! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/20/2024 21:43:49'!
test02CantAddItemsThatNotBelongToStore
	| carrito |
	carrito := testObjectFactory createCart .	
	self should: [ carrito add: testObjectFactory itemNotSellByStore ] 
		raise: Error 
		withExceptionDo: [ :anException |
		self assert: carrito invalidItemMsgError equals: anException messageText.
		self assert: true equals: carrito isEmpty.
	]! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/20/2024 21:44:24'!
test03AfterAddingAItemToCartIsNotEmptyAnymore
	| carrito |
	carrito := testObjectFactory createCart .
	carrito add: testObjectFactory itemSellByStore .
	self deny: carrito isEmpty! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/20/2024 21:45:12'!
test04CannotAddNonPositiveNumberOfItems
	| carrito |
	carrito := testObjectFactory createCart .
	self should: [ carrito add: testObjectFactory itemSellByStore amount: 0] 
		raise: Error 
		withExceptionDo: [ :anException |
			self assert: carrito invalidQuantityMsgError equals: anException messageText.
			self assert: carrito isEmpty.
	]! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/20/2024 21:45:46'!
test05CannotAddMoreThanOneNotSellByTheStore
	| carrito |
	carrito := testObjectFactory createCart .
	self should: [ carrito add: testObjectFactory itemNotSellByStore amount: 2] 
		raise: Error 
		withExceptionDo: [ :anException |
			self assert: carrito invalidItemMsgError equals: anException messageText.
			self assert: carrito isEmpty.
	]! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/20/2024 21:46:13'!
test06CartCanRememberAddedItems
	| carrito aItem |
	carrito := testObjectFactory createCart .
	aItem := testObjectFactory itemSellByStore .
	carrito add: aItem.
	self assert: carrito includes: aItem.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/20/2024 21:46:32'!
test07CartRemembersNumberOfAddedItems
	| carrito aItem |
	carrito := testObjectFactory createCart .
	aItem := testObjectFactory itemSellByStore .
	carrito add: aItem amount: 10 .
	self assert: (carrito occurrencesOf: aItem) = 10.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/20/2024 21:47:32'!
test08CartDoesntHoldNotAddedItem

	| carrito aItem |
	carrito := testObjectFactory createCart .
	aItem := testObjectFactory itemSellByStore .
	self deny: (carrito includes: aItem).! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'ml 11/21/2024 22:30:43'!
setUp
	testObjectsFactory := TestObjectFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ].! !

!CashierTest methodsFor: 'tests' stamp: 'ml 11/21/2024 21:30:01'!
test01CannotCheckoutAnEmptyCart
	| salesBook |
	salesBook := OrderedCollection new.
	
	self should: [ Cashier 
			recievesA: testObjectsFactory createCart 
			charge: self throught: testObjectsFactory createExpiredCard 
			on: testObjectsFactory today registeringOn: salesBook] 
		raise: Error 
		withExceptionDo: [ :anException |
			self assert: Cashier cartCanNotBeEmptyMsgError equals: anException messageText.
			self assert: salesBook isEmpty.
	]! !

!CashierTest methodsFor: 'tests' stamp: 'ml 11/21/2024 21:50:20'!
test02CheckoutASingleElementCart
	| carrito cashier |
	carrito := testObjectsFactory createCart .
	carrito add: testObjectsFactory itemSellByStore amount: 2.
	cashier := Cashier recievesA: carrito charge: testObjectsFactory createNotExpiredCard throught: self on: testObjectsFactory today registeringOn: OrderedCollection new.
	self assert: cashier checkout = (testObjectsFactory itemSellByStorePrice * 2)
! !

!CashierTest methodsFor: 'tests' stamp: 'ml 11/21/2024 21:50:44'!
test03CanNotCheckOutAnExpiredCreditCard
	| carrito salesBook |
	carrito := testObjectsFactory createCart .
	carrito add: testObjectsFactory itemSellByStore.
	salesBook := OrderedCollection new.
	self should: [ Cashier 
			recievesA: carrito 
			charge: testObjectsFactory createExpiredCard 
			throught: self 
			on: testObjectsFactory today 
			registeringOn: salesBook] 
		raise: Error 
		withExceptionDo: [ :anException |
			self assert: Cashier canNotUseAnExpiredCard equals: anException messageText.
			self assert: salesBook isEmpty .
	]
! !

!CashierTest methodsFor: 'tests' stamp: 'ml 11/21/2024 21:50:59'!
test04CheckoutRegistersASale

	| carrito cashier salesBook total |

	carrito := testObjectsFactory createCart.
	carrito add: testObjectsFactory itemSellByStore .
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
			recievesA: carrito 
			charge: testObjectsFactory createNotExpiredCard 
			throught: self 
			on: testObjectsFactory today 
			registeringOn: salesBook.
	total := cashier checkout .
					
	self assert: salesBook notEmpty.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'ml 11/21/2024 22:34:30'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| carrito cashier salesBook total creditCard debitedCreditCard debitedTotal |

	carrito := testObjectsFactory createCart.
	carrito add: testObjectsFactory itemSellByStore .
	salesBook := OrderedCollection new.
	creditCard := testObjectsFactory createNotExpiredCard .
	
	debitBehavior := [ :anAmount :aCreditCard | debitedTotal := anAmount. debitedCreditCard := aCreditCard ].
 
	cashier:= Cashier 
			recievesA: carrito 
			charge: creditCard 
			throught: self
			on: testObjectsFactory today 
			registeringOn: salesBook.
	total := cashier checkout .
					
	self assert: debitedCreditCard = creditCard .
	self assert: debitedTotal = total.
	self assert: salesBook notEmpty ! !

!CashierTest methodsFor: 'tests' stamp: 'ml 11/21/2024 22:28:48'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| carrito cashier salesBook creditCard|

	carrito := testObjectsFactory createCart.
	carrito add: testObjectsFactory itemSellByStore .
	salesBook := OrderedCollection new.
	creditCard := testObjectsFactory createNotExpiredCard .
	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
 
	cashier:= Cashier 
			recievesA: carrito 
			charge: creditCard 
			throught: self
			on: testObjectsFactory today 
			registeringOn: salesBook.
	
	self should: [cashier checkout]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]
	! !


!CashierTest methodsFor: 'as yet unclassified' stamp: 'ml 11/21/2024 22:29:53'!
debit: aValue from: aCreditCard
	
	^debitBehavior value: aValue value: aCreditCard .! !


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


!Cart methodsFor: 'as yet unclassified' stamp: 'ml 11/21/2024 22:38:36'!
catalog
	^ catalog .
	! !

!Cart methodsFor: 'as yet unclassified' stamp: 'ml 11/21/2024 22:44:15'!
total 

	^items sum: [ :anItem | catalog at: anItem ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'creation' stamp: 'ml 11/5/2024 20:49:47'!
withTheStoreCatalog: aStoreCatalog
	
	^self new initializeAcceptingItems: aStoreCatalog.! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart creditCard salesBook merchantProcessor total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialize' stamp: 'ml 11/21/2024 21:36:27'!
initializeWith: aCartToCheckout charge: aCreditCard  throught: aMerchantProcesor registeringOn: aSalesBook 
	cart := aCartToCheckout .
	creditCard := aCreditCard .
	salesBook:=aSalesBook.
	merchantProcessor := aMerchantProcesor .
	! !


!Cashier methodsFor: 'checkout' stamp: 'ml 11/21/2024 22:44:56'!
calculateTotal

	total := cart total.

	! !

!Cashier methodsFor: 'checkout' stamp: 'ml 11/21/2024 22:46:15'!
checkout
	self calculateTotal.
	self debitTotal .
	self createSale.
	^total! !

!Cashier methodsFor: 'checkout' stamp: 'ml 11/21/2024 22:46:15'!
createSale

	^ salesBook add: (Sale of: total)! !

!Cashier methodsFor: 'checkout' stamp: 'ml 11/21/2024 22:45:56'!
debitTotal

	^ merchantProcessor debit: total from: creditCard! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'creation' stamp: 'ml 11/21/2024 21:35:06'!
recievesA: aCartToCheckout charge: aCreditCard throught: aMerchantProcesor  on: aExpirationDate registeringOn: aSalesBook  
	self assertNotEmptyCart: aCartToCheckout.
	self assertNotExpiredCreditCard: aCreditCard on: aExpirationDate .
	^self new initializeWith: aCartToCheckout charge: aCreditCard throught: aMerchantProcesor registeringOn: aSalesBook .! !


!Cashier class methodsFor: 'assertions' stamp: 'ml 11/19/2024 14:00:28'!
assertNotEmptyCart: cartToCheckout
	^ cartToCheckout isEmpty ifTrue: [ self error: self cartCanNotBeEmptyMsgError]! !

!Cashier class methodsFor: 'assertions' stamp: 'ml 11/20/2024 21:35:25'!
assertNotExpiredCreditCard: creditCardToCharge on: aDate 
	^ (creditCardToCharge isExpiredOn: aDate ) ifTrue: [ self error: self canNotUseAnExpiredCard ]! !


!Cashier class methodsFor: 'msg errors' stamp: 'ml 11/19/2024 14:00:00'!
canNotUseAnExpiredCard
	^'Can not use an expired credit card'! !

!Cashier class methodsFor: 'msg errors' stamp: 'ml 11/19/2024 14:00:51'!
cartCanNotBeEmptyMsgError
	^'Cannot checkout an empty cart'.! !

!Cashier class methodsFor: 'msg errors' stamp: 'ml 11/21/2024 22:25:43'!
creditCardHasNoCreditErrorMessage
	^'Can not charge a credit card with no credit'.! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'as yet unclassified' stamp: 'ml 11/20/2024 22:01:11'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'ml 11/20/2024 22:00:39'!
isExpiredOn: aDate
	^ expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'ml 11/20/2024 22:01:29'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total_CHANGE_ME total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'initialization' stamp: 'ml 11/20/2024 22:34:46'!
initializeWith: atotal 
	
	total := atotal.! !


!Sale methodsFor: 'as yet unclassified' stamp: 'ml 11/20/2024 22:35:11'!
total
	
	^total.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'as yet unclassified' stamp: 'ml 11/20/2024 22:35:33'!
of: total 
	
	^self new initializeWith: total.! !


!classDefinition: #TestObjectFactory category: #TusLibros!
Object subclass: #TestObjectFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TestObjectFactory methodsFor: 'create credit card' stamp: 'ml 11/20/2024 21:55:12'!
createExpiredCard
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!TestObjectFactory methodsFor: 'create credit card' stamp: 'ml 11/20/2024 21:54:29'!
createNotExpiredCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!TestObjectFactory methodsFor: 'create cart' stamp: 'ml 11/19/2024 14:28:12'!
aSimpleCatalog
	^Dictionary new 
		at: self itemSellByStore put: self itemSellByStorePrice; 
		yourself! !

!TestObjectFactory methodsFor: 'create cart' stamp: 'ml 11/19/2024 14:12:04'!
createCart
	^Cart withTheStoreCatalog: self aSimpleCatalog.! !


!TestObjectFactory methodsFor: 'as yet unclassified' stamp: 'ml 11/20/2024 21:53:39'!
initialize 

	today := DateAndTime  now! !

!TestObjectFactory methodsFor: 'as yet unclassified' stamp: 'ml 11/20/2024 21:54:12'!
today 
	
	^today! !


!TestObjectFactory methodsFor: 'items' stamp: 'ml 11/20/2024 21:43:39'!
itemNotSellByStore
	^'invalid item'! !

!TestObjectFactory methodsFor: 'items' stamp: 'ml 11/19/2024 14:27:49'!
itemSellByStore
	^'valid item 1'! !

!TestObjectFactory methodsFor: 'items' stamp: 'ml 11/19/2024 14:27:57'!
itemSellByStorePrice
	^ (20000 * peso)! !
