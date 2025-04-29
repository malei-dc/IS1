!classDefinition: #TestMyA category: #'2024-2C-Parcial-1'!
TestCase subclass: #TestMyA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 03:49:05'!
test01UnMonstruoAtacaAUnAventureroUsandoSusPVs

	| guerrero |
	
	guerrero := self crearGuerrero.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (5 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:09:06'!
test02UnAventureroPuedeUsarItemsDeDefensaParaProtegerse

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearEscudoMagico.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearOgro atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (15 * pv - (5 * pv) - (3 * pv)))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:35'!
test03LosItemsDeDefensaNoPuedenAumentarLosPuntosDeVidaDelAventurero

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearArmadura.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'ml 4/29/2025 20:52:24'!
test04UnAventureroNoPuedeAtacarSinItemsEquipados

	| guerrero ogro espada |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	espada := self crearEspadaPara: ogro.
	
	self should: [ guerrero atacarA: ogro con: (espada) ] 
		raise: Error-MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: guerrero itemNoDisponibleMensajeDeError.
			self assert: (ogro tienePuntosDeVida: 15 * pv)
	]
	! !

!TestMyA methodsFor: 'tests' stamp: 'LL 9/27/2024 10:48:15'!
test05UnGuerreroConEspadaProvocaDañoSegunSuFuerza

	| guerrero ogro itemDeAtaque otroItemDeAtaque otroOgro |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	otroOgro := self crearOgro.
	otroItemDeAtaque := self crearEspadaPara: otroOgro.
	guerrero equiparItemDeAtaque: otroItemDeAtaque.
	
	guerrero atacarA: ogro con: itemDeAtaque.
	guerrero atacarA: otroOgro con: otroItemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (4 * pv)).
	self assert: (otroOgro tienePuntosDeVida: 15 * pv - (4 * pv)).
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'HAW 9/27/2024 09:46:06'!
test06UnGuerreroConEspadaNoProvocaDañoAOtroMonstruoQueNoSeaElDeLaEspada

	| guerrero ogroNoObjetivoDeAtaque itemDeAtaque ogroObjetivoDeAtaque |
	
	guerrero := self crearGuerrero.
	ogroObjetivoDeAtaque := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogroObjetivoDeAtaque.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogroNoObjetivoDeAtaque := self crearOgro.
	
	guerrero atacarA: ogroNoObjetivoDeAtaque con: itemDeAtaque.
	
	self assert: (ogroNoObjetivoDeAtaque tienePuntosDeVida: 15 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:52'!
test07UnAventureroNoGuerreroPierdeTodosSusPuntosDeVidaSiUsaLaEspada

	| ogro mago itemDeAtaque |
	
	mago := self crearMago.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	mago equiparItemDeAtaque: itemDeAtaque.
	
	mago atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv).
	self assert: (mago tienePuntosDeVida: 0)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:49'!
test08ElMagoUsandoElBaculoMataAlGoblin

	| mago goblin itemDeAtaque |
	
	mago := self crearMago.
	itemDeAtaque := self crearBaculo.
	mago equiparItemDeAtaque: itemDeAtaque.
	goblin :=  self crearGoblin.
	
	mago atacarA: goblin con: itemDeAtaque.
	
	self assert: (goblin tienePuntosDeVida: 0)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:42:13'!
