!classDefinition: #LuzDeSemaforo category: 'Semaforo'!
EllipseMorph subclass: #LuzDeSemaforo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

!LuzDeSemaforo methodsFor: 'as yet unclassified' stamp: 'HAW 8/26/2017 17:17:51'!
conectarA: unaSeñalDeSemaforo usando: unColorCuandoPrendida

	unaSeñalDeSemaforo when: #apagada send: #color: to: self with: Color black.
	unaSeñalDeSemaforo when: #prendida send: #color: to: self with: unColorCuandoPrendida.
	
! !

!LuzDeSemaforo methodsFor: 'as yet unclassified' stamp: 'HAW 8/23/2017 22:54:11'!
defaultColor

	^Color black ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LuzDeSemaforo class' category: 'Semaforo'!
LuzDeSemaforo class
	instanceVariableNames: ''!

!LuzDeSemaforo class methodsFor: 'as yet unclassified' stamp: 'HAW 8/26/2017 17:18:09'!
conectarA: unaSeñalDeSemaforo conColor: unColorCuandoPrendida en: rectanguloConLuces

	| luz |
	
	luz := self new.
	luz conectarA: unaSeñalDeSemaforo usando: unColorCuandoPrendida.
	
	rectanguloConLuces addMorph: luz.
	! !


!classDefinition: #SeñalDeAvanceDeCorrientes category: 'Semaforo'!
Light subclass: #SeñalDeAvanceDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeAvanceDeCorrientes class' category: 'Semaforo'!
SeñalDeAvanceDeCorrientes class
	instanceVariableNames: ''!

!SeñalDeAvanceDeCorrientes class methodsFor: 'control' stamp: 'HAW 10/24/2018 16:15:09'!
apagar
	
	self color: Color black ! !

!SeñalDeAvanceDeCorrientes class methodsFor: 'control' stamp: 'HAW 10/24/2018 16:15:41'!
prender
	
	self color: Color green! !


!SeñalDeAvanceDeCorrientes class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:09:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeAvanceDeMaipu category: 'Semaforo'!
SeñalDeAvanceDeCorrientes subclass: #SeñalDeAvanceDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeAvanceDeMaipu class' category: 'Semaforo'!
SeñalDeAvanceDeMaipu class
	instanceVariableNames: ''!

!SeñalDeAvanceDeMaipu class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:09:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeDetencionDeCorrientes category: 'Semaforo'!
SeñalDeAvanceDeCorrientes subclass: #SeñalDeDetencionDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeDetencionDeCorrientes class' category: 'Semaforo'!
SeñalDeDetencionDeCorrientes class
	instanceVariableNames: ''!

!SeñalDeDetencionDeCorrientes class methodsFor: 'control' stamp: 'HAW 10/24/2018 16:16:54'!
prender
	
	self color: Color red! !


!SeñalDeDetencionDeCorrientes class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:09:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeDetencionDeMaipu category: 'Semaforo'!
SeñalDeAvanceDeCorrientes subclass: #SeñalDeDetencionDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeDetencionDeMaipu class' category: 'Semaforo'!
SeñalDeDetencionDeMaipu class
	instanceVariableNames: ''!

!SeñalDeDetencionDeMaipu class methodsFor: 'control' stamp: 'HAW 10/24/2018 16:17:04'!
prender
	
	self color: Color red! !


!SeñalDeDetencionDeMaipu class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:09:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDePrecaucionDeCorrientes category: 'Semaforo'!
SeñalDeAvanceDeCorrientes subclass: #SeñalDePrecaucionDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDePrecaucionDeCorrientes class' category: 'Semaforo'!
SeñalDePrecaucionDeCorrientes class
	instanceVariableNames: ''!

!SeñalDePrecaucionDeCorrientes class methodsFor: 'control' stamp: 'HAW 10/24/2018 16:17:14'!
prender
	
	self color: Color yellow ! !


!SeñalDePrecaucionDeCorrientes class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:09:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDePrecaucionDeMaipu category: 'Semaforo'!
SeñalDeAvanceDeCorrientes subclass: #SeñalDePrecaucionDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDePrecaucionDeMaipu class' category: 'Semaforo'!
SeñalDePrecaucionDeMaipu class
	instanceVariableNames: ''!

!SeñalDePrecaucionDeMaipu class methodsFor: 'control' stamp: 'HAW 10/24/2018 16:17:22'!
prender
	
	self color: Color yellow! !


