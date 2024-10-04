!classDefinition: #Automobil category: #'2.Replace-if-State'!
Object subclass: #Automobil
	instanceVariableNames: 'powerStatus speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!
!Automobil commentStamp: '<historical>' prior: 0!
| fitito1 fitito2 |
fitito1:= Automobil new.
fitito2:= Automobil new.
fitito2 turnOn .
fitito2 accelerate. 
fitito2 turnOff .
fitito1 accelerate !


!Automobil methodsFor: 'initialization' stamp: 'ml 9/11/2024 19:17:41'!
initialize

	powerStatus := Off new.
	speed := 0 * kilometer / hour! !


!Automobil methodsFor: 'move' stamp: 'ml 9/11/2024 19:52:54'!
accelerate

	powerStatus accelerate: self.! !

!Automobil methodsFor: 'move' stamp: 'ml 9/11/2024 19:49:27'!
accelerateWhenOn
	
	speed := speed + (10 * kilometer / hour).! !

!Automobil methodsFor: 'move' stamp: 'ml 9/11/2024 19:48:01'!
cantAccelerateWhenOff
	
	self error: 'Can not accelerate when turned off'.! !


!Automobil methodsFor: 'on/off' stamp: 'ml 9/11/2024 19:18:58'!
turnOff

	powerStatus := Off new.! !

!Automobil methodsFor: 'on/off' stamp: 'ml 9/11/2024 19:19:07'!
turnOn

	powerStatus := On new.! !


!classDefinition: #PowerStatus category: #'2.Replace-if-State'!
Object subclass: #PowerStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!PowerStatus methodsFor: 'as yet unclassified' stamp: 'ml 9/11/2024 19:44:33'!
accelerate: anAutomobil

	self subclassResponsibility.! !


!classDefinition: #Off category: #'2.Replace-if-State'!
PowerStatus subclass: #Off
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Off methodsFor: 'as yet unclassified' stamp: 'ml 9/11/2024 19:47:26'!
accelerate: anAutomobil

	anAutomobil cantAccelerateWhenOff.! !


!classDefinition: #On category: #'2.Replace-if-State'!
PowerStatus subclass: #On
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!On methodsFor: 'as yet unclassified' stamp: 'ml 9/11/2024 19:48:52'!
accelerate: anAutomobil

	anAutomobil accelerateWhenOn.! !
