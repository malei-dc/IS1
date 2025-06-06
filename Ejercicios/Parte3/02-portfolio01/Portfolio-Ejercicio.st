!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ml 6/4/2025 21:37:19'!
test01newPortfolioShouldHaveBalanceZero

	self assert: 0 equals: (Portfolio new) balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ml 6/5/2025 22:35:32'!
test02addingAnAccountShouldAffectPortfolioBalance

	| portfolio account |
	portfolio:= Portfolio new.
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
	"preguntar por qué no asi (en comparacion que con with: en la resolución) de paso preguntar 
	add: anAccount;
	yourself"
	portfolio add: account .
	
	self assert: 100 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ml 6/5/2025 15:18:28'!
test03addingTwoAccountShouldAffectPortfolioBalance

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ml 6/5/2025 03:06:45'!
test04anEmptyPortfolioShouldNotRegisterAnyTransaction

	
	self deny: (Portfolio new hasRegistered: (Deposit for: 50)).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ml 6/4/2025 22:34:49'!
test05aPortfolioWithAnTransactionInSingleAccountShouldBeRegistered

	| portfolio account deposit |
	portfolio:= Portfolio new.
	
	account  := ReceptiveAccount new.
	deposit := Deposit register: 50 on: account.
	portfolio add: account.
	
	
	self assert: true equals: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ml 6/4/2025 22:35:09'!
test06aPortfolioWithMultipleTransactionInSingleAccountShouldBeRegistered

	| portfolio account deposit withdraw |
	portfolio:= Portfolio new.
	
	account  := ReceptiveAccount new.
	deposit := Deposit register: 50 on: account.
	withdraw:= Withdraw register: 10 on: account.
	portfolio add: account.
	
	
	self assert: true equals: (portfolio hasRegistered: deposit).
	self assert: true equals: (portfolio hasRegistered: withdraw).
	self assert: 40 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ml 6/5/2025 22:34:11'!
test07aPortfolioWithTransactionsInMultipleAccountShouldBeRegistered
"esto esta mal, no es recursivo"
	| portfolio account deposit withdraw account2 |
	portfolio:= Portfolio new.
	
	account  := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	deposit := Deposit register: 50 on: account.
	withdraw:= Deposit register: 10 on: account2.
	portfolio add: account.
	portfolio add: account2 .
	
	
	self assert: true equals: (portfolio hasRegistered: deposit).
	self assert: true equals: (portfolio hasRegistered: withdraw).
	self assert: 60 equals: portfolio balance.! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:07:53'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LG 5/30/2025 21:51:10'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:08:01'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ml 6/4/2025 21:13:25'!
test04WithdrawValueMustBePositive 
	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ml 6/5/2025 03:19:33'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:08:26'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:08:12'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!


!AccountTransaction methodsFor: 'balance' stamp: 'LG 5/30/2025 21:14:24'!
affectBalance: currentBalance

	self subclassResponsibility! !

!AccountTransaction methodsFor: 'balance' stamp: 'ml 6/4/2025 21:15:21'!
value

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'ml 6/4/2025 21:15:39'!
value 

	^value! !


!Deposit methodsFor: 'balance' stamp: 'ml 6/4/2025 21:12:45'!
affectBalance: currentBalance
	
	 ^ currentBalance + value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'ml 6/4/2025 21:15:34'!
value 

	^value! !


!Withdraw methodsFor: 'balance' stamp: 'LG 5/30/2025 21:14:00'!
affectBalance: currentBalance 
	
	^currentBalance - value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ml 6/4/2025 21:22:22'!
add: anAccountToAdd 

	accounts add: anAccountToAdd .! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ml 6/5/2025 03:16:20'!
balance

	^accounts sum: [:anAccount | anAccount balance ] ifEmpty: [0]  ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ml 6/5/2025 02:58:11'!
hasRegistered: aTransactionToCheck 
	
	^accounts ifNotEmpty: [self inAllAccountsFind: aTransactionToCheck] ifEmpty: [false].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ml 6/5/2025 02:58:11'!
inAllAccountsFind: aTransactionToCheck

	^ accounts  anySatisfy: [: anAccount | anAccount  transactions includes: aTransactionToCheck ]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ml 6/4/2025 21:22:35'!
initialize 

	accounts := OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'LG 5/30/2025 21:12:32'!
balance

	^transactions inject: 0 into: [:currentBalance :aTransaction | aTransaction affectBalance: currentBalance]
	
	"
	sum: [ :aTransaction | (aTransaction isKindOf: Deposit) 
		ifTrue: [aTransaction value] 
		ifFalse: [aTransaction value negated ]] ifEmpty: [ 0 ]
	"! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !
