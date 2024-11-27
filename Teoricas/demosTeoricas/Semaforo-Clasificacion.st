!classDefinition: #ReguladorDeTransito category: 'Semaforo-Clasificacion'!
Object subclass: #ReguladorDeTransito
	instanceVariableNames: 'señalDeDetencion señalDeAvance señalDePrecaucion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-Clasificacion'!

!ReguladorDeTransito methodsFor: 'regulacion de transito' stamp: 'HAW 4/16/2018 12:11:14'!
apagarSeñalDePrecaucion
	
	self señalDePrecaucion apagar! !

!ReguladorDeTransito methodsFor: 'regulacion de transito' stamp: 'HAW 4/16/2018 12:11:14'!
detenerTransito

	self señalDeDetencion prender.
	! !

!ReguladorDeTransito methodsFor: 'regulacion de transito' stamp: 'HAW 4/16/2018 12:11:14'!
permitirTransito

	self avisarQueSePermitiraPasarTransito.
	self permitirPasarTransito.
	self avisarQueSeDetendraTransito.
	self detenerTransito.
	! !

!ReguladorDeTransito methodsFor: 'regulacion de transito' stamp: 'HAW 4/16/2018 12:11:14'!
prenderSeñalDePrecaucion
	
	self señalDePrecaucion prender! !


!ReguladorDeTransito methodsFor: 'regulacion de transito - privado' stamp: 'HAW 4/16/2018 12:11:14'!
avisarQueSeDetendraTransito
	
	self señalDePrecaucion prender.
	(Delay for: 1*second) wait.
	self señalDePrecaucion apagar.! !

!ReguladorDeTransito methodsFor: 'regulacion de transito - privado' stamp: 'HAW 4/16/2018 12:11:14'!
avisarQueSePermitiraPasarTransito
	
	self señalDeDetencion prender.
	self señalDePrecaucion prender.
	
	(Delay for: 1*second) wait.
	
	self señalDeDetencion apagar.
	self señalDePrecaucion apagar.! !

!ReguladorDeTransito methodsFor: 'regulacion de transito - privado' stamp: 'HAW 4/16/2018 12:11:14'!
permitirPasarTransito
	
	self señalDeAvance prender.
	(Delay for: 2*second) wait.
	self señalDeAvance apagar.! !


!ReguladorDeTransito methodsFor: 'señales' stamp: 'HAW 4/16/2018 12:11:14'!
apagarTodasLasSeñales

	self señalDeDetencion apagar.
	self señalDePrecaucion apagar.
	self señalDeAvance apagar.! !

!ReguladorDeTransito methodsFor: 'señales' stamp: 'HAW 4/16/2018 12:11:14'!
señalDeAvance

	^ señalDeAvance.! !

!ReguladorDeTransito methodsFor: 'señales' stamp: 'HAW 4/16/2018 12:11:14'!
señalDeDetencion

	^ señalDeDetencion.! !

!ReguladorDeTransito methodsFor: 'señales' stamp: 'HAW 4/16/2018 12:11:14'!
señalDePrecaucion

	^ señalDePrecaucion.! !


!ReguladorDeTransito methodsFor: 'initialization' stamp: 'HAW 4/16/2018 12:20:24'!
initializeParandoCon: aSeñalDeDetencion avisandoPrecaucionCon: aSeñalDePrecaucion permitiendoAvanzarCon: aSeñalDeAvance

	señalDeDetencion := aSeñalDeDetencion.
	señalDePrecaucion := aSeñalDePrecaucion.
	señalDeAvance := aSeñalDeAvance ! !


!ReguladorDeTransito methodsFor: 'ui' stamp: 'HAW 4/16/2018 12:11:14'!
luces

	| rectanguloConLuces |

	rectanguloConLuces _ LayoutMorph newColumn.
	rectanguloConLuces morphExtent: 60 @ 130.
	
	LuzDeSemaforo conectarA: self señalDeDetencion conColor: Color red en: rectanguloConLuces.
	LuzDeSemaforo conectarA: self señalDePrecaucion conColor: Color yellow en: rectanguloConLuces.
	LuzDeSemaforo conectarA: self señalDeAvance conColor: Color green en: rectanguloConLuces.
	
	^rectanguloConLuces ! !

