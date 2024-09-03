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


!I class methodsFor: 'arithmetic ops' stamp: 'ml 9/2/2024 12:44:17'!
* multiplicador
	^multiplicador .	! !

!I class methodsFor: 'arithmetic ops' stamp: 'ml 8/27/2024 21:20:53'!
+ sumando
	"comment stating purpose of message"
	^sumando next! !

!I class methodsFor: 'arithmetic ops' stamp: 'ml 8/31/2024 21:06:13'!
- restando
	self error:'Error: al 1 no le puedo restar nada'! !

!I class methodsFor: 'arithmetic ops' stamp: 'ml 9/1/2024 19:29:19'!
/ divisor
	(divisor = self) ifTrue: [^I].
	^self error: 'No dividir'. 
	! !


!I class methodsFor: 'arithmetic extras' stamp: 'ml 8/27/2024 21:46:46'!
leExtraigo: numero
	^numero previous ! !

!I class methodsFor: 'arithmetic extras' stamp: 'ml 8/31/2024 21:28:07'!
multiplyPorNumMayorAUno: multiplicando
	^multiplicando! !


!I class methodsFor: 'compare' stamp: 'ml 9/1/2024 19:16:07'!
< numAcomparar
	(self = numAcomparar) ifTrue: [^false].
	^true! !

!I class methodsFor: 'compare' stamp: 'ml 9/1/2024 19:15:38'!
>= numeroAcomparar
	^(self < numeroAcomparar) not.! !


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

!II class methodsFor: 'arithmetic ops' stamp: 'ml 9/1/2024 19:25:32'!
/ divisor
	(divisor = self) ifTrue: [^I].
	(self < divisor ) ifTrue: [^self error: 'No dividir']. 
	^I+((self - divisor)/divisor)! !


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

!II class methodsFor: 'next & prev' stamp: 'ml 9/2/2024 14:14:25'!
nextName
	"comment stating purpose of message"
	(self name endsWith: 'IX') ifTrue:[^(self name withoutSuffix: 'IX'), 'X'].
	(self name endsWith: 'VIII') ifTrue:[^(self name withoutSuffix: 'VIII'), 'IX'].
	(self name endsWith: 'IV') ifTrue:[^(self name withoutSuffix: 'IV'), 'V'].
	(self name endsWith: 'III') ifTrue:[^(self name withoutSuffix: 'III'), 'IV'].
	
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


!II class methodsFor: 'compare' stamp: 'ml 9/1/2024 19:15:49'!
< numeroAcomparar
	(self = numeroAcomparar) ifTrue: 	[^false].
	^(self previous) < numeroAcomparar .! !

!II class methodsFor: 'compare' stamp: 'ml 9/1/2024 19:02:45'!
>= numeroAcomparar
	^(self < numeroAcomparar) not.! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'ml 9/2/2024 14:17:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: #'Seccion1Part1Ejercicio4: naturales'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio4: naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Seccion1Part1Ejercicio4: naturales'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'ml 9/2/2024 14:17:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IV.
	previous := II.! !


!classDefinition: #IV category: #'Seccion1Part1Ejercicio4: naturales'!
II subclass: #IV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio4: naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IV class' category: #'Seccion1Part1Ejercicio4: naturales'!
IV class
	instanceVariableNames: ''!

!IV class methodsFor: '--** private fileout/in **--' stamp: 'ml 9/2/2024 14:17:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := V.
	previous := III.! !


!classDefinition: #IX category: #'Seccion1Part1Ejercicio4: naturales'!
II subclass: #IX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio4: naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IX class' category: #'Seccion1Part1Ejercicio4: naturales'!
IX class
	instanceVariableNames: ''!

!IX class methodsFor: '--** private fileout/in **--' stamp: 'ml 9/2/2024 14:17:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := X.
	previous := VIII.! !


!classDefinition: #V category: #'Seccion1Part1Ejercicio4: naturales'!
II subclass: #V
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio4: naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'V class' category: #'Seccion1Part1Ejercicio4: naturales'!
V class
	instanceVariableNames: ''!

!V class methodsFor: '--** private fileout/in **--' stamp: 'ml 9/2/2024 14:17:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := VI.
	previous := IV.! !


