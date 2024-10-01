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

!TestMyA methodsFor: 'tests' stamp: 'ml 10/1/2024 02:13:13'!
test13UnAventureroDerrotadoNoDebePoderAtacar

	| espada mago ogro |
	
	ogro := self crearOgro .
	espada := self crearEspadaPara: ogro.
	mago := self crearMago .
	
	mago equiparItemDeAtaque: espada.
	mago atacarA: ogro con: espada .
	
	self should: [ mago atacarA: ogro con: espada ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
		self assert: anException messageText equals: mago noSePuedeAtacarEstandoMuertoError
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
	instanceVariableNames: 'fuerza puntosVida itemsDefEquipado itemAtkEquipado estado'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Aventurero methodsFor: 'initialization' stamp: 'ml 10/1/2024 02:16:29'!
inicializarConFuerza: cantFuerza yPv: cantPv

	fuerza := cantFuerza .
	puntosVida := cantPv .
	itemsDefEquipado := OrderedCollection new.
	itemAtkEquipado := Dictionary new.
	estado := Vivo new.! !


!Aventurero methodsFor: 'testing' stamp: 'ml 9/30/2024 15:01:19'!
tienePuntosDeVida: cantVidaAComparar

	^ puntosVida = cantVidaAComparar .! !


!Aventurero methodsFor: 'siendo atacado' stamp: 'ml 9/30/2024 22:34:42'!
eliminarDuplicados

	^ itemsDefEquipado asSet! !

!Aventurero methodsFor: 'siendo atacado' stamp: 'ml 10/1/2024 02:21:08'!
esAtacadoPorUnMonstruoCon: unaCantPvDeDaño

	
	puntosVida := puntosVida - ((0 *pv) max: ((unaCantPvDeDaño) -  (self sumarTodosLosPuntosDeDef) )).
	((puntosVida) <= (0*pv)) ifTrue: [estado := Muerto new].

	! !

!Aventurero methodsFor: 'siendo atacado' stamp: 'ml 10/1/2024 00:51:41'!
sumarTodosLosItems: itemsCollection

	^ itemsCollection notEmpty ifTrue: [itemsCollection sum:[ :items | items puntosDefendido]] ifFalse: [0]! !

!Aventurero methodsFor: 'siendo atacado' stamp: 'ml 10/1/2024 00:52:42'!
sumarTodosLosPuntosDeDef
 
	| itemsUnicosEquipados totalDef |
	
	itemsUnicosEquipados := self eliminarDuplicados. 
      
	totalDef := self sumarTodosLosItems: itemsUnicosEquipados.

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

!Aventurero methodsFor: 'mensajes error' stamp: 'ml 10/1/2024 02:28:36'!
noSePuedeAtacarEstandoMuertoError
	
	^'No se puede atacar estando muerto'! !


!Aventurero methodsFor: 'atacar' stamp: 'ml 9/30/2024 20:53:43'!
atacarA: unMonstruo con: unItemAtaque

	self subclassResponsibility! !


!Aventurero methodsFor: 'excepciones' stamp: 'ml 10/1/2024 02:30:14'!
noPuedeAtacar
	
	self error: self noSePuedeAtacarEstandoMuertoError .! !


!classDefinition: #Guerrero category: #'2024-2C-Parcial-1'!
Aventurero subclass: #Guerrero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Guerrero methodsFor: 'atacar' stamp: 'ml 10/1/2024 02:25:43'!
atacarA: unMonstruo con: unItemAtaque 

	estado quieroAtacar: self.
	itemAtkEquipado at: unItemAtaque 
		ifPresent: [  :item| 			item esUsadoPorGuerrero: self paraAtacar: unMonstruo con: fuerza]
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

!Mago methodsFor: 'atacar' stamp: 'ml 10/1/2024 01:32:31'!
ataca: unMonstruo usando: unaCantDeFuerza 

	unMonstruo recibeDañoDeMagoConBaculoCon: fuerza .
	! !

!Mago methodsFor: 'atacar' stamp: 'ml 10/1/2024 02:25:58'!
atacarA: unMonstruo con: unItemAtaque 

	estado quieroAtacar: self.
	itemAtkEquipado at: unItemAtaque 
		ifPresent: [ :item| 			item esUsadoPorMago: self paraAtacar: unMonstruo con: fuerza.		]
		ifAbsent: [self error: self itemNoDisponibleMensajeDeError].! !

!Mago methodsFor: 'atacar' stamp: 'ml 10/1/2024 02:17:44'!
pierdePuntosDeVidaAlUsarEspada
	puntosVida := 0.
	estado := Muerto new.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Mago class' category: #'2024-2C-Parcial-1'!
Mago class
	instanceVariableNames: ''!

!Mago class methodsFor: 'creacion' stamp: 'ml 9/28/2024 22:49:43'!
conFuerza: cantFuerza yPv: cantPv

	^ Mago new inicializarConFuerza: cantFuerza yPv: cantPv! !


!classDefinition: #EstadoAventurero category: #'2024-2C-Parcial-1'!
Object subclass: #EstadoAventurero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!EstadoAventurero methodsFor: 'as yet unclassified' stamp: 'ml 10/1/2024 02:32:01'!
quieroAtacar: aMago

	self subclassResponsibility! !


!classDefinition: #Muerto category: #'2024-2C-Parcial-1'!
EstadoAventurero subclass: #Muerto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Muerto methodsFor: 'as yet unclassified' stamp: 'ml 10/1/2024 02:29:21'!
quieroAtacar: aMago 
	
	aMago noPuedeAtacar.! !


!classDefinition: #Vivo category: #'2024-2C-Parcial-1'!
EstadoAventurero subclass: #Vivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Vivo methodsFor: 'as yet unclassified' stamp: 'ml 10/1/2024 02:27:26'!
quieroAtacar: unAventurero 
	
	^self.! !


!classDefinition: #ItemAtaque category: #'2024-2C-Parcial-1'!
Object subclass: #ItemAtaque
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!ItemAtaque methodsFor: 'usado por mago' stamp: 'ml 10/1/2024 01:50:12'!
esUsadoPorMago: unMago paraAtacar: unMonstruo con: unaCantDeFuerza

	self subclassResponsibility! !


!ItemAtaque methodsFor: 'usado por guerrero' stamp: 'ml 10/1/2024 01:54:07'!
esUsadoPorGuerrero: unGuerrero paraAtacar: unMonstruo con: cantFuerza

	self subclassResponsibility! !


!classDefinition: #Baculo category: #'2024-2C-Parcial-1'!
ItemAtaque subclass: #Baculo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Baculo methodsFor: 'usado por mago' stamp: 'ml 10/1/2024 01:50:12'!
esUsadoPorMago: unMago paraAtacar: unMonstruo con: unaCantDeFuerza 
	
	unMago ataca: unMonstruo usando: unaCantDeFuerza.
! !


!Baculo methodsFor: 'usado por guerrero' stamp: 'ml 10/1/2024 01:53:03'!
esUsadoPorGuerrero: unGuerrero paraAtacar: unMonstruo con: cantFuerza 

	unMonstruo recibeDañoDeGuerreroConBaculoCon: cantFuerza .
	! !


!classDefinition: #Espada category: #'2024-2C-Parcial-1'!
ItemAtaque subclass: #Espada
	instanceVariableNames: 'objetivo'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Espada methodsFor: 'usado por mago' stamp: 'ml 10/1/2024 01:50:13'!
esUsadoPorMago: unMago paraAtacar: unMonstruo con: unaCantDeFuerza 
	
	unMago pierdePuntosDeVidaAlUsarEspada .! !


!Espada methodsFor: 'initialization' stamp: 'ml 9/30/2024 15:06:56'!
fijarObjetivo: unMonstruo

	objetivo := unMonstruo .! !


!Espada methodsFor: 'checkeo objetivo' stamp: 'ml 9/30/2024 21:54:23'!
coincideObjetivo: unMonstruo 
	
	^ objetivo = unMonstruo .! !


!Espada methodsFor: 'usado por guerrero' stamp: 'ml 10/1/2024 01:51:38'!
esUsadoPorGuerrero: unGuerrero paraAtacar: unMonstruo con: cantFuerza 
	
	(self coincideObjetivo: unMonstruo) ifTrue: [unMonstruo recibeDañoDeGuerreroConEspadaCon: cantFuerza ].! !

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

!ItemDefensa methodsFor: 'as yet unclassified' stamp: 'ml 10/1/2024 01:57:42'!
puntosDefendido

	^ cubre ! !


!classDefinition: #Armadura category: #'2024-2C-Parcial-1'!
ItemDefensa subclass: #Armadura
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Armadura methodsFor: 'initialization' stamp: 'ml 9/30/2024 22:42:29'!
initialize 
	cubre := 5 * pv! !


!classDefinition: #EscudoMagico category: #'2024-2C-Parcial-1'!
ItemDefensa subclass: #EscudoMagico
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!EscudoMagico methodsFor: 'initialization' stamp: 'ml 9/30/2024 22:42:47'!
initialize 
	
	cubre  := 3 * pv! !


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

!Monstruo methodsFor: 'initialization' stamp: 'ml 9/30/2024 22:33:21'!
midoMenosDeUnMetro

	^ altura < (100 * centimeter )! !


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