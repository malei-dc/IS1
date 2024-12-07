!classDefinition: #TestDePerforación category: #'ISW1-Perforaciones'!
TestCase subclass: #TestDePerforación
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:58:53'!
test01CuandoExcavaSueloArenosoConMechaSoftRemueveCapaArenosa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:58:58'!
test02CuandoExcavaSueloTierraConMechaSoftNoModificaElSuelo

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ml 9/21/2024 21:11:42'!
test03CuandoExcavaConcretoConMechaSoftSeRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.
			CapaDeSuelo tierra.} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota.].
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:59:05'!
test04CuandoExcavaSueloArenosoConMechaWidiaRemueveCapaArenosa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:59:09'!
test05CuandoExcavaSueloTierraConMechaWidiaEnDosImpactosTransformaLaCapaEnArenoso

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assert: CapaDeSuelo arenoso equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:02:45'!
test06CuandoExcavaSueloConcretoConMechaWidiaEnTresImpactosRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.	
			CapaDeSuelo tierra.
} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota.].
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ml 9/21/2024 21:26:37'!
test07CuandoExcavaSueloArenosoConMechaDiamanteRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error -  MessageNotUnderstood 
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota ].
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/8/2023 13:10:43'!
test08CuandoExcavaSueloTierraConMechaDiamanteRemueveCapa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	excavadora darGolpeDeTaladro.
	
	self assert: (CapaDeSuelo concretoConResistencia: 5) equals: excavadora capaDeSueloInmediata

	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/8/2023 13:10:48'!
test09CuandoExcavaSueloConcretoConMechaDiamanteBajaUnDecimoDeResistencia

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.
			CapaDeSuelo tierra.
			} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assert: (CapaDeSuelo concretoConResistencia: 4) equals: excavadora capaDeSueloInmediata

	
	! !


!classDefinition: #CapaDeSuelo category: #'ISW1-Perforaciones'!
Object subclass: #CapaDeSuelo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!



!CapaDeSuelo methodsFor: 'comparing' stamp: 'ml 9/21/2024 20:06:54'!
= unaCapaDeSuelo

	^(unaCapaDeSuelo isKindOf: self class) .! !

!CapaDeSuelo methodsFor: 'comparing' stamp: 'ml 9/21/2024 20:50:02'!
darGolpeCon: unaPerforadora

	self subclassResponsibility! !



"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CapaDeSuelo class' category: #'ISW1-Perforaciones'!
CapaDeSuelo class
	instanceVariableNames: ''!

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'ml 9/21/2024 20:48:30'!
arenoso
	^CapaArenoso new! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'ml 9/21/2024 20:48:47'!
concretoConResistencia: resistencia 

	^CapaConcreto new initializeConcretoConResistencia: resistencia ! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'ml 9/21/2024 20:49:07'!
tierra
	^CapaTierra new! !


!classDefinition: #CapaArenoso category: #'ISW1-Perforaciones'!
CapaDeSuelo subclass: #CapaArenoso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!


!CapaArenoso methodsFor: 'golpear' stamp: 'ml 9/21/2024 20:50:35'!
darGolpeCon:  unaPerforadora

	unaPerforadora darGolpeDeTaladroSobreSueloArenoso .! !


!classDefinition: #CapaConcreto category: #'ISW1-Perforaciones'!
CapaDeSuelo subclass: #CapaConcreto
	instanceVariableNames: 'resistencia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!


!CapaConcreto methodsFor: 'bajar resistencia' stamp: 'ml 9/21/2024 20:01:47'!
bajaUnDecimoDeResistencia
	resistencia := resistencia - 1! !

!CapaConcreto methodsFor: 'bajar resistencia' stamp: 'ml 9/21/2024 20:04:44'!
sinResistencia
	^resistencia = 0! !


!CapaConcreto methodsFor: 'comparing' stamp: 'ml 9/21/2024 20:03:18'!
hash

	^tipo hash + resistencia hash! !