!SeñalDePrecaucionDeMaipu class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:09:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #ReguladorDeTransitoDeCorrientes category: 'Semaforo'!
ThreeLightsContainer subclass: #ReguladorDeTransitoDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReguladorDeTransitoDeCorrientes class' category: 'Semaforo'!
ReguladorDeTransitoDeCorrientes class
	instanceVariableNames: 'señalDeDetencion señalDeAvance señalDePrecaucion'!

!ReguladorDeTransitoDeCorrientes class methodsFor: 'señales' stamp: 'HAW 8/24/2017 14:39:53'!
apagarTodasLasSeñales

	self señalDeDetencion apagar.
	self señalDePrecaucion apagar.
	self señalDeAvance apagar.! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'señales' stamp: 'HAW 4/16/2018 11:56:53'!
señalDeAvance

	^ señalDeAvance.! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'señales' stamp: 'HAW 4/16/2018 11:57:02'!
señalDeDetencion

	^ señalDeDetencion.! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'señales' stamp: 'HAW 4/16/2018 11:57:14'!
señalDePrecaucion

	^ señalDePrecaucion.! !


!ReguladorDeTransitoDeCorrientes class methodsFor: 'regulacion de transito' stamp: 'HAW 8/24/2017 12:02:47'!
apagarSeñalDePrecaucion
	
	self señalDePrecaucion apagar! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'regulacion de transito' stamp: 'HAW 8/24/2017 12:02:47'!
detenerTransito

	self señalDeDetencion prender.
	! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'regulacion de transito' stamp: 'HAW 8/24/2017 14:03:49'!
permitirTransito

	self avisarQueSePermitiraPasarTransito.
	self permitirPasarTransito.
	self avisarQueSeDetendraTransito.
	self detenerTransito.
	! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'regulacion de transito' stamp: 'HAW 8/24/2017 12:02:47'!
prenderSeñalDePrecaucion
	
	self señalDePrecaucion prender! !


!ReguladorDeTransitoDeCorrientes class methodsFor: 'regulacion de transito - privado' stamp: 'HAW 8/24/2017 14:04:22'!
avisarQueSeDetendraTransito
	
	self señalDePrecaucion prender.
	(Delay for: 1*second) wait.
	self señalDePrecaucion apagar.! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'regulacion de transito - privado' stamp: 'HAW 8/24/2017 14:04:02'!
avisarQueSePermitiraPasarTransito
	
	self señalDeDetencion prender.
	self señalDePrecaucion prender.
	
	(Delay for: 1*second) wait.
	
	self señalDeDetencion apagar.
	self señalDePrecaucion apagar.! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'regulacion de transito - privado' stamp: 'HAW 8/24/2017 14:04:12'!
permitirPasarTransito
	
	self señalDeAvance prender.
	(Delay for: 2*second) wait.
	self señalDeAvance apagar.! !


!ReguladorDeTransitoDeCorrientes class methodsFor: 'ui' stamp: 'HAW 10/24/2018 16:30:39'!
createMorph

	^parent createMorph 
		addMorph: señalDeDetencion;
		addMorph: señalDePrecaucion;
		addMorph: señalDeAvance;
		yourself ! !


!ReguladorDeTransitoDeCorrientes class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:09:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	señalDeDetencion := SeñalDeDetencionDeCorrientes.
	señalDeAvance := SeñalDeAvanceDeCorrientes.
	señalDePrecaucion := SeñalDePrecaucionDeCorrientes.! !


!classDefinition: #ReguladorDeTransitoDeMaipu category: 'Semaforo'!
ReguladorDeTransitoDeCorrientes subclass: #ReguladorDeTransitoDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReguladorDeTransitoDeMaipu class' category: 'Semaforo'!
ReguladorDeTransitoDeMaipu class
	instanceVariableNames: ''!

!ReguladorDeTransitoDeMaipu class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:09:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	señalDeDetencion := SeñalDeDetencionDeMaipu.
	señalDeAvance := SeñalDeAvanceDeMaipu.
	señalDePrecaucion := SeñalDePrecaucionDeMaipu.! !


!classDefinition: #SemaforoDeMaipuYCorrientes category: 'Semaforo'!
DenotativeObjectMorph subclass: #SemaforoDeMaipuYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SemaforoDeMaipuYCorrientes class' category: 'Semaforo'!
SemaforoDeMaipuYCorrientes class
	instanceVariableNames: 'prendido regulador1 regulador2'!

