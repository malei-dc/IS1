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

!TestMyA methodsFor: 'tests' stamp: 'HAW 9/27/2024 09:04:39'!
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


!TestMyA methodsFor: 'crear items' stamp: 'ml 9/30/2024 22:42:58'!
crearArmadura

	^Armadura new ! !

!TestMyA methodsFor: 'crear items' stamp: 'ml 9/30/2024 15:05:44'!
crearBaculo
	
	^Baculo new! !

!TestMyA methodsFor: 'crear items' stamp: 'ml 9/30/2024 22:43:06'!
crearEscudoMagico

	^EscudoMagico new
! !

!TestMyA methodsFor: 'crear items' stamp: 'ml 9/30/2024 15:05:33'!
crearEspadaPara: monstruo

	^Espada para: monstruo .
! !


!TestMyA methodsFor: 'crear combatientes' stamp: 'ml 9/30/2024 22:22:11'!
crearGoblin

	^ Goblin con: 90 * centimeter yPv: 5 * pv! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'ml 9/30/2024 21:59:39'!
crearGuerrero
	
	^ Guerrero conFuerza: 4 * pv yPv: 10 * pv! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'ml 9/30/2024 21:59:45'!
crearMago

	^ Mago conFuerza: 2 *pv yPv: 15 * pv
! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'ml 9/28/2024 22:54:32'!
crearOgro

	^ Ogro con: 220 * centimeter yPv: 15 * pv! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestMyA class' category: #'2024-2C-Parcial-1'!
TestMyA class
	instanceVariableNames: ''!

!TestMyA class methodsFor: 'initialization' stamp: 'LL 9/26/2024 20:21:50'!
initialize

	Smalltalk at: #pv put: (BaseUnit named: 'pv' sign: 'pv')! !


!classDefinition: #Aventurero category: #'2024-2C-Parcial-1'!
Object subclass: #Aventurero
	instanceVariableNames: 'fuerza puntosVida itemsDefEquipado itemAtkEquipado'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Aventurero methodsFor: 'initialization' stamp: 'ml 9/30/2024 14:54:59'!
inicializarConFuerza: cantFuerza yPv: cantPv

	fuerza := cantFuerza .
	puntosVida := cantPv .
	itemsDefEquipado := OrderedCollection new.
	itemAtkEquipado := Dictionary new! !


!Aventurero methodsFor: 'testing' stamp: 'ml 9/30/2024 15:01:19'!
tienePuntosDeVida: cantVidaAComparar

	^ puntosVida = cantVidaAComparar .! !


!Aventurero methodsFor: 'siendo atacado' stamp: 'ml 9/30/2024 22:34:42'!
eliminarDuplicados

	^ itemsDefEquipado asSet! !

!Aventurero methodsFor: 'siendo atacado' stamp: 'ml 9/30/2024 14:54:59'!
esAtacadoPorUnMonstruoCon: unaCantPvDeDaño

	
	puntosVida := puntosVida - ((0 *puntosVida) max: ((unaCantPvDeDaño) -  (self sumarTodosLosPuntosDeDef) ))! !

!Aventurero methodsFor: 'siendo atacado' stamp: 'ml 9/30/2024 22:47:46'!
sumarTodosLosPuntosDeDef
 
	| itemsUnicos totalDef |
	
	itemsUnicos := self eliminarDuplicados. 
      
	totalDef := itemsUnicos notEmpty ifTrue: [itemsUnicos sum:[ :items | items puntosDefendido]] ifFalse: [0].

	^ totalDef.! !


!Aventurero methodsFor: 'equipando items' stamp: 'ml 9/30/2024 21:53:16'!
equiparItemDeAtaque: itemDeAtaque 
	itemAtkEquipado at: itemDeAtaque  put: itemDeAtaque .! !

!Aventurero methodsFor: 'equipando items' stamp: 'ml 9/30/2024 12:16:39'!
equiparItemDeDefensa: unItemDef

	itemsDefEquipado add: unItemDef .! !


!Aventurero methodsFor: 'mensajes error' stamp: 'ml 9/30/2024 15:14:53'!
itemNoDisponibleMensajeDeError
	
	^'Item no equipado'! !


!Aventurero methodsFor: 'atacar' stamp: 'ml 9/30/2024 20:53:43'!
atacarA: unMonstruo con: unItemAtaque

	self subclassResponsibility! !


