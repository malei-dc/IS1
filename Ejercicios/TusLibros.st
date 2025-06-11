!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'ML 6/10/2025 21:54:01'!
test01createNewCartShouldBeEmpty

	self assert: Cart new isEmpty equals: true.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ML 6/10/2025 22:02:41'!
test02CartWithABookAddedShouldNotBeEmptyAnymore! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ML 6/10/2025 22:03:35'!
test03CartCanOnlyAddBooksFromTheCatalog! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'as yet unclassified' stamp: 'ML 6/10/2025 21:54:39'!
isEmpty
	
	^true.! !
