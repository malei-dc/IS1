!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'test' stamp: 'ml 10/21/2024 13:31:10'!
test01unPortfolioVacioDebeTener0DeBalance

	| porfolito |
	porfolito := Portfolio new.
	
	self assert: 0 equals: porfolito balancePortfolio.! !

!PortfolioTest methodsFor: 'test' stamp: 'ml 10/21/2024 13:31:22'!
test02unPortfolioConUnaCuentaBalance100DebeTenerBalance100

	| porfolito  cuentita |
	porfolito := Portfolio new.
	cuentita := ReceptiveAccount new.
	Deposit register: 100 on: cuentita.
	
	porfolito addReceptiveAccount: cuentita.
	
	self assert: 100 equals: porfolito balancePortfolio.! !

!PortfolioTest methodsFor: 'test' stamp: 'ml 10/21/2024 13:31:33'!
test03unPortfolioConDosCuentaQueSumanBalance300DebeTenerBalance300

	| porfolito  cuentita cuentita2 |
	porfolito := Portfolio new.
	cuentita := ReceptiveAccount new.
	Deposit register: 100 on: cuentita.
	
	cuentita2 := ReceptiveAccount new.
	Deposit register: 200 on: cuentita2.
	
	porfolito addReceptiveAccount: cuentita.
	porfolito addReceptiveAccount: cuentita2.
	
	self assert: 300 equals: porfolito balancePortfolio.! !

!PortfolioTest methodsFor: 'test' stamp: 'ml 10/22/2024 01:07:32'!
test04unPortfolioConCuentaYPortfolio

	| porfolito  cuentita porfolito2 cuentita2 |
	porfolito := Portfolio new.
	cuentita := ReceptiveAccount new.
	Deposit register: 100 on: cuentita.
	
	porfolito2 := Portfolio new.
	cuentita2 := ReceptiveAccount new.
	Deposit register: 200 on: cuentita2.
	
	porfolito2 addReceptiveAccount: cuentita2.
	
	porfolito addReceptiveAccount: cuentita.
	porfolito addPortfolio: porfolito2.
	
	self assert: 300 equals: porfolito balancePortfolio.! !

!PortfolioTest methodsFor: 'test' stamp: 'ml 10/22/2024 01:16:46'!
test05unPortfolioConDosPortfolioYUnaCuenta

	| porfolito  cuentita porfolito2 cuentita2 porfolito3 cuentita3 |
	porfolito := Portfolio new.
	porfolito2 := Portfolio new.
	porfolito3 := Portfolio new.
	
	cuentita := ReceptiveAccount new.
	Deposit register: 100 on: cuentita.
	cuentita2 := ReceptiveAccount new.
	Deposit register: 200 on: cuentita2.
	cuentita3 := ReceptiveAccount new.
	Deposit register: 2000 on: cuentita3.
	
	porfolito2 addReceptiveAccount: cuentita2.
	porfolito3 addReceptiveAccount: cuentita.
	porfolito addPortfolio: porfolito2.
	porfolito addPortfolio: porfolito3.
	porfolito addReceptiveAccount: cuentita3.
	
	self assert: 2300 equals: porfolito balancePortfolio.! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'add to balance' stamp: 'ml 10/17/2024 12:40:06'!
addToBalanceIn: anAccount

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'add to balance' stamp: 'ml 10/17/2024 13:20:37'!
addToBalanceIn: anAccount

	anAccount addADepositToBalance: value.! !

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


!Withdraw methodsFor: 'value' stamp: 'ml 10/15/2024 21:43:15'!
value

	^ value! !


!Withdraw methodsFor: 'add to balance' stamp: 'ml 10/17/2024 13:20:32'!
addToBalanceIn: anAccount

	anAccount addAWithdrawToBalance: value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'balanceStatePortfolio accounts portfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'ml 10/22/2024 01:10:55'!
initialize 

	balanceStatePortfolio := 0.
	accounts := OrderedCollection new.
	portfolio := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'ml 10/22/2024 01:14:58'!
balancePortfolio
	
	accounts ifNotEmpty: [
			balanceStatePortfolio := accounts sum: [ :unaCuenta | unaCuenta balance].
		].
	
	portfolio ifNotEmpty: [
			balanceStatePortfolio := balanceStatePortfolio + (portfolio sum:[ :aPortfolio | aPortfolio balancePortfolio ]) .
		]. 
	
	^balanceStatePortfolio 
! !


!Portfolio methodsFor: 'add' stamp: 'ml 10/22/2024 01:11:24'!
addPortfolio: aPortfolioToAdd 

	portfolio add: aPortfolioToAdd .! !

!Portfolio methodsFor: 'add' stamp: 'ml 10/21/2024 16:18:02'!
addReceptiveAccount: cuentita 
	
	accounts add: cuentita .! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions balanceState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'ml 10/15/2024 21:48:01'!
initialize

	transactions := OrderedCollection new.
	balanceState := 0.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'ml 10/17/2024 12:41:36'!
addADepositToBalance: aDepositValueToAdd

	^ balanceState := balanceState + aDepositValueToAdd! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'ml 10/17/2024 13:14:36'!
addAWithdrawToBalance: aWithdrawValueToSustract

	^ balanceState := balanceState - aWithdrawValueToSustract! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'ml 10/17/2024 12:42:37'!
balance
	
	self calculateBalance.
	
	^balanceState .
	
	"^transactions sum: [ :aTransaction | aTransaction class = Deposit  ifTrue: [ aTransaction value] ifFalse: [ 0 - (aTransaction value)] 	] ifEmpty: [ 0 ]"! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'ml 10/17/2024 12:42:37'!
calculateBalance

	^ transactions do: [ :aTransaction | aTransaction addToBalanceIn: self	]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