!ReguladorDeTransito methodsFor: 'ui' stamp: 'HAW 4/16/2018 12:11:14'!
mostrarConLuces

	self luces openInWorld.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReguladorDeTransito class' category: 'Semaforo-Clasificacion'!
ReguladorDeTransito class
	instanceVariableNames: ''!

!ReguladorDeTransito class methodsFor: 'instance creation' stamp: 'HAW 4/16/2018 12:18:43'!
newWithDefaults

	^self parandoCon: self defaultSeñalDeDetencion avisandoPrecaucionCon: self defaultSeñalDePrecaucion permitiendoAvanzarCon: self defaultSeñalDeAvance! !

!ReguladorDeTransito class methodsFor: 'instance creation' stamp: 'HAW 4/16/2018 12:19:20'!
parandoCon: aSeñalDeDetencion avisandoPrecaucionCon: aSeñalDePrecaucion permitiendoAvanzarCon: aSeñalDeAvance

	^self new initializeParandoCon: aSeñalDeDetencion avisandoPrecaucionCon: aSeñalDePrecaucion permitiendoAvanzarCon: aSeñalDeAvance! !


!ReguladorDeTransito class methodsFor: 'defaults' stamp: 'HAW 4/16/2018 12:19:36'!
defaultSeñalDeAvance

	^Señal new! !

!ReguladorDeTransito class methodsFor: 'defaults' stamp: 'HAW 4/16/2018 12:17:37'!
defaultSeñalDeDetencion 

	^Señal new! !

!ReguladorDeTransito class methodsFor: 'defaults' stamp: 'HAW 4/16/2018 12:19:33'!
defaultSeñalDePrecaucion

	^Señal new! !


!classDefinition: #Semaforo category: 'Semaforo-Clasificacion'!
Object subclass: #Semaforo
	instanceVariableNames: 'prendido regulador1 regulador2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-Clasificacion'!

!Semaforo methodsFor: 'control' stamp: 'HAW 4/16/2018 12:11:23'!
apagar

	prendido := false.! !

!Semaforo methodsFor: 'control' stamp: 'HAW 4/16/2018 12:11:23'!
apagarTodasLasSeñales
	
	regulador1 apagarTodasLasSeñales.
	regulador2 apagarTodasLasSeñales.! !

!Semaforo methodsFor: 'control' stamp: 'HAW 4/16/2018 12:11:23'!
estaPrendido

	^ prendido.! !

!Semaforo methodsFor: 'control' stamp: 'HAW 9/1/2023 17:12:09'!
prender

	prendido := true.
	self 
		apagarTodasLasSeñales;
		avisarPrecaucionPorEncendido;
	 	regularTransito;
		apagarTodasLasSeñales! !


!Semaforo methodsFor: 'aviso de precaucion - privado' stamp: 'HAW 4/16/2018 12:11:23'!
apagarParaTitiladoSeñalesDePrecaucion

	regulador1 apagarSeñalDePrecaucion.
	regulador2 apagarSeñalDePrecaucion.
	self esperarTiempoDeTitilado.! !

!Semaforo methodsFor: 'aviso de precaucion - privado' stamp: 'HAW 4/16/2018 12:11:23'!
esperarTiempoDeTitilado

	(Delay for: 0.5 * second) wait.
	! !

!Semaforo methodsFor: 'aviso de precaucion - privado' stamp: 'HAW 4/16/2018 12:11:23'!
prenderParaTitiladoSeñalesDePrecaucion

	regulador1 prenderSeñalDePrecaucion.
	regulador2 prenderSeñalDePrecaucion.
	self esperarTiempoDeTitilado.
	! !

!Semaforo methodsFor: 'aviso de precaucion - privado' stamp: 'HAW 4/16/2018 12:11:23'!
titilarSeñalDePrecaucion

	self prenderParaTitiladoSeñalesDePrecaucion.
	self apagarParaTitiladoSeñalesDePrecaucion.

! !


!Semaforo methodsFor: 'regular transito' stamp: 'HAW 4/16/2018 12:11:23'!
regularTransito

	[ self estaPrendido ] whileTrue: [ self detenerYPermitirTransitoDeManeraAlternada ]! !


!Semaforo methodsFor: 'regular transito - privado' stamp: 'HAW 4/16/2018 12:11:23'!
detenerTransitoEn: unReguladorParaDetener yPermitirEn: unReguladorParaPermitir

	unReguladorParaDetener detenerTransito.
	unReguladorParaPermitir permitirTransito ! !