!classDefinition: #Guerrero category: #'2024-2C-Parcial-1'!
Aventurero subclass: #Guerrero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Guerrero methodsFor: 'atacar' stamp: 'ml 9/30/2024 22:17:15'!
atacarA: unMonstruo con: unItemAtaque 

	itemAtkEquipado at: unItemAtaque 
		ifPresent: [  :item| 			(item class = Espada) ifTrue: [ (item coincideObjetivo: unMonstruo) 
							ifTrue: [unMonstruo recibeDañoDeGuerreroConEspadaCon: fuerza].
							].
						 (item class = Baculo ) ifTrue: [ 
							unMonstruo recibeDañoDeGuerreroConBaculoCon: fuerza .
							]

		] 
		ifAbsent: [self error: self itemNoDisponibleMensajeDeError].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Guerrero class' category: #'2024-2C-Parcial-1'!
Guerrero class
	instanceVariableNames: ''!

!Guerrero class methodsFor: 'creacion' stamp: 'ml 9/28/2024 21:21:55'!
conFuerza: cantFuerza yPv: cantPv

	^ Guerrero new inicializarConFuerza: cantFuerza yPv: cantPv! !


!classDefinition: #Mago category: #'2024-2C-Parcial-1'!
Aventurero subclass: #Mago
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Mago methodsFor: 'atacar' stamp: 'ml 9/30/2024 22:15:33'!
atacarA: unMonstruo con: unItemAtaque 

	itemAtkEquipado at: unItemAtaque 
		ifPresent: [ :item| 			(item class = Espada) ifTrue: [ (item coincideObjetivo: unMonstruo) 
							ifTrue: [puntosVida := 0].
							].
						 (item class = Baculo ) ifTrue: [ 
							unMonstruo recibeDañoDeMagoConBaculoCon: fuerza .
							]
		]
		ifAbsent: [self error: self itemNoDisponibleMensajeDeError].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Mago class' category: #'2024-2C-Parcial-1'!
Mago class
	instanceVariableNames: ''!

!Mago class methodsFor: 'creacion' stamp: 'ml 9/28/2024 22:49:43'!
conFuerza: cantFuerza yPv: cantPv

	^ Mago new inicializarConFuerza: cantFuerza yPv: cantPv! !


!classDefinition: #ItemAtaque category: #'2024-2C-Parcial-1'!
Object subclass: #ItemAtaque
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!


!classDefinition: #Baculo category: #'2024-2C-Parcial-1'!
ItemAtaque subclass: #Baculo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!


!classDefinition: #Espada category: #'2024-2C-Parcial-1'!
ItemAtaque subclass: #Espada
	instanceVariableNames: 'objetivo'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Espada methodsFor: 'as yet unclassified' stamp: 'ml 9/30/2024 21:54:23'!
coincideObjetivo: unMonstruo 
	
	^ objetivo = unMonstruo .! !

!Espada methodsFor: 'as yet unclassified' stamp: 'ml 9/30/2024 15:06:56'!
fijarObjetivo: unMonstruo

	objetivo := unMonstruo .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Espada class' category: #'2024-2C-Parcial-1'!
Espada class
	instanceVariableNames: ''!

!Espada class methodsFor: 'mensajes error' stamp: 'ml 9/30/2024 22:29:38'!
noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError

	^'No se puede atacar monstruos menor a un metro con espada.'! !


!Espada class methodsFor: 'creacion' stamp: 'ml 9/30/2024 22:31:58'!
para: unMonstruo

	(unMonstruo midoMenosDeUnMetro) ifTrue: [self error: self noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError].
	^ Espada new fijarObjetivo: unMonstruo ! !


!classDefinition: #ItemDefensa category: #'2024-2C-Parcial-1'!
Object subclass: #ItemDefensa
	instanceVariableNames: 'cubre'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!ItemDefensa methodsFor: 'as yet unclassified' stamp: 'ml 9/30/2024 22:43:46'!
puntosDefendido

	self subclassResponsibility! !


!classDefinition: #Armadura category: #'2024-2C-Parcial-1'!
ItemDefensa subclass: #Armadura
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Armadura methodsFor: 'as yet unclassified' stamp: 'ml 9/30/2024 22:42:29'!
initialize 
	cubre := 5 * pv! !