!CapaConcreto methodsFor: 'initialization' stamp: 'ml 9/21/2024 20:04:57'!
initializeConcretoConResistencia: resistenciaInicial 

	resistencia := resistenciaInicial.
	! !


!CapaConcreto methodsFor: 'accessing' stamp: 'ml 9/21/2024 20:04:35'!
resistencia

	^ resistencia.! !


!CapaConcreto methodsFor: 'golpear' stamp: 'ml 9/21/2024 20:51:20'!
darGolpeCon:  unaPerforadora

	unaPerforadora darGolpeDeTaladroSobreSueloConcreto .! !


!classDefinition: #CapaTierra category: #'ISW1-Perforaciones'!
CapaDeSuelo subclass: #CapaTierra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!


!CapaTierra methodsFor: 'golpear' stamp: 'ml 9/21/2024 20:52:38'!
darGolpeCon:  unaPerforadora

	unaPerforadora darGolpeDeTaladroSobreSueloTierra .! !


!classDefinition: #Mecha category: #'ISW1-Perforaciones'!
Object subclass: #Mecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!Mecha methodsFor: 'as yet unclassified' stamp: 'ml 9/20/2024 13:41:31'!
darGolpeCon:  unaPerforadora

	unaPerforadora darGolpeDeTaladroConMecha .! !

!Mecha methodsFor: 'as yet unclassified' stamp: 'ml 9/21/2024 21:28:37'!
estaRota

 ^false! !

!Mecha methodsFor: 'as yet unclassified' stamp: 'ml 9/20/2024 12:35:44'!
golpearSueloArenosoCon: unaPerforadora

	self subclassResponsibility! !

!Mecha methodsFor: 'as yet unclassified' stamp: 'ml 9/20/2024 12:36:00'!
golpearSueloConcretoCon: unaPerforadora

	self subclassResponsibility! !

!Mecha methodsFor: 'as yet unclassified' stamp: 'ml 9/20/2024 12:36:05'!
golpearSueloTierraCon: unaPerforadora

	self subclassResponsibility! !


!classDefinition: #Diamante category: #'ISW1-Perforaciones'!
Mecha subclass: #Diamante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!Diamante methodsFor: 'as yet unclassified' stamp: 'ml 9/20/2024 12:44:15'!
golpearSueloArenosoCon: unaPerforadora

	unaPerforadora darGolpeDeTaladroSobreSueloArenosoConMechaDiamante .! !

!Diamante methodsFor: 'as yet unclassified' stamp: 'ml 9/21/2024 20:57:57'!
golpearSueloConcretoCon: unaPerforadora

	unaPerforadora darGolpeDeTaladroSobreSueloConcretoConMechaDiamante.! !

!Diamante methodsFor: 'as yet unclassified' stamp: 'ml 9/20/2024 13:07:01'!
golpearSueloTierraCon: unaPerforadora

	unaPerforadora darGolpeDeTaladroSobreSueloTierraConMechaDiamante .! !


!classDefinition: #MechaRota category: #'ISW1-Perforaciones'!
Mecha subclass: #MechaRota
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!MechaRota methodsFor: 'as yet unclassified' stamp: 'ml 9/21/2024 21:12:12'!
estaRota

	^true ! !


!classDefinition: #Soft category: #'ISW1-Perforaciones'!
Mecha subclass: #Soft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!Soft methodsFor: 'as yet unclassified' stamp: 'ml 9/20/2024 12:44:54'!
golpearSueloArenosoCon: unaPerforadora

	unaPerforadora darGolpeDeTaladroSobreSueloArenosoConMechaSoft .! !

!Soft methodsFor: 'as yet unclassified' stamp: 'ml 9/21/2024 20:58:48'!
golpearSueloConcretoCon: unaPerforadora

	unaPerforadora darGolpeDeTaladroSobreSueloConcretoConMechaSoft .! !

