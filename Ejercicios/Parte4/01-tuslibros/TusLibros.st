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

!CartTest methodsFor: 'as yet unclassified' stamp: 'ml 11/6/2024 17:27:05'!
test09CartCanShowItsContent

	| carrito aItem |
	
	carrito := self createCart .
	aItem := self inCatalogItem .
	carrito add: aItem amount: 10. 
	
	self assert: (aItem asString, ': ', 10 asString, '. ') equals: carrito showContents .! !


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


!Cart methodsFor: 'show content' stamp: 'ml 11/6/2024 17:46:06'!
showContents
	
	^ items contents keys first asString, ': ', items contents values first asString, '. '.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'creation' stamp: 'ml 11/5/2024 20:49:47'!
withTheStoreCatalog: aStoreCatalog
	
	^self new initializeAcceptingItems: aStoreCatalog.! !
