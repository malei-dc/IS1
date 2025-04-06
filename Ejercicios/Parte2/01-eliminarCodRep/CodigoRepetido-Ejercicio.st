!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'assertion' stamp: 'ml 4/5/2025 14:33:28'!
assertionNumbersOfCustomers: customerAmount in: aCustomerBookToCheck
	self assert: customerAmount equals: aCustomerBookToCheck numberOfSuspendedCustomers.
	self assert: customerAmount equals: aCustomerBookToCheck numberOfCustomers.
! !

!CustomerBookTest methodsFor: 'assertion' stamp: 'ml 4/5/2025 15:19:28'!
assertionThat: aTimeToCompare isLessThan: aTimeLimit
 	
	self assert: (aTimeToCompare  < aTimeLimit) 
! !


!CustomerBookTest methodsFor: 'measure time' stamp: 'ml 4/5/2025 15:18:56'!
measureRunTimeOf: aBlockToMeasure
	
	| millisecondsAfterRunning millisecondsBeforeRunning |
	
	millisecondsBeforeRunning :=  Time millisecondClockValue * millisecond.
	aBlockToMeasure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^ millisecondsAfterRunning - millisecondsBeforeRunning! !

!CustomerBookTest methodsFor: 'measure time' stamp: 'ml 4/5/2025 14:19:43'!
measureTimeOf: aBlockToMeasure andAssertLessThan: aTimeLimit
	| measuredTime |
	measuredTime := self measureRunTimeOf: aBlockToMeasure .
		
	self assertionThat: measuredTime isLessThan: (aTimeLimit)
! !


!CustomerBookTest methodsFor: 'testing' stamp: 'ml 4/5/2025 15:20:43'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook |
	customerBook := CustomerBook new.
	self measureTimeOf: [customerBook addCustomerNamed: 'John Lennon'.] andAssertLessThan: (50 * millisecond).	
	"
	millisecondsBeforeRunning :=  Time millisecondClockValue * millisecond.
	customerBook addCustomerNamed: 'John Lennon'.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning - millisecondsBeforeRunning < (50 * millisecond)) 
	"! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 4/5/2025 15:21:19'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| customerBook paulMcCartney |
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	self measureTimeOf:  [customerBook removeCustomerNamed: paulMcCartney.] andAssertLessThan:	 (100 * millisecond).
	
	"
	millisecondsBeforeRunning :=  Time millisecondClockValue * millisecond.
	customerBook removeCustomerNamed: paulMcCartney.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning - millisecondsBeforeRunning < (100 * millisecond)) 
	"
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 4/5/2025 14:26:33'!
test03CanNotAddACustomerWithEmptyName 
	| customerBook |
	customerBook := CustomerBook new.
	self ensure: [ customerBook addCustomerNamed: ''.]  
	shouldRaise: Error  
	withTheseAssertions: 	[ | anError |
		self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
		self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 4/5/2025 14:26:05'!
test04CanNotRemoveAnInvalidCustomer
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	self ensure: [ customerBook removeCustomerNamed: 'Paul McCartney'.]  
		shouldRaise: NotFound   
		withTheseAssertions: 	[
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 4/5/2025 15:24:59'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	| customerBook paulMcCartney|
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	
	self assertionNumbersOfCustomers: 1 in: customerBook .
	"
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	"
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 4/5/2025 15:24:43'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	| customerBook paulMcCartney|
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	
	self assertionNumbersOfCustomers: 0 in: customerBook .
	"
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	"
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 4/5/2025 14:25:43'!
test07CanNotSuspendAnInvalidCustomer

	| customerBook johnLennon |
	
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	self ensure: [ customerBook suspendCustomerNamed: 'George Harrison'.]  
		shouldRaise: CantSuspend 
		withTheseAssertions: [
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 4/5/2025 14:25:43'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	| customerBook johnLennon |
	
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self ensure: [ customerBook suspendCustomerNamed: johnLennon.] 
		shouldRaise:  CantSuspend  
		withTheseAssertions: [
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !


!CustomerBookTest methodsFor: 'error handlers' stamp: 'ml 4/5/2025 14:25:43'!
ensure: aFailingBlock shouldRaise: anErrorType withTheseAssertions: assertions

	[ aFailingBlock value.
	self fail ]
		on: anErrorType
		do: [ :anError | assertions]! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'ml 4/5/2025 14:24:22'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'ml 4/5/2025 14:24:14'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'ml 4/5/2025 14:24:10'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'ml 4/5/2025 14:24:05'!
numberOfSuspendedCustomers

	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'ml 4/5/2025 15:17:09'!
removeCustomerNamed: aName 

	active remove: aName ifAbsent: [
		suspended remove: aName ifAbsent: [
				^ NotFound signal.
			]
		]
	
	"1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal."! !

!CustomerBook methodsFor: 'customer management' stamp: 'ml 4/5/2025 14:23:44'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'ml 4/5/2025 14:23:48'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'ml 4/5/2025 14:23:54'!
suspendCustomerNamed: aName

	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:52'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:56'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