!Soft methodsFor: 'as yet unclassified' stamp: 'ml 9/20/2024 13:07:24'!
golpearSueloTierraCon: unaPerforadora

	unaPerforadora darGolpeDeTaladroSobreSueloTierraConMechaSoft .! !


!classDefinition: #Widia category: #'ISW1-Perforaciones'!
Mecha subclass: #Widia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!Widia methodsFor: 'as yet unclassified' stamp: 'ml 9/20/2024 12:45:39'!
golpearSueloArenosoCon: unaPerforadora

	unaPerforadora darGolpeDeTaladroSobreSueloArenosoConMechaWidia .! !

!Widia methodsFor: 'as yet unclassified' stamp: 'ml 9/21/2024 20:59:29'!
golpearSueloConcretoCon: unaPerforadora

	unaPerforadora darGolpeDeTaladroSobreSueloConcretoConMechaWidia .! !

!Widia methodsFor: 'as yet unclassified' stamp: 'ml 9/20/2024 13:08:30'!
golpearSueloTierraCon: unaPerforadora

	unaPerforadora darGolpeDeTaladroSobreSueloTierraConMechaWidia .! !


!classDefinition: #Perforadora category: #'ISW1-Perforaciones'!
Object subclass: #Perforadora
	instanceVariableNames: 'mechaPuesta vecesQueGolpeoCapaActual capasDeSueloDebajo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!Perforadora methodsFor: 'perforar' stamp: 'ml 9/20/2024 13:40:13'!
darGolpeDeTaladro

	mechaPuesta darGolpeCon: self.
		
	"self sinMecha ifTrue: [self error: 'No puede perforar'].

	vecesQueGolpeoCapaActual := vecesQueGolpeoCapaActual + 1.

	self sobreSueloArenoso ifTrue: [
		mechaPuesta = #Soft ifTrue: [ ^self pasarAProximaCapa ].
		mechaPuesta = #Widia ifTrue: [ ^self pasarAProximaCapa ].
		mechaPuesta = #Diamante ifTrue: [ mechaPuesta := #Rota. self error: 'Se rompió' ].
		^self].
	
	self sobreSueloTierra ifTrue: [
		mechaPuesta = #Soft ifTrue: [ ^self ].
		mechaPuesta = #Widia ifTrue: [ 
			vecesQueGolpeoCapaActual = 2 ifTrue: [ ^self transformarCapaEnArenoso ].
			^self ].
		mechaPuesta = #Diamante ifTrue: [ ^self pasarAProximaCapa ]].
	
	self sobreSueloConcreto ifTrue: [
		mechaPuesta = #Soft ifTrue: [ mechaPuesta := #Rota. self error: 'Se rompió'  ].
		mechaPuesta = #Widia ifTrue: [ 
			vecesQueGolpeoCapaActual = 3 ifTrue: [ mechaPuesta := #Rota. self error: 'Se rompió' ].
			^self ].
		mechaPuesta = #Diamante ifTrue: [ 
			vecesQueGolpeoCapaActual even ifTrue: [ capasDeSueloDebajo first bajaUnDecimoDeResistencia].
			capasDeSueloDebajo first sinResistencia ifTrue: [ ^self transformarCapaEnArenoso].
			^vecesQueGolpeoCapaActual ]].
	
	self error: 'error'"! !

!Perforadora methodsFor: 'perforar' stamp: 'ml 9/21/2024 20:31:45'!
darGolpeDeTaladroConMecha
		
	vecesQueGolpeoCapaActual := vecesQueGolpeoCapaActual + 1.
	
	self capaDeSueloInmediata darGolpeCon: self.
	
	
	
! !

!Perforadora methodsFor: 'perforar' stamp: 'ml 9/18/2024 22:17:45'!
darGolpeDeTaladroSinMecha

	^ self error: 'No puede perforar'.! !


