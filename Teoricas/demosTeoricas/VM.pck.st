'From Cuis 5.0 [latest update: #4384] on 6 November 2020 at 6:21:32 pm'!
'Description '!
!provides: 'VM' 1 0!
SystemOrganization addCategory: 'VM'!


!classDefinition: #VMTest category: 'VM'!
TestCase subclass: #VMTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'VM'!
!classDefinition: 'VMTest class' category: 'VM'!
VMTest class
	instanceVariableNames: ''!

!classDefinition: #ClassA category: 'VM'!
Object subclass: #ClassA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'VM'!
!classDefinition: 'ClassA class' category: 'VM'!
ClassA class
	instanceVariableNames: ''!

!classDefinition: #ClassB category: 'VM'!
ClassA subclass: #ClassB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'VM'!
!classDefinition: 'ClassB class' category: 'VM'!
ClassB class
	instanceVariableNames: ''!

!classDefinition: #VM category: 'VM'!
Object subclass: #VM
	instanceVariableNames: 'doesNotUnderstandSelector'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'VM'!
!classDefinition: 'VM class' category: 'VM'!
VM class
	instanceVariableNames: ''!


!VMTest methodsFor: 'normal message send tests' stamp: 'HAW 11/6/2020 16:29:41'!
test01ReturnsMethodInReceiversClass_WhenMessageIsImplementedInReceiversClass

	| vm foundMethod receiver selectorToLookFor |
	
	vm := VM usingDefaultDoesNotUnderstandSelector.
	
	receiver := ClassA new.
	selectorToLookFor := #implementedMessage.
	
	foundMethod := vm methodFor: selectorToLookFor whenSendingTo: receiver.
	
	self assert: foundMethod == (ClassA compiledMethodAt: selectorToLookFor)
	! !

!VMTest methodsFor: 'normal message send tests' stamp: 'HAW 11/6/2020 18:18:55'!
test02ReturnsMethodInReceiversSuperclass_WhenMessageIsImplementedInReceiversSuperclass

	| vm foundMethod receiver selectorToLookFor |
	
	vm := VM usingDefaultDoesNotUnderstandSelector.
	
	receiver := ClassB new.
	selectorToLookFor := #implementedInSuperclass.
	
	foundMethod := vm methodFor: selectorToLookFor whenSendingTo: receiver.
	
	self assert: foundMethod == (ClassA compiledMethodAt: selectorToLookFor)
	! !

!VMTest methodsFor: 'normal message send tests' stamp: 'HAW 11/6/2020 18:18:59'!
test03ReturnsMethodInAnyReceiversSuperclass_WhenMessageIsImplementedInReceiversClassHierarchy

	| vm foundMethod receiver selectorToLookFor |
	
	vm := VM usingDefaultDoesNotUnderstandSelector.
	
	receiver := ClassB new.
	selectorToLookFor := #printString.
	
	foundMethod := vm methodFor: selectorToLookFor whenSendingTo: receiver.
	
	self assert: foundMethod == (Object compiledMethodAt: selectorToLookFor)
	! !

!VMTest methodsFor: 'doesNotUnderstand tests' stamp: 'HAW 11/6/2020 18:19:03'!
test04ReturnsDoesNotUnderstandMethod_WhenMessageNotImplementedInReceiversClassHierarchy

	| vm foundMethod receiver selectorToLookFor |
	
	vm := VM usingDefaultDoesNotUnderstandSelector.
	
	receiver := ClassA new.
	selectorToLookFor := #_not_implemented_message.
	
	foundMethod := vm methodFor: selectorToLookFor whenSendingTo: receiver.
	
	self assert: foundMethod == (Object compiledMethodAt: VM defaultDoesNotUnderstandSelector)
	! !