!classDefinition: #VI category: #'Seccion1Part1Ejercicio4: naturales'!
II subclass: #VI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio4: naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VI class' category: #'Seccion1Part1Ejercicio4: naturales'!
VI class
	instanceVariableNames: ''!

!VI class methodsFor: '--** private fileout/in **--' stamp: 'ml 9/2/2024 14:17:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := VII.
	previous := V.! !


!classDefinition: #VII category: #'Seccion1Part1Ejercicio4: naturales'!
II subclass: #VII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio4: naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VII class' category: #'Seccion1Part1Ejercicio4: naturales'!
VII class
	instanceVariableNames: ''!

!VII class methodsFor: '--** private fileout/in **--' stamp: 'ml 9/2/2024 14:17:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := VIII.
	previous := VI.! !


!classDefinition: #VIII category: #'Seccion1Part1Ejercicio4: naturales'!
II subclass: #VIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio4: naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VIII class' category: #'Seccion1Part1Ejercicio4: naturales'!
VIII class
	instanceVariableNames: ''!

!VIII class methodsFor: '--** private fileout/in **--' stamp: 'ml 9/2/2024 14:17:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IX.
	previous := VII.! !


!classDefinition: #X category: #'Seccion1Part1Ejercicio4: naturales'!
II subclass: #X
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio4: naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'X class' category: #'Seccion1Part1Ejercicio4: naturales'!
X class
	instanceVariableNames: ''!

!X class methodsFor: '--** private fileout/in **--' stamp: 'ml 9/2/2024 14:17:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XI.
	previous := IX.! !


!classDefinition: #XI category: #'Seccion1Part1Ejercicio4: naturales'!
II subclass: #XI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio4: naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XI class' category: #'Seccion1Part1Ejercicio4: naturales'!
XI class
	instanceVariableNames: ''!

!XI class methodsFor: '--** private fileout/in **--' stamp: 'ml 9/2/2024 14:17:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XII.
	previous := X.! !


!classDefinition: #XII category: #'Seccion1Part1Ejercicio4: naturales'!
II subclass: #XII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio4: naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XII class' category: #'Seccion1Part1Ejercicio4: naturales'!
XII class
	instanceVariableNames: ''!

!XII class methodsFor: '--** private fileout/in **--' stamp: 'ml 9/2/2024 14:17:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XIII.
	previous := XI.! !


!classDefinition: #XIII category: #'Seccion1Part1Ejercicio4: naturales'!
II subclass: #XIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio4: naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIII class' category: #'Seccion1Part1Ejercicio4: naturales'!
XIII class
	instanceVariableNames: ''!

!XIII class methodsFor: '--** private fileout/in **--' stamp: 'ml 9/2/2024 14:17:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XIV.
	previous := XII.! !


!classDefinition: #XIV category: #'Seccion1Part1Ejercicio4: naturales'!
II subclass: #XIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio4: naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIV class' category: #'Seccion1Part1Ejercicio4: naturales'!
XIV class
	instanceVariableNames: ''!

!XIV class methodsFor: '--** private fileout/in **--' stamp: 'ml 9/2/2024 14:17:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XV.
	previous := XIII.! !


!classDefinition: #XV category: #'Seccion1Part1Ejercicio4: naturales'!
II subclass: #XV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio4: naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XV class' category: #'Seccion1Part1Ejercicio4: naturales'!
XV class
	instanceVariableNames: ''!

!XV class methodsFor: '--** private fileout/in **--' stamp: 'ml 9/2/2024 14:17:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XVI.
	previous := XIV.! !


!classDefinition: #XVI category: #'Seccion1Part1Ejercicio4: naturales'!
II subclass: #XVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Seccion1Part1Ejercicio4: naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVI class' category: #'Seccion1Part1Ejercicio4: naturales'!
XVI class
	instanceVariableNames: ''!

!XVI class methodsFor: '--** private fileout/in **--' stamp: 'ml 9/2/2024 14:17:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := XV.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IV initializeAfterFileIn!
IX initializeAfterFileIn!
V initializeAfterFileIn!
VI initializeAfterFileIn!
VII initializeAfterFileIn!
VIII initializeAfterFileIn!
X initializeAfterFileIn!
XI initializeAfterFileIn!
XII initializeAfterFileIn!
XIII initializeAfterFileIn!
XIV initializeAfterFileIn!
XV initializeAfterFileIn!
XVI initializeAfterFileIn!