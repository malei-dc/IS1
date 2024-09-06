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

!CustomerBookTest methodsFor: 'testsAbstractions' stamp: 'ml 9/6/2024 12:52:45'!
createCustomerBookAndSunspendCustomerNamed: name
	| customerBook  |
	customerBook := CustomerBook new.
	
	customerBook addCustomerNamed: name.
	customerBook suspendCustomerNamed: name.
	
	^customerBook .
! !

!CustomerBookTest methodsFor: 'testsAbstractions' stamp: 'ml 9/6/2024 00:25:47'!
createNewEmptyCustomerBook
	
	| customerBook |
	customerBook := CustomerBook new.
	^customerBook 
! !

!CustomerBookTest methodsFor: 'testsAbstractions' stamp: 'ml 9/6/2024 13:53:36'!
ensureCannotRemoveAn: invalidCustomer on: customerBook thatIncludesOnly: validCustomer
	
	[ customerBook removeCustomerNamed: invalidCustomer .
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: validCustomer ) ]! !

!CustomerBookTest methodsFor: 'testsAbstractions' stamp: 'ml 9/6/2024 14:02:17'!
ensureCannotSuspend: invalidCustomer on: customerBook thatIncludes: validCustomer
	
	[ customerBook suspendCustomerNamed: invalidCustomer .
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: validCustomer ) ]! !

!CustomerBookTest methodsFor: 'testsAbstractions' stamp: 'ml 9/6/2024 13:34:31'!
ensureCustomerNameCannotBeEmptyOn: customerBook.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testsAbstractions' stamp: 'ml 9/6/2024 13:04:17'!
ensureNotRemoveCustomer: name From: customerBook
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: name).! !

!CustomerBookTest methodsFor: 'testsAbstractions' stamp: 'ml 9/6/2024 13:06:10'!
ensureRemoveCustomer: name From: customerBook
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: name).! !

!CustomerBookTest methodsFor: 'testsAbstractions' stamp: 'ml 9/6/2024 00:15:13'!
lookIf: ablockToMeasure endsBefore: timeLimit
	
	| millisecondsAfterRunning millisecondsBeforeRunning |
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	ablockToMeasure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (timeLimit)
	

	
	! !


!CustomerBookTest methodsFor: 'testing' stamp: 'ml 9/6/2024 00:30:34'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	customerBook := self createNewEmptyCustomerBook .
	
	^self 	lookIf:  [customerBook addCustomerNamed: 'John Lennon'] endsBefore: 50*millisecond.


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 9/6/2024 00:35:18'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := self createNewEmptyCustomerBook.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	
	^self 	lookIf:  [customerBook removeCustomerNamed: paulMcCartney.] endsBefore: 100*millisecond.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 9/6/2024 14:15:29'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := self createNewEmptyCustomerBook .
	
	self ensureCustomerNameCannotBeEmptyOn: customerBook.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 9/6/2024 14:15:42'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := self createNewEmptyCustomerBook .
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self ensureCannotRemoveAn: 'Paul McCartney' on: customerBook thatIncludesOnly: johnLennon.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 9/6/2024 13:04:48'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookAndSunspendCustomerNamed: paulMcCartney .
	
	self ensureNotRemoveCustomer: paulMcCartney From: customerBook.
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 9/6/2024 13:06:49'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookAndSunspendCustomerNamed: paulMcCartney .
	
	customerBook removeCustomerNamed: paulMcCartney.
	self  ensureRemoveCustomer: paulMcCartney From: customerBook .


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 9/6/2024 14:13:23'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := self createNewEmptyCustomerBook .
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self ensureCannotSuspend: 'George Harrison' on: customerBook thatIncludes: johnLennon.

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 9/6/2024 14:13:06'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := self createNewEmptyCustomerBook .
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self ensureCannotSuspend: johnLennon on: customerBook thatIncludes: johnLennon .
	! !


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


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
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
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
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