!VMTest methodsFor: 'doesNotUnderstand tests' stamp: 'HAW 11/6/2020 18:19:07'!
test05ReturnsReceiversDoesNotUnderstandMethod_WhenMessageNotImplementedInReceiversClassHierarchy_ButDoesNotUnderstandImplementedInReceiversClass

	| vm foundMethod receiver selectorToLookFor |
	
	vm := VM usingDefaultDoesNotUnderstandSelector.
	
	receiver := ClassB new.
	selectorToLookFor := #_not_implemented_message.
	
	foundMethod := vm methodFor: selectorToLookFor whenSendingTo: receiver.
	
	self assert: foundMethod == (ClassB compiledMethodAt: #doesNotUnderstand:)
	! !

!VMTest methodsFor: 'doesNotUnderstand tests' stamp: 'HAW 11/6/2020 18:19:11'!
test06SignalsError_WhenDoesNotUnderstandMessageIsNotImplementedInHierarchy

	| vm receiver selectorToLookFor |
	
	vm := VM usingAsDoesNotUnderstandSelector: #notImplemementedDoesNotUnderstand:.
	receiver := ClassB new.
	selectorToLookFor := #_not_implemented_message.
	
	self 
		should: [ vm methodFor: selectorToLookFor whenSendingTo: receiver ]
		raise: Error
		withMessageText: VM doesNotUnderstandNotFoundErrorDescription.
	! !

!VMTest methodsFor: 'super message send tests' stamp: 'HAW 11/6/2020 18:19:17'!
test07ReturnsMethodInAnyMethodsClassSuperclass_WhenMessageSendToSuper

	| vm foundMethod selectorToLookFor |
	
	vm := VM usingDefaultDoesNotUnderstandSelector.
	selectorToLookFor := #implementedMessage.
	
	foundMethod := vm 
		methodFor: selectorToLookFor 
		whenSendingToSuperInMethod: (ClassB compiledMethodAt: selectorToLookFor).
	
	self assert: foundMethod == (ClassA compiledMethodAt: selectorToLookFor )
	! !

!VMTest methodsFor: 'super message send tests' stamp: 'HAW 11/6/2020 18:19:21'!
test08ReturnsSameMethod_WhenSendingImplementedMessageToSuperFromProtoObject

	| vm foundMethod selectorToLookFor |
	
	vm := VM usingDefaultDoesNotUnderstandSelector.
	selectorToLookFor := #methodSendingSameMessageToSuper.
	
	foundMethod := vm 
		methodFor: selectorToLookFor 
		whenSendingToSuperInMethod: (ProtoObject compiledMethodAt: selectorToLookFor).
	
	self assert: foundMethod == (ProtoObject compiledMethodAt: selectorToLookFor)
	! !

!VMTest methodsFor: 'super message send tests' stamp: 'HAW 11/6/2020 18:19:26'!
test09ReturnsDoesNotUnderstand_WhenSendingNotImplementedMessageToSuperFromProtoObject

	| vm foundMethod selectorToLookFor |
	
	vm := VM usingDefaultDoesNotUnderstandSelector.
	selectorToLookFor := #m1.
	
	foundMethod := vm 
		methodFor: selectorToLookFor 
		whenSendingToSuperInMethod: (ProtoObject compiledMethodAt: #methodSendingNotImplementedMessageToSuper).
	
	self assert: foundMethod == (ProtoObject compiledMethodAt: VM defaultDoesNotUnderstandSelector)
	! !

!ClassA methodsFor: 'messages for testing' stamp: 'HAW 11/6/2020 16:31:56'!
implementedInSuperclass

	^self ! !

!ClassA methodsFor: 'messages for testing' stamp: 'HAW 11/6/2020 16:26:29'!
implementedMessage

	^self ! !

!ClassB methodsFor: 'messages for testing' stamp: 'HAW 11/5/2020 17:47:23'!
doesNotUnderstand: aMessage

	! !

!ClassB methodsFor: 'messages for testing' stamp: 'HAW 11/6/2020 16:26:29'!
implementedMessage

	self m3.
	super implementedMessage! !

!VM methodsFor: 'initialization' stamp: 'HAW 11/6/2020 16:12:37'!
initializeUsingAsDoesNotUnderstandSelector: aDoesNotUnderstandSelector

	doesNotUnderstandSelector := aDoesNotUnderstandSelector ! !

!VM methodsFor: 'method lookup' stamp: 'HAW 11/6/2020 16:16:27'!
methodFor: aSelector whenSendingTo: aReceiver

	^self methodFor: aSelector startingFrom: aReceiver class! !

!VM methodsFor: 'method lookup' stamp: 'HAW 11/6/2020 16:14:37'!
methodFor: aSelector whenSendingToSuperInMethod: aCompiledMethod 
	
	| lookupClass |
	
	lookupClass := aCompiledMethod methodClass superclass 
		ifNil: [ aCompiledMethod methodClass ] 
		ifNotNil: [ :aClass | aClass ].
	
	^self 
		methodFor: aSelector 
		startingFrom: lookupClass
		! !

!VM methodsFor: 'method lookup - private' stamp: 'HAW 11/6/2020 16:14:37'!
methodFor: aSelector startingFrom: aClass 

	| method lookupClass |
	
	lookupClass := aClass.
	
	[ method := lookupClass compiledMethodAt: aSelector ifAbsent: [ nil ].
	method ifNil: [ lookupClass := lookupClass superclass ] ifNotNil: [ ^method ].
	lookupClass notNil ] whileTrue.
	
	aSelector = doesNotUnderstandSelector ifTrue: [ self error: self class doesNotUnderstandNotFoundErrorDescription ].
	
	^self methodFor: doesNotUnderstandSelector startingFrom: aClass ! !

!VM class methodsFor: 'defaults' stamp: 'HAW 11/5/2020 18:06:23'!
doesNotUnderstandNotFoundErrorDescription
	
	^'doesNotUndertand: not found'! !

!VM class methodsFor: 'instance creation' stamp: 'HAW 11/6/2020 16:12:00'!
defaultDoesNotUnderstandSelector

	^#doesNotUnderstand:! !

!VM class methodsFor: 'instance creation' stamp: 'HAW 11/6/2020 16:12:20'!
usingAsDoesNotUnderstandSelector: aDoesNotUnderstandSelector

	^self new initializeUsingAsDoesNotUnderstandSelector: aDoesNotUnderstandSelector
! !

!VM class methodsFor: 'instance creation' stamp: 'HAW 11/6/2020 16:11:48'!
usingDefaultDoesNotUnderstandSelector

	^self usingAsDoesNotUnderstandSelector: self defaultDoesNotUnderstandSelector! !

!ProtoObject methodsFor: '*VM' stamp: 'HAW 11/6/2020 16:04:16'!
methodSendingNotImplementedMessageToSuper

	^super m1 ! !

!ProtoObject methodsFor: '*VM' stamp: 'HAW 11/6/2020 16:03:39'!
methodSendingSameMessageToSuper

	^super methodSendingSameMessageToSuper! !
