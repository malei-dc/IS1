!classDefinition: #Automobil category: #'2.Replace-if-State'!
Object subclass: #Automobil
	instanceVariableNames: 'state speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Automobil methodsFor: 'initialization' stamp: 'ml 9/10/2024 16:11:15'!
initialize

	state := #Off.
	speed := 0 * kilometer / hour! !


!classDefinition: #Off category: #'2.Replace-if-State'!
Automobil subclass: #Off
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Off methodsFor: 'as yet unclassified' stamp: 'ml 9/10/2024 16:07:56'!
accelerate

	^self error: 'Can not accelerate when turned off'.! !

!Off methodsFor: 'as yet unclassified' stamp: 'ml 9/10/2024 16:12:54'!
turnOn

	state := #On! !


!classDefinition: #On category: #'2.Replace-if-State'!
Automobil subclass: #On
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!On methodsFor: 'as yet unclassified' stamp: 'ml 9/10/2024 16:08:24'!
accelerate

	speed := speed + (10 * kilometer / hour).! !