test09ElMagoUsandoElBaculoDañaAOtrosMonstruosSegunSuFuerza

	| mago ogro itemDeAtaque |
	
	mago := self crearMago.
	itemDeAtaque := self crearBaculo.
	mago equiparItemDeAtaque: itemDeAtaque.
	ogro := self crearOgro.
	
	mago atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (2 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:45'!
test10UnAventureroNoMagoEsPenalizadoAlUsarElBaculoDuplicandoPVDeGoblins

	| guerrero goblin itemDeAtaque |
	
	guerrero := self crearGuerrero.
	itemDeAtaque := self crearBaculo.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	goblin := self crearGoblin.
	
	guerrero atacarA: goblin con: itemDeAtaque.
	
	self assert: (goblin tienePuntosDeVida: 5 * pv * 2)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:38'!
test11UnAventureroNoMagoUsandoElBaculoDañaSegunSuFuerzaAOtrosMonstruos

	| guerrero ogro itemDeAtaque |
	
	guerrero := self crearGuerrero.
	itemDeAtaque := self crearBaculo.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogro := self crearOgro.
	
	guerrero atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (4 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:29:01'!
test12UnaEspadaNuncaPuedeSerUsadaEnMonstruosDeMenosDeUnMetro

	| goblin |
	
	goblin := self crearGoblin.
	
	self should: [ self crearEspadaPara: goblin ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
		self assert: anException messageText equals: Espada noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError
	]
	! !


!TestMyA methodsFor: 'crear items' stamp: 'ml 4/29/2025 20:11:01'!
crearArmadura

	^Armadura new. ! !

!TestMyA methodsFor: 'crear items' stamp: 'ml 4/29/2025 19:46:46'!
crearBaculo
	
	^#Baculo! !

!TestMyA methodsFor: 'crear items' stamp: 'ml 4/29/2025 20:10:38'!
crearEscudoMagico

	^EscudoMagico new
	
! !

!TestMyA methodsFor: 'crear items' stamp: 'ml 4/29/2025 19:47:12'!
crearEspadaPara: monstruo

	^#Espada
! !


!TestMyA methodsFor: 'crear combatientes' stamp: 'ml 4/29/2025 19:57:36'!
crearGoblin

	^Goblin new 
! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'ml 4/29/2025 20:04:24'!
crearGuerrero
	
	^Guerrero new! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'ml 4/29/2025 19:47:45'!
crearMago

	^#Mago
! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'ml 4/29/2025 20:11:27'!
crearOgro

	^Ogro new .
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestMyA class' category: #'2024-2C-Parcial-1'!
TestMyA class
	instanceVariableNames: ''!

!TestMyA class methodsFor: 'initialization' stamp: 'LL 9/26/2024 20:21:50'!
initialize

	Smalltalk at: #pv put: (BaseUnit named: 'pv' sign: 'pv')! !


!classDefinition: #Armadura category: #'2024-2C-Parcial-1'!
Object subclass: #Armadura
	instanceVariableNames: 'pvQueDefiende'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Armadura methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 20:15:20'!
initialize

	pvQueDefiende  := 5 * pv! !

!Armadura methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 20:21:19'!
puntosQueCubre
	
	^pvQueDefiende ! !


!classDefinition: #EscudoMagico category: #'2024-2C-Parcial-1'!
Object subclass: #EscudoMagico
	instanceVariableNames: 'pvQueDefiende'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!EscudoMagico methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 20:15:36'!
initialize

	pvQueDefiende  := 3 * pv! !

!EscudoMagico methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 20:21:06'!
puntosQueCubre
	
	^pvQueDefiende .! !


!classDefinition: #Goblin category: #'2024-2C-Parcial-1'!
Object subclass: #Goblin
	instanceVariableNames: 'altura puntosVida'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Goblin methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 20:04:00'!
atacarA: guerrero 
	
	guerrero esAtacadoPorMonstruoCon: puntosVida .! !

!Goblin methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 19:59:58'!
initialize

	altura := (90 * centimeter).
	puntosVida := 5 * pv.! !


!classDefinition: #Guerrero category: #'2024-2C-Parcial-1'!
Object subclass: #Guerrero
	instanceVariableNames: 'fuerza puntosVida equipamientoDef'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Guerrero methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 20:53:27'!
atacarA: ogro con: espada 

	self error: self itemNoDisponibleMensajeDeError .! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 20:37:45'!
equiparItemDeDefensa: unItemAEquipar 
	
	equipamientoDef detect: [ :itemsDef | itemsDef class = unItemAEquipar class] ifNone: [equipamientoDef add: unItemAEquipar]! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 20:22:27'!
esAtacadoPorMonstruoCon: unaCantidadDeDañoEntrante 
	
	puntosVida := puntosVida - (unaCantidadDeDañoEntrante - self sumarPuntosQueCubrenMiEquipamiento) .! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 20:31:13'!
initialize

	fuerza := 4.
	puntosVida := 10 * pv.
	equipamientoDef := OrderedCollection new.! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 20:50:14'!
itemNoDisponibleMensajeDeError
	
	^'Un aventurero no puede atacar sin items equipados'.! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 20:20:11'!
sumarPuntosQueCubrenMiEquipamiento

	equipamientoDef ifNotEmpty: [ ^equipamientoDef sum:[ :defItem | defItem puntosQueCubre]].
	^ 0.! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 20:07:42'!
tienePuntosDeVida: unaCantidadDeVidadAComparar 
	
	^puntosVida = unaCantidadDeVidadAComparar ! !


!classDefinition: #Ogro category: #'2024-2C-Parcial-1'!
Object subclass: #Ogro
	instanceVariableNames: 'puntosVida altura'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Ogro methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 20:12:07'!
atacarA: guerrero 
	
	guerrero esAtacadoPorMonstruoCon: puntosVida .! !

!Ogro methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 20:12:36'!
initialize

	altura := (220 * centimeter).
	puntosVida := 15 * pv.! !

!Ogro methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 20:44:53'!
tienePuntosDeVida: unaCantidadDeVidadAComparar 
	
	^puntosVida = unaCantidadDeVidadAComparar ! !

TestMyA initialize!