!SemaforoDeMaipuYCorrientes class methodsFor: 'control' stamp: 'HAW 8/24/2017 12:11:30'!
apagar

	prendido := false.! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'control' stamp: 'HAW 4/16/2018 12:04:47'!
apagarTodasLasSeñales
	
	regulador1 apagarTodasLasSeñales.
	regulador2 apagarTodasLasSeñales.! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'control' stamp: 'HAW 8/24/2017 12:10:26'!
estaPrendido

	^ prendido.! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'control' stamp: 'HAW 9/1/2023 17:05:35'!
prender

	prendido := true.
	self 
		apagarTodasLasSeñales;
		avisarPrecaucionPorEncendido;
		regularTransito;
		apagarTodasLasSeñales! !


!SemaforoDeMaipuYCorrientes class methodsFor: 'aviso de precaucion' stamp: 'HAW 8/24/2017 12:05:33'!
avisarPrecaucionPorEncendido

	4 timesRepeat: [ self titilarSeñalDePrecaucion ].! !


!SemaforoDeMaipuYCorrientes class methodsFor: 'aviso de precaucion - privado' stamp: 'HAW 4/16/2018 12:04:21'!
apagarParaTitiladoSeñalesDePrecaucion

	regulador1 apagarSeñalDePrecaucion.
	regulador2 apagarSeñalDePrecaucion.
	self esperarTiempoDeTitilado.! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'aviso de precaucion - privado' stamp: 'HAW 8/22/2017 18:08:31'!
esperarTiempoDeTitilado

	(Delay for: 0.5 * second) wait.
	! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'aviso de precaucion - privado' stamp: 'HAW 4/16/2018 12:05:31'!
prenderParaTitiladoSeñalesDePrecaucion

	regulador1 prenderSeñalDePrecaucion.
	regulador2 prenderSeñalDePrecaucion.
	self esperarTiempoDeTitilado.
	! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'aviso de precaucion - privado' stamp: 'HAW 8/24/2017 12:15:03'!
titilarSeñalDePrecaucion

	self prenderParaTitiladoSeñalesDePrecaucion.
	self apagarParaTitiladoSeñalesDePrecaucion.

! !


!SemaforoDeMaipuYCorrientes class methodsFor: 'regular transito' stamp: 'HAW 8/24/2017 12:12:53'!
regularTransito

	[ self estaPrendido ] whileTrue: [ self detenerYPermitirTransitoDeManeraAlternada ]! !


!SemaforoDeMaipuYCorrientes class methodsFor: 'regular transito - privado' stamp: 'HAW 8/24/2017 12:11:23'!
detenerTransitoEn: unReguladorParaDetener yPermitirEn: unReguladorParaPermitir

	unReguladorParaDetener detenerTransito.
	unReguladorParaPermitir permitirTransito ! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'regular transito - privado' stamp: 'HAW 4/16/2018 12:05:12'!
detenerYPermitirTransitoDeManeraAlternada

	self detenerTransitoEn: regulador1 yPermitirEn: regulador2.
	self detenerTransitoEn: regulador2 yPermitirEn: regulador1! !


!SemaforoDeMaipuYCorrientes class methodsFor: 'ui' stamp: 'HAW 9/1/2023 17:04:41'!
createMorph

	| reguladores |
	
	reguladores := LayoutMorph newRow.
	reguladores morphExtent: 137@133.
	
	reguladores addMorph: regulador1.
	reguladores addMorph: regulador2.
	
	^reguladores 
	! !


!SemaforoDeMaipuYCorrientes class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:09:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	prendido := false.
	regulador1 := ReguladorDeTransitoDeCorrientes.
	regulador2 := ReguladorDeTransitoDeMaipu.! !

SeñalDeAvanceDeCorrientes initializeAfterFileIn!
SeñalDeAvanceDeMaipu initializeAfterFileIn!
SeñalDeDetencionDeCorrientes initializeAfterFileIn!
SeñalDeDetencionDeMaipu initializeAfterFileIn!
SeñalDePrecaucionDeCorrientes initializeAfterFileIn!
SeñalDePrecaucionDeMaipu initializeAfterFileIn!
ReguladorDeTransitoDeCorrientes initializeAfterFileIn!
ReguladorDeTransitoDeMaipu initializeAfterFileIn!
SemaforoDeMaipuYCorrientes initializeAfterFileIn!