!Semaforo methodsFor: 'regular transito - privado' stamp: 'HAW 4/16/2018 12:11:23'!
detenerYPermitirTransitoDeManeraAlternada

	self detenerTransitoEn: regulador1 yPermitirEn: regulador2.
	self detenerTransitoEn: regulador2 yPermitirEn: regulador1! !


!Semaforo methodsFor: 'ui' stamp: 'HAW 4/16/2018 12:11:23'!
mostrarConLuces

	| reguladores |
	
	reguladores := LayoutMorph newRow.
	reguladores morphExtent: 137@133.
	
	reguladores addMorph: regulador1 luces.
	reguladores addMorph: regulador2 luces.
	
	reguladores openInWorld 
	! !


!Semaforo methodsFor: 'aviso de precaucion' stamp: 'HAW 4/16/2018 12:11:23'!
avisarPrecaucionPorEncendido

	4 timesRepeat: [ self titilarSeñalDePrecaucion ].! !


!Semaforo methodsFor: 'initialization' stamp: 'HAW 9/1/2023 16:44:23'!
initializeWith: aReguladorDeTransito with: anotherReguladorDeTransito

	prendido := false.
	regulador1 := aReguladorDeTransito.
	regulador2 := anotherReguladorDeTransito ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Semaforo class' category: 'Semaforo-Clasificacion'!
Semaforo class
	instanceVariableNames: ''!

!Semaforo class methodsFor: 'instance creation' stamp: 'HAW 9/1/2023 16:44:03'!
newWithDefaults
	
	"
	self newWithDefaults inspect
	"	
	^self with: self defaultReguladorDeTransito1 with: self defaultReguladorDeTransito2! !

!Semaforo class methodsFor: 'instance creation' stamp: 'HAW 4/16/2018 12:14:01'!
with: aReguladorDeTransito with: anotherReguladorDeTransito

	^self new initializeWith: aReguladorDeTransito with: anotherReguladorDeTransito
! !


!Semaforo class methodsFor: 'defaults' stamp: 'HAW 4/16/2018 12:14:35'!
defaultReguladorDeTransito1

	^ReguladorDeTransito newWithDefaults! !

!Semaforo class methodsFor: 'defaults' stamp: 'HAW 4/16/2018 12:14:40'!
defaultReguladorDeTransito2

	^ReguladorDeTransito newWithDefaults! !


!classDefinition: #Señal category: 'Semaforo-Clasificacion'!
Object subclass: #Señal
	instanceVariableNames: 'prendida'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-Clasificacion'!

!Señal methodsFor: 'initialization' stamp: 'HAW 4/16/2018 12:12:14'!
initialize

	prendida := false! !


!Señal methodsFor: 'control' stamp: 'HAW 4/16/2018 12:11:31'!
apagar
	
	prendida := false.
	self triggerEvent: #apagada! !

!Señal methodsFor: 'control' stamp: 'HAW 4/16/2018 12:11:31'!
prender
	
	prendida := true.
	self triggerEvent: #prendida! !
!classDefinition: #LuzDeSemaforo category: 'Semaforo-UI'!
EllipseMorph subclass: #LuzDeSemaforo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-UI'!

!LuzDeSemaforo methodsFor: 'morph' stamp: 'HAW 8/26/2017 17:17:51'!
conectarA: unaSeñalDeSemaforo usando: unColorCuandoPrendida

	unaSeñalDeSemaforo when: #apagada send: #color: to: self with: Color black.
	unaSeñalDeSemaforo when: #prendida send: #color: to: self with: unColorCuandoPrendida.
	
! !

!LuzDeSemaforo methodsFor: 'morph' stamp: 'HAW 8/23/2017 22:54:11'!
defaultColor

	^Color black ! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LuzDeSemaforo class' category: 'Semaforo-UI'!
LuzDeSemaforo class
	instanceVariableNames: ''!

!LuzDeSemaforo class methodsFor: 'as yet unclassified' stamp: 'HAW 8/26/2017 17:18:09'!
conectarA: unaSeñalDeSemaforo conColor: unColorCuandoPrendida en: rectanguloConLuces

	| luz |
	
	luz := self new.
	luz conectarA: unaSeñalDeSemaforo usando: unColorCuandoPrendida.
	
	rectanguloConLuces addMorph: luz.
	! !