!Perforadora methodsFor: 'cambiar capa' stamp: 'ARM 9/3/2024 16:45:24'!
pasarAProximaCapa
	vecesQueGolpeoCapaActual := 0.
	capasDeSueloDebajo := capasDeSueloDebajo allButFirst.
	capasDeSueloDebajo ifEmpty: [^self].! !

!Perforadora methodsFor: 'cambiar capa' stamp: 'ARM 4/27/2023 20:46:30'!
transformarCapaEnArenoso
	capasDeSueloDebajo :=
			capasDeSueloDebajo allButFirst asOrderedCollection
			addFirst: CapaDeSuelo arenoso;
			yourself! !


!Perforadora methodsFor: 'initialization' stamp: 'ml 9/20/2024 10:08:36'!
initializeSobreSuelo: capasDeSueloAExcavarInicialmente

	capasDeSueloDebajo := capasDeSueloAExcavarInicialmente.
	vecesQueGolpeoCapaActual := 0.
	mechaPuesta := PerforadoraSinMecha new! !


!Perforadora methodsFor: 'accessing' stamp: 'ARM 4/27/2023 20:17:21'!
capaDeSueloInmediata
	^capasDeSueloDebajo first! !

!Perforadora methodsFor: 'accessing' stamp: 'ml 9/20/2024 13:37:35'!
conMechaRota

	^mechaPuesta estaRota .! !

!Perforadora methodsFor: 'accessing' stamp: 'ml 9/18/2024 22:06:09'!
sinMecha

	^mechaPuesta noTieneMechaPuesta! !



!Perforadora methodsFor: 'colocar mecha' stamp: 'ml 9/20/2024 11:38:28'!
ponerMechaDiamante
	mechaPuesta := Diamante new! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'ml 9/20/2024 11:38:17'!
ponerMechaSoft
	mechaPuesta := Soft new! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'ml 9/20/2024 11:38:11'!
ponerMechaWidia
	mechaPuesta := Widia new! !


!Perforadora methodsFor: 'perforar-tierra' stamp: 'ml 9/20/2024 12:47:14'!
darGolpeDeTaladroSobreSueloTierra

	mechaPuesta golpearSueloTierraCon: self.
	
	"	self sobreSueloTierra ifTrue: [
		mechaPuesta = #Soft ifTrue: [ ^self ].
		mechaPuesta = #Widia ifTrue: [ 
			vecesQueGolpeoCapaActual = 2 ifTrue: [ ^self transformarCapaEnArenoso ].
			^self ].
		mechaPuesta = #Diamante ifTrue: [ ^self pasarAProximaCapa ]]."

! !

!Perforadora methodsFor: 'perforar-tierra' stamp: 'ml 9/20/2024 12:59:30'!
darGolpeDeTaladroSobreSueloTierraConMechaDiamante

		^self pasarAProximaCapa

! !

!Perforadora methodsFor: 'perforar-tierra' stamp: 'ml 9/20/2024 12:49:54'!
darGolpeDeTaladroSobreSueloTierraConMechaSoft
	
	 ^self 
	
! !

!Perforadora methodsFor: 'perforar-tierra' stamp: 'ml 9/20/2024 12:51:39'!
darGolpeDeTaladroSobreSueloTierraConMechaWidia

	vecesQueGolpeoCapaActual = 2 ifTrue: [ self transformarCapaEnArenoso ].
	 
! !


!Perforadora methodsFor: 'perforar-concreto' stamp: 'ml 9/20/2024 13:11:41'!
darGolpeDeTaladroSobreSueloConcreto

	mechaPuesta golpearSueloConcretoCon: self.

