!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/6/2024 16:09:16'!
aSimpleCatalog

	^Array with: self inCatalogItem.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/5/2024 20:32:06'!
createCart

	^Cart withTheStoreCatalog: self aSimpleCatalog.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/6/2024 16:09:16'!
inCatalogItem

	^'valid item'! !

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

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/6/2024 16:09:16'!
test03AfterAddingAItemToCartIsNotEmptyAnymore

	| carrito |
	
	carrito := self createCart .
	
	 carrito add: self inCatalogItem.
	self deny: carrito isEmpty! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/6/2024 16:09:16'!
test04CannotAddNonPositiveNumberOfItems

	| carrito |
	
	carrito := self createCart .
	
	self should: [ carrito add: self inCatalogItem amount: 0] 
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

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/6/2024 16:42:10'!
test06CartCanRememberAddedItems

	| carrito aItem |
	
	carrito := self createCart .
	aItem := self inCatalogItem .
	carrito add: aItem.
	
	self assert: carrito includes: aItem.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/6/2024 16:51:38'!
test07CartRemembersNumberOfAddedItems

	| carrito aItem |
	
	carrito := self createCart .
	aItem := self inCatalogItem .
	carrito add: aItem amount: 10 .
	
	self assert: (carrito occurrencesOf: aItem) = 10.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/6/2024 16:55:09'!
test08CartDoesntHoldNotAddedItem

	| carrito aItem |
	
	carrito := self createCart .
	aItem := self inCatalogItem .
	
	
	self deny: (carrito includes: aItem).! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/6/2024 20:46:54'!
test09CartCanShowItsContent

	| carrito aItem |
	
	carrito := self createCart .
	aItem := self inCatalogItem .
	carrito add: aItem amount: 10. 
	
	self assert: (aItem asString) equals: carrito showContents .! !


!classDefinition: #CheckoutTest category: #TusLibros!
TestCase subclass: #CheckoutTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CheckoutTest methodsFor: 'cart creation' stamp: 'ml 11/6/2024 20:28:49'!
aSimpleCatalog

	^Array with: self inCatalogItem1 with: self inCatalogItem2 .! !

!CheckoutTest methodsFor: 'cart creation' stamp: 'ml 11/6/2024 18:00:44'!
createCart

	^Cart withTheStoreCatalog: self aSimpleCatalog.! !

!CheckoutTest methodsFor: 'cart creation' stamp: 'ml 11/6/2024 19:58:05'!
inCatalogItem1

	^'valid item 1'! !

!CheckoutTest methodsFor: 'cart creation' stamp: 'ml 11/6/2024 20:28:26'!
inCatalogItem2

	^'valid item 2'! !

!CheckoutTest methodsFor: 'cart creation' stamp: 'ml 11/6/2024 18:01:11'!
notInCatalogItem

	^'invalid item'! !


!CheckoutTest methodsFor: 'creditCard creation' stamp: 'ml 11/7/2024 21:16:06'!
createCreditcard
	
	^ Array with: 1111222233334444 with: self today next ! !

!CheckoutTest methodsFor: 'creditCard creation' stamp: 'ml 11/7/2024 21:06:21'!
createExpiredCreditcard
	
	^ Array with: 1111222233335555 with: '6 August 2022' asDate. ! !

!CheckoutTest methodsFor: 'creditCard creation' stamp: 'ml 11/7/2024 21:16:06'!
today

	^ DateAndTime today date! !


!CheckoutTest methodsFor: 'tests' stamp: 'ml 11/11/2024 22:09:47'!
test01CannotCheckoutAnEmptyCart

	self should: [ Checkout recievesA: self createCart and: self createCreditcard] 
		raise: Error 
		withExceptionDo: [ :anException |
		self assert: Checkout invalidCartMsgError equals: anException messageText.
	]! !

!CheckoutTest methodsFor: 'tests' stamp: 'ml 11/7/2024 20:09:47'!
test02CheckoutASingleElementCart

	| carrito checkout |
	carrito := self createCart .
	carrito add: self inCatalogItem1 .
	
	checkout := Checkout knows: self createPriceList .
	checkout recievesA: carrito and: self createCreditcard .
	
	self assert: (self createPriceList at: self inCatalogItem1) equals: checkout cartProductValue.
	
	
	
! !

!CheckoutTest methodsFor: 'tests' stamp: 'ml 11/7/2024 20:14:59'!
test03CheckoutATwoElementCart

	| carrito checkout |
	carrito := self createCart .
	carrito add: self inCatalogItem1 amount: 2.
	
	checkout := Checkout knows: self createPriceList .
	checkout recievesA: carrito and: self createCreditcard .
	
	self assert: (self createPriceList at: self inCatalogItem1) * 2 equals: checkout cartProductValue.
	
	
	
