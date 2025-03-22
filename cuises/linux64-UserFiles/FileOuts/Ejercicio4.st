!classDefinition: #I category: #Ejercicio4!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #Ejercicio4!
I class
	instanceVariableNames: ''!

!I class methodsFor: '-- all --' stamp: 'ml 3/21/2025 21:18:28'!
+ anAdder

	^anAdder next! !

!I class methodsFor: '-- all --' stamp: 'ml 3/21/2025 21:08:17'!
next

	^II! !

!I class methodsFor: '-- all --' stamp: 'ml 3/21/2025 21:10:28'!
previous

	self error: 'El 1 es el primer numero natural'! !


!classDefinition: #II category: #Ejercicio4!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #Ejercicio4!
II class
	instanceVariableNames: ''!

!II class methodsFor: 'as yet unclassified' stamp: 'ml 3/21/2025 21:45:25'!
next
	^self createChildNamed: self name, 'I'.! !


!II class methodsFor: '-- all --' stamp: 'ml 3/21/2025 21:39:28'!
+ anAdder
	^self previous + anAdder next! !

!II class methodsFor: 'as yet unclassified' stamp: 'ml 3/21/2025 21:45:25'!
next
	^self createChildNamed: self name, 'I'.! !

!II class methodsFor: '-- all --' stamp: 'ml 3/21/2025 21:15:36'!
previous
	^I! !


!classDefinition: #III category: #Ejercicio4!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio4'!


!classDefinition: #IIII category: #Ejercicio4!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio4'!


!classDefinition: #IIIII category: #Ejercicio4!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio4'!


!classDefinition: #IIIIII category: #Ejercicio4!
IIIII subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio4'!