"	self sobreSueloConcreto ifTrue: [
		mechaPuesta = #Soft ifTrue: [ mechaPuesta := #Rota. self error: 'Se rompió'  ].
		mechaPuesta = #Widia ifTrue: [ 
			vecesQueGolpeoCapaActual = 3 ifTrue: [ mechaPuesta := #Rota. self error: 'Se rompió' ].
			^self ].
		mechaPuesta = #Diamante ifTrue: [ 
			vecesQueGolpeoCapaActual even ifTrue: [ capasDeSueloDebajo first bajaUnDecimoDeResistencia].
			capasDeSueloDebajo first sinResistencia ifTrue: [ ^self transformarCapaEnArenoso].
			^vecesQueGolpeoCapaActual ]]."! !

!Perforadora methodsFor: 'perforar-concreto' stamp: 'ml 9/20/2024 13:18:32'!
darGolpeDeTaladroSobreSueloConcretoConMechaDiamante

	vecesQueGolpeoCapaActual even ifTrue: [ capasDeSueloDebajo first bajaUnDecimoDeResistencia].
	capasDeSueloDebajo first sinResistencia ifTrue: [ ^self transformarCapaEnArenoso].
	^vecesQueGolpeoCapaActual .! !

!Perforadora methodsFor: 'perforar-concreto' stamp: 'ml 9/20/2024 13:15:29'!
darGolpeDeTaladroSobreSueloConcretoConMechaSoft

		mechaPuesta := MechaRota new. self error: 'Se rompió' .! !

!Perforadora methodsFor: 'perforar-concreto' stamp: 'ml 9/20/2024 13:16:46'!
darGolpeDeTaladroSobreSueloConcretoConMechaWidia

	vecesQueGolpeoCapaActual = 3 ifTrue: [ mechaPuesta := MechaRota new. self error: 'Se rompió' ].
! !


!Perforadora methodsFor: 'perforar-arenoso' stamp: 'ml 9/20/2024 12:59:56'!
darGolpeDeTaladroSobreSueloArenoso

	mechaPuesta golpearSueloArenosoCon: self.

"	self sobreSueloArenoso ifTrue: [
		mechaPuesta = #Soft ifTrue: [ ^self pasarAProximaCapa ].
		mechaPuesta = #Widia ifTrue: [ ^self pasarAProximaCapa ].
		mechaPuesta = #Diamante ifTrue: [ mechaPuesta := #Rota. self error: 'Se rompió' ].
		^self]."! !

!Perforadora methodsFor: 'perforar-arenoso' stamp: 'ml 9/20/2024 12:41:19'!
darGolpeDeTaladroSobreSueloArenosoConMechaDiamante

	mechaPuesta = MechaRota new.  self error: 'Se rompió' .! !

!Perforadora methodsFor: 'perforar-arenoso' stamp: 'ml 9/20/2024 12:39:43'!
darGolpeDeTaladroSobreSueloArenosoConMechaSoft
 
	^self pasarAProximaCapa! !

!Perforadora methodsFor: 'perforar-arenoso' stamp: 'ml 9/20/2024 12:38:45'!
darGolpeDeTaladroSobreSueloArenosoConMechaWidia

	^self pasarAProximaCapa ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Perforadora class' category: #'ISW1-Perforaciones'!
Perforadora class
	instanceVariableNames: ''!

!Perforadora class methodsFor: 'instance creation' stamp: 'ARM 4/27/2023 20:07:05'!
sobreSuelo: capasDeSueloAExcavar 

	^self new initializeSobreSuelo: capasDeSueloAExcavar ! !


!classDefinition: #PerforadoraSinMecha category: #'ISW1-Perforaciones'!
Object subclass: #PerforadoraSinMecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!PerforadoraSinMecha methodsFor: 'as yet unclassified' stamp: 'ml 9/18/2024 22:16:52'!
darGolpeCon: unaPerforadora 
	unaPerforadora darGolpeDeTaladroSinMecha! !

!PerforadoraSinMecha methodsFor: 'as yet unclassified' stamp: 'ml 9/18/2024 22:06:47'!
noTieneMechaPuesta

	^ true.! !