!Armadura methodsFor: 'as yet unclassified' stamp: 'ml 9/30/2024 22:43:56'!
puntosDefendido

	^ cubre .! !


!classDefinition: #EscudoMagico category: #'2024-2C-Parcial-1'!
ItemDefensa subclass: #EscudoMagico
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!EscudoMagico methodsFor: 'as yet unclassified' stamp: 'ml 9/30/2024 22:42:47'!
initialize 
	
	cubre  := 3 * pv! !

!EscudoMagico methodsFor: 'as yet unclassified' stamp: 'ml 9/30/2024 22:44:10'!
puntosDefendido

	^cubre ! !


!classDefinition: #Monstruo category: #'2024-2C-Parcial-1'!
Object subclass: #Monstruo
	instanceVariableNames: 'altura puntosVida'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Monstruo methodsFor: 'initialization' stamp: 'ml 9/30/2024 21:56:21'!
inicializarCon: unaAltura yPv: cantPv

	altura := unaAltura.
	puntosVida := cantPv .! !


!Monstruo methodsFor: 'testing' stamp: 'ml 9/30/2024 21:56:21'!
tienePuntosDeVida: cantVida

	^ puntosVida = cantVida .! !


!Monstruo methodsFor: 'ataque' stamp: 'ml 9/30/2024 21:56:21'!
atacarA: unAventurero

	unAventurero esAtacadoPorUnMonstruoCon: puntosVida.
	! !


!Monstruo methodsFor: 'recibir daño' stamp: 'ml 9/30/2024 22:18:13'!
recibeDañoDeGuerreroConBaculoCon: cantFuerza

	self subclassResponsibility! !

!Monstruo methodsFor: 'recibir daño' stamp: 'ml 9/30/2024 22:13:12'!
recibeDañoDeGuerreroConEspadaCon: cantFuerza
	
	self subclassResponsibility .! !

!Monstruo methodsFor: 'recibir daño' stamp: 'ml 9/30/2024 22:15:33'!
recibeDañoDeMagoConBaculoCon: cantFuerza

	self subclassResponsibility .! !


!Monstruo methodsFor: 'as yet unclassified' stamp: 'ml 9/30/2024 22:33:21'!
midoMenosDeUnMetro

	^ altura < (100 * centimeter )! !


!classDefinition: #Goblin category: #'2024-2C-Parcial-1'!
Monstruo subclass: #Goblin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Goblin methodsFor: 'recibir daño' stamp: 'ml 9/30/2024 22:19:17'!
recibeDañoDeGuerreroConBaculoCon: cantFuerza
	
	puntosVida := puntosVida * 2.! !

!Goblin methodsFor: 'recibir daño' stamp: 'ml 9/30/2024 22:19:22'!
recibeDañoDeMagoConBaculoCon: cantFuerza

	puntosVida := 0 .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Goblin class' category: #'2024-2C-Parcial-1'!
Goblin class
	instanceVariableNames: ''!

!Goblin class methodsFor: 'as yet unclassified' stamp: 'ml 9/28/2024 22:55:59'!
con: altura yPv: cantPv

	^ Goblin new inicializarCon: altura yPv: cantPv! !


!classDefinition: #Ogro category: #'2024-2C-Parcial-1'!
Monstruo subclass: #Ogro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Ogro methodsFor: 'recibir daño' stamp: 'ml 9/30/2024 22:24:27'!
recibeDañoDeGuerreroConBaculoCon: cantFuerza
	
	puntosVida := puntosVida - cantFuerza .! !

!Ogro methodsFor: 'recibir daño' stamp: 'ml 9/30/2024 21:56:21'!
recibeDañoDeGuerreroConEspadaCon: cantFuerza
	
	puntosVida := puntosVida - cantFuerza ! !

!Ogro methodsFor: 'recibir daño' stamp: 'ml 9/30/2024 22:15:33'!
recibeDañoDeMagoConBaculoCon: cantFuerza
	puntosVida := puntosVida - cantFuerza .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ogro class' category: #'2024-2C-Parcial-1'!
Ogro class
	instanceVariableNames: ''!

!Ogro class methodsFor: 'as yet unclassified' stamp: 'ml 9/28/2024 22:56:12'!
con: altura yPv: cantPv

	^ Ogro new inicializarCon: altura yPv: cantPv! !

TestMyA initialize!