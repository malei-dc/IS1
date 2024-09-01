!classDefinition: #I category: #'Seccion1Part1Ejercicio4: naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio4: naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Seccion1Part1Ejercicio4: naturales'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'next & prev' stamp: 'ml 8/27/2024 20:55:50'!
next
	^II! !

!I class methodsFor: 'next & prev' stamp: 'ml 8/31/2024 20:53:03'!
previous
	self error: 'El uno es el primer numero natural'! !


!I class methodsFor: 'arithmetic ops' stamp: 'ml 8/27/2024 21:20:53'!
+ sumando
	"comment stating purpose of message"
	^sumando next! !

!I class methodsFor: 'arithmetic ops' stamp: 'ml 8/31/2024 21:06:13'!
- restando
	self error:'Error: al 1 no le puedo restar nada'! !

!I class methodsFor: 'arithmetic extras' stamp: 'ml 8/27/2024 21:46:46'!
leExtraigo: numero
	^numero previous ! !

!I class methodsFor: 'arithmetic extras' stamp: 'ml 8/31/2024 21:28:07'!
multiplyPorNumMayorAUno: multiplicando
	^multiplicando! !

!I class methodsFor: 'next & prev' stamp: 'ml 8/27/2024 20:55:50'!
next
	^II! !

!I class methodsFor: 'next & prev' stamp: 'ml 8/31/2024 20:53:03'!
previous
	self error: 'El uno es el primer numero natural'! !


!I class methodsFor: 'arithmetic extras' stamp: 'ml 8/27/2024 21:46:46'!
leExtraigo: numero
	^numero previous ! !

!I class methodsFor: 'arithmetic extras' stamp: 'ml 8/31/2024 21:28:07'!
multiplyPorNumMayorAUno: multiplicando
	^multiplicando! !


!I class methodsFor: 'arithmetic ops' stamp: 'ml 8/27/2024 21:20:53'!
+ sumando
	"comment stating purpose of message"
	^sumando next! !

!I class methodsFor: 'arithmetic ops' stamp: 'ml 8/31/2024 21:06:13'!
- restando
	self error:'Error: al 1 no le puedo restar nada'! !


!classDefinition: #II category: #'Seccion1Part1Ejercicio4: naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio4: naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Seccion1Part1Ejercicio4: naturales'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'arithmetic ops' stamp: 'ml 8/31/2024 21:15:07'!
* multiplicador
	 ^multiplicador multiplyPorNumMayorAUno: self
	! !

!II class methodsFor: 'arithmetic ops' stamp: 'ml 8/27/2024 21:25:46'!
+ sumando
	"comment stating purpose of message"
	^self previous  + sumando next! !

!II class methodsFor: 'arithmetic ops' stamp: 'ml 8/27/2024 21:40:37'!
- restando
	 ^restando leExtraigo: self
	! !

!II class methodsFor: '--** private fileout/in **--' stamp: 'ml 8/31/2024 21:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := I.! !

!II class methodsFor: 'arithmetic extras' stamp: 'ml 8/27/2024 21:42:50'!
leExtraigo: numero
	^numero previous  - self previous ! !

!II class methodsFor: 'arithmetic extras' stamp: 'ml 8/31/2024 21:26:46'!
multiplyPorNumMayorAUno: numeroMayorAUno
	^numeroMayorAUno +  (numeroMayorAUno * self previous )! !

!II class methodsFor: 'next & prev' stamp: 'ml 8/31/2024 20:29:51'!
next
	"al colaborador next le asigno el hijo creado"
	next := II createChildNamed: self nextName .
	"al valor del colabolador de next le mando mensaje previous con el parametro self"
	next previous: self.
	^next! !

!II class methodsFor: 'next & prev' stamp: 'ml 8/31/2024 21:38:22'!
nextName
	"comment stating purpose of message"
	(self name endsWith: 'III') ifTrue:[^(self name withoutSuffix: 'III'), 'IV'].
	(self name endsWith: 'IV') ifTrue:[^(self name withoutSuffix: 'IV'), 'V'].
	^self name, 'I'! !

!II class methodsFor: 'next & prev' stamp: 'ml 8/31/2024 20:26:54'!
previous
	"Devuelve el colaborador previous"
	 ^previous! !

!II class methodsFor: 'next & prev' stamp: 'ml 8/31/2024 20:30:30'!
previous: aNumber
	"al colaborador previous le asgino el parametro mandado"
	 previous := aNumber ! !

!II class methodsFor: 'remove all next' stamp: 'ml 8/31/2024 21:09:32'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!II class methodsFor: 'next & prev' stamp: 'ml 8/31/2024 20:29:51'!
next
	"al colaborador next le asigno el hijo creado"
	next := II createChildNamed: self nextName .
	"al valor del colabolador de next le mando mensaje previous con el parametro self"
	next previous: self.
	^next! !

!II class methodsFor: 'next & prev' stamp: 'ml 8/31/2024 21:38:22'!
nextName
	"comment stating purpose of message"
	(self name endsWith: 'III') ifTrue:[^(self name withoutSuffix: 'III'), 'IV'].
	(self name endsWith: 'IV') ifTrue:[^(self name withoutSuffix: 'IV'), 'V'].
	^self name, 'I'! !

!II class methodsFor: 'next & prev' stamp: 'ml 8/31/2024 20:26:54'!
previous
	"Devuelve el colaborador previous"
	 ^previous! !

!II class methodsFor: 'next & prev' stamp: 'ml 8/31/2024 20:30:30'!
previous: aNumber
	"al colaborador previous le asgino el parametro mandado"
	 previous := aNumber ! !


!II class methodsFor: 'arithmetic ops' stamp: 'ml 8/31/2024 21:15:07'!
* multiplicador
	 ^multiplicador multiplyPorNumMayorAUno: self
	! !

!II class methodsFor: 'arithmetic ops' stamp: 'ml 8/27/2024 21:25:46'!
+ sumando
	"comment stating purpose of message"
	^self previous  + sumando next! !

!II class methodsFor: 'arithmetic ops' stamp: 'ml 8/27/2024 21:40:37'!
- restando
	 ^restando leExtraigo: self
	! !


!II class methodsFor: 'arithmetic extras' stamp: 'ml 8/27/2024 21:42:50'!
leExtraigo: numero
	^numero previous  - self previous ! !

!II class methodsFor: 'arithmetic extras' stamp: 'ml 8/31/2024 21:26:46'!
multiplyPorNumMayorAUno: numeroMayorAUno
	^numeroMayorAUno +  (numeroMayorAUno * self previous )! !


!II class methodsFor: 'remove all next' stamp: 'ml 8/31/2024 21:09:32'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'ml 8/31/2024 21:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := I.! !

II initializeAfterFileIn!