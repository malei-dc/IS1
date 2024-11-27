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

!SeñalDeAvanceDeCorrientes class methodsFor: 'control' stamp: 'HAW 4/12/2021 16:48:39'!
apagar

	self color: Color black! !

!SeñalDeAvanceDeCorrientes class methodsFor: 'control' stamp: 'HAW 4/12/2021 16:48:34'!
prender

	self color: Color green! !


!SeñalDeAvanceDeCorrientes class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:01:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeAvanceDeMaipu category: 'Semaforo'!
Light subclass: #SeñalDeAvanceDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeAvanceDeMaipu class' category: 'Semaforo'!
SeñalDeAvanceDeMaipu class
	instanceVariableNames: ''!

!SeñalDeAvanceDeMaipu class methodsFor: 'control' stamp: 'HAW 4/8/2021 18:58:35'!
apagar

	self color: Color black 
	! !

!SeñalDeAvanceDeMaipu class methodsFor: 'control' stamp: 'HAW 4/8/2021 18:58:29'!
prender

	self color: Color green ! !


!SeñalDeAvanceDeMaipu class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:01:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeDetencionDeCorrientes category: 'Semaforo'!
Light subclass: #SeñalDeDetencionDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeDetencionDeCorrientes class' category: 'Semaforo'!
SeñalDeDetencionDeCorrientes class
	instanceVariableNames: ''!

!SeñalDeDetencionDeCorrientes class methodsFor: 'control' stamp: 'HAW 4/12/2021 16:48:57'!
apagar

	self color: Color black ! !

!SeñalDeDetencionDeCorrientes class methodsFor: 'control' stamp: 'HAW 4/12/2021 16:48:52'!
prender

	self color: Color red ! !


!SeñalDeDetencionDeCorrientes class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:01:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeDetencionDeMaipu category: 'Semaforo'!
Light subclass: #SeñalDeDetencionDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeDetencionDeMaipu class' category: 'Semaforo'!
SeñalDeDetencionDeMaipu class
	instanceVariableNames: ''!

!SeñalDeDetencionDeMaipu class methodsFor: 'control' stamp: 'HAW 4/8/2021 18:58:13'!
apagar

	self color: Color black ! !

!SeñalDeDetencionDeMaipu class methodsFor: 'control' stamp: 'HAW 4/8/2021 18:58:06'!
prender

	self color: Color red! !


!SeñalDeDetencionDeMaipu class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:01:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDePrecaucionDeCorrientes category: 'Semaforo'!
Light subclass: #SeñalDePrecaucionDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDePrecaucionDeCorrientes class' category: 'Semaforo'!
SeñalDePrecaucionDeCorrientes class
	instanceVariableNames: ''!

!SeñalDePrecaucionDeCorrientes class methodsFor: 'control' stamp: 'HAW 4/8/2021 19:00:49'!
apagar

	self color: Color black ! !

!SeñalDePrecaucionDeCorrientes class methodsFor: 'control' stamp: 'HAW 4/12/2021 17:55:05'!
prender

	self color: Color yellow .
	! !


!SeñalDePrecaucionDeCorrientes class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:01:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDePrecaucionDeMaipu category: 'Semaforo'!
Light subclass: #SeñalDePrecaucionDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDePrecaucionDeMaipu class' category: 'Semaforo'!
SeñalDePrecaucionDeMaipu class
	instanceVariableNames: ''!

!SeñalDePrecaucionDeMaipu class methodsFor: 'control' stamp: 'HAW 4/8/2021 17:54:32'!
apagar

	self color: Color black ! !

!SeñalDePrecaucionDeMaipu class methodsFor: 'control' stamp: 'HAW 4/12/2021 17:55:02'!
prender

	self color: Color yellow.
	
	! !


!SeñalDePrecaucionDeMaipu class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:01:40'!
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
	instanceVariableNames: 'señalDeAvance señalDePrecaucion señalDeDetencion'!

!ReguladorDeTransitoDeCorrientes class methodsFor: 'inicializacion' stamp: 'HAW 4/14/2021 09:51:19'!
inicializar

	señalDeAvance := SeñalDeAvanceDeCorrientes .
	señalDeDetencion := SeñalDeDetencionDeCorrientes .
	señalDePrecaucion := SeñalDePrecaucionDeCorrientes ! !


!ReguladorDeTransitoDeCorrientes class methodsFor: 'transito' stamp: 'HAW 4/14/2021 11:01:15'!
avisarPrecaucion

	señalDePrecaucion prender.
	(Delay for: 0.5 * second ) wait.
	señalDePrecaucion apagar! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'transito' stamp: 'HAW 4/12/2021 17:35:41'!
detenerTransito

	señalDeDetencion prender.
	! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'transito' stamp: 'HAW 4/14/2021 11:01:36'!
habilitarPasoDelTransito

	señalDeAvance prender.
	(Delay for: 2 * second ) wait.
	señalDeAvance apagar! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'transito' stamp: 'HAW 4/14/2021 11:02:00'!
