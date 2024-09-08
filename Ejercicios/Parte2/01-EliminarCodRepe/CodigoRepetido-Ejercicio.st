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

!CustomerBookTest methodsFor: 'testsAbstractions' stamp: 'ml 9/7/2024 21:58:05'!
thisMessage: invalidOperationBlock shouldTrigger: anErrorType withThisAssertion: errorHandler
	
	[ invalidOperationBlock value.
	self fail ]
		on: anErrorType 
		do: [ errorHandler ]
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

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 9/7/2024 21:58:05'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := self createNewEmptyCustomerBook .
	
	self thisMessage: [ customerBook addCustomerNamed: ''] 
	shouldTrigger: Error 
	withThisAssertion: [ :anError | 
		self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
		self assert: customerBook isEmpty 
		]

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 9/7/2024 21:58:05'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := self createNewEmptyCustomerBook .
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self thisMessage: [ customerBook removeCustomerNamed: 'Paul McCartney'] 
	shouldTrigger: NotFound 
	withThisAssertion: [ :anError | 
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: johnLennon ) 
		]! !

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

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 9/7/2024 22:32:55'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := self createNewEmptyCustomerBook .
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self thisMessage: [ customerBook suspendCustomerNamed:  'George Harrison'] 
	shouldTrigger: CantSuspend 
	withThisAssertion: [ :anError | 
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: johnLennon ) 
		]

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ml 9/7/2024 22:06:24'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := self createNewEmptyCustomerBook .
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self thisMessage: [ customerBook suspendCustomerNamed:  johnLennon.] 
	shouldTrigger: CantSuspend 
	withThisAssertion:  [ :anError | 
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: johnLennon )
		]
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

!CustomerBook methodsFor: 'customer management' stamp: 'ml 9/7/2024 22:27:52'!
removeAndReturn: aName in: aCollection orKeepDoing: blockUntilReturn
 
	1 to: aCollection size do: 
	[ :index |
		aName = (aCollection at: index)
			ifTrue: [
				aCollection removeAt: index.
				^ aName 
			] 
	].
	blockUntilReturn value.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'ml 9/7/2024 22:28:58'!
removeCustomerNamed: aName 

	self removeAndReturn: aName in: active  
	orKeepDoing: [ 
		self removeAndReturn: aName in: suspended 
		orKeepDoing: [^ NotFound signal.] 
		]
 	
	
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