! !

!CheckoutTest methodsFor: 'tests' stamp: 'ml 11/7/2024 21:10:10'!
test04CheckoutCannotUseAExpiredCreditCard

	| carrito checkout priceList expiredCreditCard |
	carrito := self createCart .
	carrito add: self inCatalogItem1 amount: 2.
	
	priceList := self createPriceList .
	checkout := Checkout knows: priceList .
	expiredCreditCard := self createExpiredCreditcard .
	
	self should: [ checkout recievesA: carrito and: expiredCreditCard .] 
		raise: Error 
		withExceptionDo: [ :anException |
		self assert: checkout expiredCreditCardMsgError equals: anException messageText.
	]
! !


!CheckoutTest methodsFor: 'priceList creation' stamp: 'ml 11/6/2024 20:01:09'!
createPriceList

	| priceList |
	priceList := Dictionary new .
	priceList at: 'valid item 1' put: 18000 * peso.
	
	^priceList ! !


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

!Cart methodsFor: 'add a item' stamp: 'ml 11/6/2024 16:33:12'!
assertAValidItem: aItemToAdd

	^ (catalog includes: aItemToAdd) ifFalse: [self error: self invalidItemMsgError]! !

!Cart methodsFor: 'add a item' stamp: 'ml 11/6/2024 16:39:45'!
assertAValidQuantity: aQuantity

	^ aQuantity > 0 ifFalse: [self error: self invalidQuantityMsgError]! !


!Cart methodsFor: 'queries' stamp: 'ml 11/6/2024 16:43:09'!
includes: anItemToCheck

	^ items includes: anItemToCheck ! !

!Cart methodsFor: 'queries' stamp: 'ml 11/6/2024 16:51:21'!
occurrencesOf: aItem 

	^items occurrencesOf: aItem .! !


!Cart methodsFor: 'show content' stamp: 'ml 11/6/2024 20:46:38'!
showContents
	
	^ items contents keys first asString. "': ', items contents values first asString, '. '."! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'creation' stamp: 'ml 11/5/2024 20:49:47'!
withTheStoreCatalog: aStoreCatalog
	
	^self new initializeAcceptingItems: aStoreCatalog.! !


!classDefinition: #Checkout category: #TusLibros!
Object subclass: #Checkout
	instanceVariableNames: 'cart creditCard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Checkout methodsFor: 'initialize' stamp: 'ml 11/11/2024 22:15:16'!
initializeWith: aCartToCheckout and: aCreditCard

	cart := aCartToCheckout .
	creditCard := aCreditCard .! !


!Checkout methodsFor: 'assertions' stamp: 'ml 11/7/2024 21:04:11'!
assertNotExpiredCreditCard: aCreditCard

	^ (self expirationDateOf: aCreditCard) < self today ifTrue: [self error: self expiredCreditCardMsgError]! !


!Checkout methodsFor: 'msg errors' stamp: 'ml 11/7/2024 21:03:25'!
expiredCreditCardMsgError

	^'Cannot use an expired credit card'.! !

!Checkout methodsFor: 'msg errors' stamp: 'ml 11/7/2024 20:06:01'!
invalidCartMsgError

	^'Cannot checkout an empty cart'.! !


!Checkout methodsFor: 'as yet unclassified' stamp: 'ml 11/6/2024 21:00:33'!
cartProductValue

	^(priceList at: (cart showContents)) * (cart occurrencesOf: cart showContents ) .! !

!Checkout methodsFor: 'as yet unclassified' stamp: 'ml 11/7/2024 20:50:43'!
expirationDateOf: aCreditCard

	^ aCreditCard second! !

!Checkout methodsFor: 'as yet unclassified' stamp: 'ml 11/7/2024 20:50:56'!
today

	^ DateAndTime today date! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Checkout class' category: #TusLibros!
Checkout class
	instanceVariableNames: ''!

!Checkout class methodsFor: 'creation' stamp: 'ml 11/11/2024 22:14:38'!
recievesA: aCartToCheckout and: aCreditCard

	self assertNotEmptyCart: aCartToCheckout.
	
	^self new initializeWith: aCartToCheckout and: aCreditCard.! !


!Checkout class methodsFor: 'assertions' stamp: 'ml 11/11/2024 22:11:35'!
assertNotEmptyCart: cartToCheckout

	^ cartToCheckout isEmpty ifTrue: [ self error: self invalidCartMsgError]! !


!Checkout class methodsFor: 'msg errors' stamp: 'ml 11/11/2024 22:15:46'!
invalidCartMsgError
	
	^'Cannot checkout an empty cart'.! !