permitirTransito

	señalDeDetencion apagar.
	
	self 
		avisarPrecaucion;
		habilitarPasoDelTransito;
		avisarPrecaucion.
	! !


!ReguladorDeTransitoDeCorrientes class methodsFor: 'señales' stamp: 'HAW 4/14/2021 10:59:32'!
agregarSeñales

	self 
		addMorph: señalDeDetencion;
		addMorph: señalDePrecaucion;
		addMorph: señalDeAvance 
		! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'señales' stamp: 'HAW 4/12/2021 16:47:42'!
apagarSeñalDePrecaucion

	señalDePrecaucion apagar ! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'señales' stamp: 'HAW 4/12/2021 17:35:41'!
apagarSeñales

	señalDeAvance apagar.
	señalDeDetencion apagar.
	señalDePrecaucion apagar ! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'señales' stamp: 'HAW 4/12/2021 16:48:13'!
prenderSeñalDePrecaucion

	señalDePrecaucion prender! !


!ReguladorDeTransitoDeCorrientes class methodsFor: 'ui' stamp: 'HAW 9/1/2023 16:56:26'!
createMorph

	^parent createMorph 
		addMorph: señalDeDetencion;
		addMorph: señalDePrecaucion;
		addMorph: señalDeAvance;
		yourself ! !


!ReguladorDeTransitoDeCorrientes class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:01:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	señalDeAvance := SeñalDeAvanceDeCorrientes.
	señalDePrecaucion := SeñalDePrecaucionDeCorrientes.
	señalDeDetencion := SeñalDeDetencionDeCorrientes.! !


!classDefinition: #ReguladorDeTransitoDeMaipu category: 'Semaforo'!
ThreeLightsContainer subclass: #ReguladorDeTransitoDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReguladorDeTransitoDeMaipu class' category: 'Semaforo'!
ReguladorDeTransitoDeMaipu class
	instanceVariableNames: 'señalDeDetencion señalDePrecaucion señalDeAvance'!

!ReguladorDeTransitoDeMaipu class methodsFor: 'inicializar' stamp: 'HAW 4/8/2021 18:51:51'!
inicializar

	señalDeAvance := SeñalDeAvanceDeMaipu.
	señalDeDetencion := SeñalDeDetencionDeMaipu.
	señalDePrecaucion := SeñalDePrecaucionDeMaipu ! !


!ReguladorDeTransitoDeMaipu class methodsFor: 'transito' stamp: 'HAW 4/14/2021 11:07:05'!
avisarPrecaucion

	señalDePrecaucion prender.
	(Delay for: 0.5 * second ) wait.
	señalDePrecaucion apagar! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'transito' stamp: 'HAW 4/8/2021 19:17:17'!
detenerTransito

	señalDeDetencion prender! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'transito' stamp: 'HAW 4/14/2021 11:07:11'!
habilitarPasoDelTransito

	señalDeAvance prender.
	(Delay for: 2 * second ) wait.
	señalDeAvance apagar! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'transito' stamp: 'HAW 4/14/2021 11:08:00'!
permitirTransito

	señalDeDetencion apagar.
	
	self 
		avisarPrecaucion;
		habilitarPasoDelTransito;
		avisarPrecaucion ! !


!ReguladorDeTransitoDeMaipu class methodsFor: 'señales' stamp: 'HAW 4/14/2021 10:59:32'!
agregarSeñales

	self 
		addMorph: señalDeDetencion;
		addMorph: señalDePrecaucion ;
		addMorph: señalDeAvance 
		! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'señales' stamp: 'HAW 4/8/2021 19:09:22'!
apagarSeñalDePrecaucion

	señalDePrecaucion apagar ! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'señales' stamp: 'HAW 4/12/2021 16:52:10'!
apagarSeñales

	señalDeAvance apagar.
	señalDeDetencion apagar.
	señalDePrecaucion apagar ! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'señales' stamp: 'HAW 4/8/2021 19:09:16'!
prenderSeñalDePrecaucion

	señalDePrecaucion prender! !


!ReguladorDeTransitoDeMaipu class methodsFor: 'ui' stamp: 'HAW 9/1/2023 16:56:51'!
createMorph

	^parent createMorph 
		addMorph: señalDeDetencion;
		addMorph: señalDePrecaucion;
		addMorph: señalDeAvance;
		yourself ! !


!ReguladorDeTransitoDeMaipu class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:01:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	señalDeDetencion := SeñalDeDetencionDeMaipu.
	señalDePrecaucion := SeñalDePrecaucionDeMaipu.
	señalDeAvance := SeñalDeAvanceDeMaipu.! !


!classDefinition: #SemaforoDeMaipuYCorrientes category: 'Semaforo'!
DenotativeObjectMorph subclass: #SemaforoDeMaipuYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SemaforoDeMaipuYCorrientes class' category: 'Semaforo'!
SemaforoDeMaipuYCorrientes class
	instanceVariableNames: 'prendido'!

