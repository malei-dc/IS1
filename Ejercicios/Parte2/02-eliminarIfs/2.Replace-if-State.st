!classDefinition: #Automobile category: #'2.Replace-if-State'!
Object subclass: #Automobile
	instanceVariableNames: 'state speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Automobile methodsFor: 'initialization' stamp: 'ml 4/5/2025 20:16:07'!
initialize

	state := AutomobileStateOff new.
	speed := 0 * kilometer / hour! !


!Automobile methodsFor: 'move' stamp: 'ml 4/5/2025 20:20:16'!
accelerate

	state accelerate: self.
	"
	state = #Off ifTrue:[self error: 'Can not accelerate when turned off'].
	state = #On ifTrue:[speed := speed + (10 * kilometer / hour)].
	"! !

!Automobile methodsFor: 'move' stamp: 'ml 4/5/2025 20:18:20'!
tryToAccelerateWhenOn

	speed := speed + (10 * kilometer / hour).! !

!Automobile methodsFor: 'move' stamp: 'ml 4/5/2025 20:17:53'!
tryToAccerelateWhenOff
	
	self error: 'Can not accelerate when turned off'.! !

!Automobile methodsFor: 'move' stamp: 'ml 4/5/2025 20:16:31'!
turnOn

	state := AutomobileStateOn new.! !


!classDefinition: #AutomobileState category: #'2.Replace-if-State'!
Object subclass: #AutomobileState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!AutomobileState methodsFor: 'move' stamp: 'ml 4/5/2025 20:20:34'!
accelerate: anAutomobile

	self subclassResponsibility! !


!classDefinition: #AutomobileStateOff category: #'2.Replace-if-State'!
AutomobileState subclass: #AutomobileStateOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!AutomobileStateOff methodsFor: 'move' stamp: 'ml 4/5/2025 20:20:48'!
accelerate: anAutomobile 
	
	anAutomobile tryToAccerelateWhenOff .! !


!classDefinition: #AutomobileStateOn category: #'2.Replace-if-State'!
AutomobileState subclass: #AutomobileStateOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!AutomobileStateOn methodsFor: 'move' stamp: 'ml 4/5/2025 20:21:15'!
accelerate: anAutomobile 
	
	anAutomobile tryToAccelerateWhenOn.! !
