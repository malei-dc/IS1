!classDefinition: #TestMyA category: #'2024-2C-Parcial-1'!
TestCase subclass: #TestMyA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!TestMyA methodsFor: 'tests' stamp: 'ml 4/30/2025 21:03:50'!
test01UnMonstruoAtacaAUnAventureroUsandoSusPVs

	| guerrero |
	guerrero := self crearGuerrero.
	
	self crearGoblin atacarA: guerrero.

	self assert: (guerrero tienePuntosDeVida: 10 * pv - (5 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'ml 4/30/2025 21:04:09'!
test02UnAventureroPuedeUsarItemsDeDefensaParaProtegerse

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearEscudoMagico.	
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearOgro atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (15 * pv - (5 * pv) - (3 * pv)))! !

!TestMyA methodsFor: 'tests' stamp: 'ml 4/30/2025 21:04:26'!
test03LosItemsDeDefensaNoPuedenAumentarLosPuntosDeVidaDelAventurero

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearArmadura.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'ml 4/30/2025 21:04:45'!
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

!TestMyA methodsFor: 'tests' stamp: 'ml 4/30/2025 21:05:08'!
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

!TestMyA methodsFor: 'tests' stamp: 'ml 4/30/2025 21:05:27'!
test06UnGuerreroConEspadaNoProvocaDañoAOtroMonstruoQueNoSeaElDeLaEspada

	| guerrero ogroNoObjetivoDeAtaque itemDeAtaque ogroObjetivoDeAtaque |
	
	guerrero := self crearGuerrero.
	ogroObjetivoDeAtaque := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogroObjetivoDeAtaque.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogroNoObjetivoDeAtaque := self crearOgro.
	
	guerrero atacarA: ogroNoObjetivoDeAtaque con: itemDeAtaque.
	
	self assert: (ogroNoObjetivoDeAtaque tienePuntosDeVida: 15 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'ml 4/30/2025 21:05:46'!
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


!TestMyA methodsFor: 'crear items' stamp: 'ml 4/30/2025 22:23:44'!
crearArmadura

	^ItemDeDef crearArmadura. ! !

!TestMyA methodsFor: 'crear items' stamp: 'ml 4/30/2025 22:55:04'!
crearBaculo
	
	^Baculo new.! !

!TestMyA methodsFor: 'crear items' stamp: 'ml 4/30/2025 22:18:48'!
crearEscudoMagico

	^ItemDeDef crearEscudoMagico
	
! !

!TestMyA methodsFor: 'crear items' stamp: 'ml 4/30/2025 21:51:04'!
crearEspadaPara: monstruo

	^Espada para: monstruo 
! !


!TestMyA methodsFor: 'crear combatientes' stamp: 'ml 4/29/2025 19:57:36'!
crearGoblin

	^Goblin new 
! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'ml 4/29/2025 20:04:24'!
crearGuerrero
	
	^Guerrero new! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'ml 4/30/2025 22:12:30'!
crearMago

	^Mago new ! !

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


!classDefinition: #Baculo category: #'2024-2C-Parcial-1'!
Object subclass: #Baculo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Baculo methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 22:58:35'!
intentaAtacarA: unObjetivo por: usuarioDeBaculo
	
	usuarioDeBaculo atacaConBaculoA: unObjetivo! !


!classDefinition: #Espada category: #'2024-2C-Parcial-1'!
Object subclass: #Espada
	instanceVariableNames: 'monstruoObjetivo'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Espada methodsFor: 'initialization' stamp: 'ml 4/30/2025 21:52:37'!
initializePara: monstruo 
	
	monstruoObjetivo := monstruo.! !


!Espada methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 22:55:38'!
intentaAtacarA: unObjetivo por: usuarioDeEspada
	
	unObjetivo = monstruoObjetivo ifTrue: [usuarioDeEspada atacaConEspadaA: unObjetivo]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Espada class' category: #'2024-2C-Parcial-1'!
Espada class
	instanceVariableNames: ''!

!Espada class methodsFor: 'instance creation' stamp: 'ml 4/30/2025 23:32:02'!
noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError

	^'No se puede atacar a monstruo menor a un metro de altura'.! !

!Espada class methodsFor: 'instance creation' stamp: 'ml 4/30/2025 23:30:46'!
para: monstruo 

	monstruo altura < (1 *meter) ifTrue: [ self error: self noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError].
	
	^self new initializePara: monstruo ! !


!classDefinition: #ItemDeDef category: #'2024-2C-Parcial-1'!
Object subclass: #ItemDeDef
	instanceVariableNames: 'cubre'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!ItemDeDef methodsFor: 'initialization' stamp: 'ml 4/30/2025 22:22:46'!
initializeCrearItemQueCubre: unaCantDePV 
	
	cubre := unaCantDePV.! !

!ItemDeDef methodsFor: 'initialization' stamp: 'ml 4/30/2025 22:23:26'!
puntosQueCubre
	
	^cubre .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ItemDeDef class' category: #'2024-2C-Parcial-1'!
ItemDeDef class
	instanceVariableNames: ''!

!ItemDeDef class methodsFor: 'instance creation' stamp: 'ml 4/30/2025 22:28:32'!
crearArmadura

	^self crearItemQueCubre: 5 * pv.! !

!ItemDeDef class methodsFor: 'instance creation' stamp: 'ml 4/30/2025 22:28:02'!
crearEscudoMagico

	^ self crearItemQueCubre: 3 * pv.! !

!ItemDeDef class methodsFor: 'instance creation' stamp: 'ml 4/30/2025 22:22:15'!
crearItemQueCubre: unaCantDePV 

	^self new initializeCrearItemQueCubre: unaCantDePV ! !


!classDefinition: #Personajes category: #'2024-2C-Parcial-1'!
Object subclass: #Personajes
	instanceVariableNames: 'puntosVida'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Personajes methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:02:53'!
esAtacadoCon: unaCantidadDeDañoEntrante

	self subclassResponsibility! !

!Personajes methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 21:46:38'!
tienePuntosDeVida: unaCantidadDeVidadAComparar 

	^puntosVida = unaCantidadDeVidadAComparar ! !


!classDefinition: #Aventurero category: #'2024-2C-Parcial-1'!
Personajes subclass: #Aventurero
	instanceVariableNames: 'fuerza armas equipamientoDef'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Aventurero methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:21:52'!
atacaUnNoGoblinConBaculo: unMonstruo

	unMonstruo esAtacadoCon:  fuerza *pv .! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 22:54:17'!
atacarA: unMonstruo con: espada 
	(armas detect: [:items | items = espada	 ] ifNone: [self error: self itemNoDisponibleMensajeDeError ]) intentaAtacarA: unMonstruo por: self .! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 22:42:08'!
equiparItemDeAtaque: itemDeAtaque 

	armas add: itemDeAtaque .! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 22:42:13'!
equiparItemDeDefensa: unItemAEquipar 
	
	equipamientoDef detect: [ :itemsDef | itemsDef = unItemAEquipar] ifNone: [equipamientoDef add: unItemAEquipar]! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:02:21'!
esAtacadoCon: unaCantidadDeDañoEntrante 
	
	puntosVida := puntosVida - ((unaCantidadDeDañoEntrante - self sumarPuntosQueCubrenMiEquipamiento) max: 0) .! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 22:40:47'!
fuerza

	^fuerza! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:04:05'!
itemNoDisponibleMensajeDeError
	
	^'Un aventurero no puede atacar sin items equipados'.! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:00:29'!
sumarPuntosQueCubrenMiEquipamiento

	equipamientoDef ifNotEmpty: [ ^equipamientoDef sum:[ :defItem | defItem puntosQueCubre]].
	^ 0.! !


!classDefinition: #Guerrero category: #'2024-2C-Parcial-1'!
Aventurero subclass: #Guerrero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Guerrero methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:20:20'!
atacaConBaculoA: unMonstruo 
	
	unMonstruo esAtacadoPorUnNoMagoConBaculo: self! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:01:34'!
atacaConEspadaA: unMonstruo 
	unMonstruo esAtacadoCon:  fuerza *pv .! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 21:40:09'!
initialize

	fuerza := 4.
	puntosVida := 10 * pv.
	equipamientoDef := Bag new.
	armas := Bag new.! !


!classDefinition: #Mago category: #'2024-2C-Parcial-1'!
Aventurero subclass: #Mago
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Mago methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:09:59'!
atacaConBaculoA: unMonstruo 
	
	unMonstruo esAtacadoPorUnMagoConBaculo: self! !

!Mago methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 22:53:21'!
atacaConEspadaA: unMonstruo 
	
	puntosVida := 0 * pv.! !

!Mago methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:15:24'!
initialize

	fuerza := 2.
	puntosVida := 15 * pv.
	equipamientoDef := Bag new.
	armas := Bag new.! !


!classDefinition: #Monstruo category: #'2024-2C-Parcial-1'!
Personajes subclass: #Monstruo
	instanceVariableNames: 'altura'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Monstruo methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:30:15'!
altura

	^altura ! !

!Monstruo methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:03:41'!
esAtacadoCon: unaCantidadDeDañoEntrante 
	
	puntosVida := puntosVida - unaCantidadDeDañoEntrante ! !

!Monstruo methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:23:19'!
esAtacadoPorUnMagoConBaculo: unMago

	self subclassResponsibility! !

!Monstruo methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:23:02'!
esAtacadoPorUnNoMagoConBaculo: unNoMago

	self subclassResponsibility! !


!classDefinition: #Goblin category: #'2024-2C-Parcial-1'!
Monstruo subclass: #Goblin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Goblin methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:02:21'!
atacarA: guerrero 
	
	guerrero esAtacadoCon: puntosVida .! !

!Goblin methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:11:46'!
esAtacadoPorUnMagoConBaculo: unMago

	puntosVida := 0.! !

!Goblin methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:20:49'!
esAtacadoPorUnNoMagoConBaculo: unNoMago

	puntosVida := puntosVida *2.! !

!Goblin methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 22:17:04'!
initialize

	altura := (90 * centimeter).
	puntosVida := 5 * pv.! !


!classDefinition: #Ogro category: #'2024-2C-Parcial-1'!
Monstruo subclass: #Ogro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Ogro methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:02:21'!
atacarA: guerrero 
	
	guerrero esAtacadoCon: puntosVida .! !

!Ogro methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:21:31'!
esAtacadoPorUnMagoConBaculo: unMago

	unMago atacaUnNoGoblinConBaculo: self.! !

!Ogro methodsFor: 'as yet unclassified' stamp: 'ml 4/30/2025 23:24:07'!
esAtacadoPorUnNoMagoConBaculo: unNoMago

	unNoMago atacaUnNoGoblinConBaculo: self.! !

!Ogro methodsFor: 'as yet unclassified' stamp: 'ml 4/29/2025 20:12:36'!
initialize

	altura := (220 * centimeter).
	puntosVida := 15 * pv.! !

TestMyA initialize!