!SemaforoDeMaipuYCorrientes class methodsFor: 'control' stamp: 'HAW 4/8/2021 19:20:49'!
apagar

	prendido := false! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'control' stamp: 'HAW 4/12/2021 16:51:17'!
prender

	prendido := true.
	
	self 
		avisarPrecaucionPorEncendido;
		regularTransito;
		apagarSeñales! !


!SemaforoDeMaipuYCorrientes class methodsFor: 'ui' stamp: 'HAW 9/1/2023 17:00:23'!
createMorph

	| reguladores |
	
	reguladores := LayoutMorph newRow.
	reguladores morphExtent: 137@133.
	
	reguladores addMorph: ReguladorDeTransitoDeCorrientes.
	reguladores addMorph: ReguladorDeTransitoDeMaipu.
	
	^reguladores  
	! !


!SemaforoDeMaipuYCorrientes class methodsFor: 'private' stamp: 'HAW 4/12/2021 16:51:40'!
apagarSeñales

	ReguladorDeTransitoDeCorrientes apagarSeñales.
	ReguladorDeTransitoDeMaipu apagarSeñales! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'private' stamp: 'HAW 4/8/2021 18:32:27'!
avisarPrecaucionPorEncendido	
	
	5 timesRepeat: [self titilarSeñalDePrecaucion]! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'private' stamp: 'HAW 4/8/2021 19:19:30'!
detenerTransitoEn: unReguladorDeTransitoADetener yPermitirEn: unReguladorDeTransitoAPermitir

	unReguladorDeTransitoADetener detenerTransito.
	unReguladorDeTransitoAPermitir permitirTransito ! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'private' stamp: 'HAW 4/8/2021 19:20:40'!
regularTransito

	[ prendido ] whileTrue: [ 
		self detenerTransitoEn: ReguladorDeTransitoDeMaipu yPermitirEn: ReguladorDeTransitoDeCorrientes.
		self detenerTransitoEn: ReguladorDeTransitoDeCorrientes yPermitirEn: ReguladorDeTransitoDeMaipu ]! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'private' stamp: 'HAW 4/8/2021 19:06:28'!
titilarSeñalDePrecaucion
	
	ReguladorDeTransitoDeMaipu prenderSeñalDePrecaucion.
	ReguladorDeTransitoDeCorrientes prenderSeñalDePrecaucion.
	(Delay for: 0.5 * second) wait.
	
	ReguladorDeTransitoDeMaipu apagarSeñalDePrecaucion.
	ReguladorDeTransitoDeCorrientes apagarSeñalDePrecaucion.
	(Delay for: 0.5 * second) wait.
	! !


!SemaforoDeMaipuYCorrientes class methodsFor: '--** private fileout/in **--' stamp: 'HAW 9/1/2023 17:01:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	prendido := false.! !


!classDefinition: #SeñalDeDetencionSilenciosa category: 'Semaforo'!
DenotativeObject subclass: #SeñalDeDetencionSilenciosa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeDetencionSilenciosa class' category: 'Semaforo'!
SeñalDeDetencionSilenciosa class
	instanceVariableNames: ''!

!SeñalDeDetencionSilenciosa class methodsFor: 'control' stamp: 'HAW 4/12/2021 17:35:03'!
apagar

	! !

!SeñalDeDetencionSilenciosa class methodsFor: 'control' stamp: 'HAW 4/12/2021 17:35:01'!
prender

	! !


!classDefinition: #SeñalCompuesta category: 'Semaforo'!
Object subclass: #SeñalCompuesta
	instanceVariableNames: 'señalSonora señalLuminica'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

!SeñalCompuesta methodsFor: 'as yet unclassified' stamp: 'HAW 4/12/2021 19:33:47'!
apagar

	señalLuminica apagar .
	señalSonora apagar ! !

!SeñalCompuesta methodsFor: 'as yet unclassified' stamp: 'HAW 4/14/2021 09:51:08'!
iniciar

	señalLuminica := SeñalDeDetencionDeCorrientes .
	señalSonora := SeñalDeDetencionSilenciosa! !

!SeñalCompuesta methodsFor: 'as yet unclassified' stamp: 'HAW 4/12/2021 19:33:47'!
prender

	señalLuminica prender.
	señalSonora prender ! !

SeñalDeAvanceDeCorrientes initializeAfterFileIn!
SeñalDeAvanceDeMaipu initializeAfterFileIn!
SeñalDeDetencionDeCorrientes initializeAfterFileIn!
SeñalDeDetencionDeMaipu initializeAfterFileIn!
SeñalDePrecaucionDeCorrientes initializeAfterFileIn!
SeñalDePrecaucionDeMaipu initializeAfterFileIn!
ReguladorDeTransitoDeCorrientes initializeAfterFileIn!
ReguladorDeTransitoDeMaipu initializeAfterFileIn!
SemaforoDeMaipuYCorrientes initializeAfterFileIn!