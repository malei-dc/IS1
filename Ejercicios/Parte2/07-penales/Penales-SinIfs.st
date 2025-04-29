!classDefinition: #PenalesTest category: #Penales!
TestCase subclass: #PenalesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test01DelanteroNoPuedeApuntarHaciaAfueraDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: -1@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test02DelanteroNoPuedeApuntarHaciaAfueraDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 3@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test03DelanteroNoPuedeApuntarHaciaAbajoDelArco
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@-1 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test04DelanteroNoPuedeApuntarHaciaArribaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@3 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test05ArqueroNoPuedePasarseDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: -1@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test06ArqueroNoPuedePasarseDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 3@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test07ArqueroNoPuedeMeterseAbajoDeLaTierra
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@-1.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test08ArqueroNoPuedeSaltarPorEncimaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@3.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test09DireccionesDiferentesGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante
	"varXXXX es por VAR, de 'Video Assistant Referee'"! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test10MismasDireccionesInsuficienteFuerzaGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 10.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test11MismasDireccionesSuficienteFuerzaAtajaArquero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test12DelanteroQueTiraAColocarPierde50PorcFuerza
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"(delantero sacrificia potencia para ganar mayor precisión)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test13ArqueroQueEligeAntesDeTiroVsJabulaniAColocarSuma50PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige donde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	"(el arquero llega más cómodo y aprovecha mejor su fuerza)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 34.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 51 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test14FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige adonde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 32.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 48 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test15ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAColocarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que espera y se adelanta ante un tiro de jabulani a colocar ignora la 2da coordenada (altura) al atajar..."	
	"(al adelanterse encara la pelota antes de que su elevación se transforme en un problema)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test16PelotaPlayeraUsadaAColocarLeHacePerder20PorcFuerzaExtraAlDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% de fuerza adicional al delantero que la use para colocar... (no importa el arquero)"
	"(no debería ser reglamentaria... al menos no es de trapo, nos responden)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test17ArqueroQueEligeAntesDeTiroVsPlayeraAColocarSuma100PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	"(a quien madruga...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 20.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test18FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsPlayeraAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 19.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 38 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test19ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAColocarEsDescubiertoYPuntoParaDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Arquero que espera y se adelanta ante tiro con la lenta pelota playera, siempre es descubierto por el Árbitro, y el punto se le otorga al Delantero..."
	"(lo que servía de ventaja ante la Jabulani rápida, acá es tan obvio por lo que tarda en llegar la pelota al arco, que marchás preso...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:52'!
test20DelanteroTiraAMatarAlAnguloInferiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:47'!
test21DelanteroTiraAMatarAlAnguloSuperiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:41'!
test22DelanteroTiraAMatarAlAnguloInferiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:36'!
test23DelanteroTiraAMatarAlAnguloSuperiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:29'!
test24DelanteroTiraAMatarNoAlAnguloMantieneDireccionTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@1.

	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test25DelanteroTiraAMatarUsa100PorcFuerzaBase
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:150.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 150 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test26DelanteroTiraAMatarConJabulaniGana20PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	"(Jabulani a matar es la elección de los guerreros Z)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 120.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test27FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAMatar
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 119.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test28ArqueroQueEligeAntesDeTiroVsJabulaniAMatarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que elige donde tirarse antes de un tiro de jabulani a matar, ignora la 2da coordenada (altura) al atajar..."		
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test29ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAMatarNuncaAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera a ver la dirección del remate de una pelota jabulani rápida a matar antes de lanzarse, nunca la ataja sin importar nada, siquiera que se adelantó..."	
	"(su poder era de más de 9000!! era impresionante, no podía moverme, sólo la ví pasar... f )"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@1 arqueroSeLanzaEnDirección: 1@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test30DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAdentro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(y voló.. y me hizo volar... y yo volé de él...  pero acá por la arbolada... y el voló.. y se estrelló por acá por la pared...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 1@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test31DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAfuera
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(El caso auspiciado por el Pipita...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@1 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@3 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test32ArqueroQueEligeAntesDeTiroVsPlayeraAMatarAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 18:39:22'!
test33ArqueroQueEligeAntesDeTiroVsPlayeraAMatarNoAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test34ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAMatarSiempreAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera y se adelanta ante una pelota playera lenta a matar, siempre la ataja sin importar nada..."	
	"(como la pelota es taaaan lentaaa, el arquero se puede ir a tomar un cafe, verse una serie, volver y aún atajar la pelota habiendose tirado a cualquier lado. Pero igual es más rapida que cuando se la tira a colocar, donde indefectiblemente el arbitro lo detecta...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !


!classDefinition: #Arquero category: #Penales!
Object subclass: #Arquero
	instanceVariableNames: 'estrategia fuerza'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Arquero methodsFor: 'initialization' stamp: 'ml 4/28/2025 16:47:03'!
initializeConTipoAtajada: tipoAtajada conFuerzaBase: fuerzaBase 
	
	estrategia := tipoAtajada.
	fuerza := fuerzaBase .! !


!Arquero methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 16:47:35'!
estrategia
	^estrategia ! !

!Arquero methodsFor: 'as yet unclassified' stamp: 'ml 4/26/2025 18:25:45'!
fuerza
	^fuerza! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arquero class' category: #Penales!
Arquero class
	instanceVariableNames: ''!

!Arquero class methodsFor: 'instance creation' stamp: 'ml 4/28/2025 16:57:47'!
eligeDireccionAntesDeTiroSuFuerzaBaseEs: unaFuerzaBase 


	^self new initializeConTipoAtajada: (EligeDireccionAntesDeTiro new) conFuerzaBase: unaFuerzaBase ! !

!Arquero class methodsFor: 'instance creation' stamp: 'ml 4/28/2025 16:58:06'!
esperaPorTiroYSeAdelantaSuFuerzaBaseEs: fuerzaBase 

	^self new initializeConTipoAtajada: (EsperaPorTiroYSeAdelanta new) conFuerzaBase: fuerzaBase ! !


!classDefinition: #Delantero category: #Penales!
Object subclass: #Delantero
	instanceVariableNames: 'fuerza estrategia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Delantero methodsFor: 'initialization' stamp: 'ml 4/28/2025 21:47:17'!
disminuyeFuerzaAMitad: fuerzaBase

	^ fuerza := fuerzaBase /2! !

!Delantero methodsFor: 'initialization' stamp: 'ml 4/28/2025 21:51:06'!
initializeCon: fuerzaBase tipoDeGolpe: unTipoDeGolpe  
	
	estrategia := unTipoDeGolpe.
	fuerza := 	estrategia determinaFuerza: fuerzaBase en: self.
	"
	(estrategia = #AColocar) 
	ifTrue:[self disminuirFuerzaAMitad: fuerzaBase.]
	ifFalse:[	self usarTodaLa: fuerzaBase.]
	"! !

!Delantero methodsFor: 'initialization' stamp: 'ml 4/28/2025 21:47:02'!
usaTodaLa: fuerzaBase

	^ fuerza:= fuerzaBase! !


!Delantero methodsFor: 'as yet unclassified' stamp: 'ml 4/26/2025 18:39:42'!
fuerza
	
	^fuerza! !

!Delantero methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 21:58:26'!
patea
	
	^estrategia ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Delantero class' category: #Penales!
Delantero class
	instanceVariableNames: ''!

!Delantero class methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 21:41:33'!
decideTirarAColocarSuFuerzaBaseEs: fuerzaBase 
	
	^self new initializeCon: fuerzaBase tipoDeGolpe: AColocar new .! !

!Delantero class methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 21:42:14'!
decideTirarAMatarSuFuerzaBaseEs: fuerzaBase 
	
	^self new initializeCon: fuerzaBase tipoDeGolpe: AMatar new .! !


!classDefinition: #EstrategiaArquero category: #Penales!
Object subclass: #EstrategiaArquero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!EstrategiaArquero methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 19:54:58'!
contraUnTiroAColocarConJabulaniEn: unaRondaDePenales

	self subclassResponsibility! !

!EstrategiaArquero methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 19:52:25'!
contraUnTiroAColocarConPlayeraEn: unaRondaDePenales

	self subclassResponsibility! !

!EstrategiaArquero methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 19:18:45'!
contraUnTiroAColocarEn: unaRondaPenales con: direccionSalto y: pelota

	self  subclassResponsibility.! !

!EstrategiaArquero methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 16:55:52'!
contraUnTiroAMatarConJAbulaniEn: unaRondaDePenales con: direccionDeSalto 

	self subclassResponsibility! !

!EstrategiaArquero methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 17:24:44'!
contraUnTiroAMatarConPlayeraEn: unaRondaDePenales con: direccionSalto

	self subclassResponsibility! !


!classDefinition: #EligeDireccionAntesDeTiro category: #Penales!
EstrategiaArquero subclass: #EligeDireccionAntesDeTiro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!EligeDireccionAntesDeTiro methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 19:54:44'!
contraUnTiroAColocarConJabulaniEn: unaRondaDePenales

	unaRondaDePenales aumentaFuerzaAtajada50Porciento .
						"
						(arqueroActual estrategia =#EligeDireccionAntesDeTiro)
						ifTrue: [self aumentaFuerzaAtajada50Porciento]			
						"! !

!EligeDireccionAntesDeTiro methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 20:19:58'!
contraUnTiroAColocarConPlayeraEn: unaRondaDePenales

	unaRondaDePenales aumentaFuerzaAtajadaElDoble.
	unaRondaDePenales determinoPuntoSegunFuerzasAtajadaVsTiro .
						"
						(arqueroActual estrategia = #EligeDireccionAntesDeTiro) 
							ifTrue: [self aumentaFuerzaAtajadaElDoble]
							ifFalse: [self puntoDelantero]
							"! !

!EligeDireccionAntesDeTiro methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 19:50:44'!
contraUnTiroAColocarEn: unaRondaPenales con: direccionSalto y: pelota   


					
					! !

!EligeDireccionAntesDeTiro methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 16:56:14'!
contraUnTiroAMatarConJAbulaniEn: unaRondaDePenales con: direccionDeSalto 

	unaRondaDePenales ignoraAlturaParaAtajar: direccionDeSalto.! !

!EligeDireccionAntesDeTiro methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 17:28:20'!
contraUnTiroAMatarConPlayeraEn:unaRondaDePenales con: direccionSalto
	
	unaRondaDePenales determinarPuntoSiCoincideAltura: direccionSalto							.
! !


!classDefinition: #EsperaPorTiroYSeAdelanta category: #Penales!
EstrategiaArquero subclass: #EsperaPorTiroYSeAdelanta
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!EsperaPorTiroYSeAdelanta methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 19:58:32'!
contraUnTiroAColocarConJabulaniEn: unaRondaDePenales

! !

!EsperaPorTiroYSeAdelanta methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 20:16:04'!
contraUnTiroAColocarConPlayeraEn: unaRondaDePenales

	unaRondaDePenales puntoDelantero.

! !

!EsperaPorTiroYSeAdelanta methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 19:20:25'!
contraUnTiroAColocarEn: unaRondaPenales con: direccionSalto y: pelota

	unaRondaPenales ignoraAlturaParaAtajar: direccionSalto .
					"
				(arqueroActual estrategia = #EsperaPorTiroYSeAdelanta) 
				ifTrue:[ self ignoraAlturaParaAtajar: direccionSalto						]
				]
				ifFalse: [		self xxxxxx: pelota				].
				"! !

!EsperaPorTiroYSeAdelanta methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 16:55:53'!
contraUnTiroAMatarConJAbulaniEn: unaRondaDePenales con: direccionDeSalto 

	unaRondaDePenales puntoDelantero! !

!EsperaPorTiroYSeAdelanta methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 17:28:37'!
contraUnTiroAMatarConPlayeraEn:unaRondaDePenales con: direccionSalto
	
	unaRondaDePenales puntoArquero.
! !


!classDefinition: #EstrategiaDelantero category: #Penales!
Object subclass: #EstrategiaDelantero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!EstrategiaDelantero methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 21:50:55'!
determinaFuerza: fuerzaBase en: unDelantero

	self subclassResponsibility! !

!EstrategiaDelantero methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 22:03:06'!
una: pelota hacia: direccionPelota arqueroSaltaHacia: direccionSalto en: unaRondaDePenales

	self subclassResponsibility! !


!classDefinition: #AColocar category: #Penales!
EstrategiaDelantero subclass: #AColocar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!AColocar methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 21:50:55'!
determinaFuerza: fuerzaBase en: unDelantero

	^unDelantero disminuyeFuerzaAMitad: fuerzaBase .
	"
	(estrategia = #AColocar) 
	ifTrue:[self disminuirFuerzaAMitad: fuerzaBase.]
	ifFalse:[	self usarTodaLa: fuerzaBase.]
	"! !

!AColocar methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 22:02:44'!
una: pelota hacia: direccionPelota arqueroSaltaHacia: direccionSalto en: unaRondaDePenales

	unaRondaDePenales arqueroSaltaHacia: direccionSalto porUnTiroAColocarDe: pelota.
	
	"(delanteroActual patea = #AMatar) 
	ifTrue: [	
		self pateaAMatarLa: pelota arqueroSaltaHacia: direccionSalto delanteroApuntaHacia: direccionPelota.
		].
	(delanteroActual patea = #AColocar) 
	ifTrue: [	
		self arqueroSaltaHacia: direccionSalto unTiroAColocarDe: pelota
		].
	"! !


!classDefinition: #AMatar category: #Penales!
EstrategiaDelantero subclass: #AMatar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!AMatar methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 21:50:55'!
determinaFuerza: fuerzaBase en: unDelantero

	^unDelantero usaTodaLa: fuerzaBase .
	"
	(estrategia = #AColocar) 
	ifTrue:[self disminuirFuerzaAMitad: fuerzaBase.]
	ifFalse:[	self usarTodaLa: fuerzaBase.]
	"! !

!AMatar methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 22:01:17'!
una: pelota hacia: direccionPelota arqueroSaltaHacia: direccionSalto en: unaRondaDePenales

	unaRondaDePenales pateaAMatarLa: pelota arqueroSaltaHacia: direccionSalto delanteroApuntaHacia: direccionPelota.
	
	"(delanteroActual patea = #AMatar) 
	ifTrue: [	
		self pateaAMatarLa: pelota arqueroSaltaHacia: direccionSalto delanteroApuntaHacia: direccionPelota.
		].
	(delanteroActual patea = #AColocar) 
	ifTrue: [	
		self arqueroSaltaHacia: direccionSalto unTiroAColocarDe: pelota
		].
	"! !


!classDefinition: #Pelota category: #Penales!
Object subclass: #Pelota
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!


!Pelota methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 21:20:41'!
pateadoAMatarYArqueroSaltaHacia: direccionSalto con: direccionPelota en: unaRondaDePenales

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pelota class' category: #Penales!
Pelota class
	instanceVariableNames: ''!

!Pelota class methodsFor: 'instance creation' stamp: 'ml 4/28/2025 20:39:22'!
jabulaniSudafricanaRapida

	^Jabulani new! !

!Pelota class methodsFor: 'instance creation' stamp: 'ml 4/28/2025 20:39:52'!
playeraLentaCostaAzul

	^Playera new! !


!classDefinition: #Jabulani category: #Penales!
Pelota subclass: #Jabulani
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Jabulani methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 21:06:03'!
pateadoAColocarEn: unaRondaDePenales

	unaRondaDePenales jabulaniEsPateadoAColocar 
				"
				(pelota tipo = #Playera) 
					ifTrue: [
						self playeraEsPateadoAColocar.
						].
				(pelota tipo = #JabulaniSudafricana) 
					ifTrue: [
						self jabulaniEsPateadoAColocar.
					].
				"! !

!Jabulani methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 21:20:41'!
pateadoAMatarYArqueroSaltaHacia: direccionSalto con: direccionPelota en: unaRondaDePenales

	unaRondaDePenales jabulaniEsPateadoAMatarYArqueroSaltaHacia: direccionSalto.

			"
			(pelota tipo = #JabulaniSudafricana) 			ifTrue: [
				self jabulaniEsPateadoAMatarYArqueroSaltaHacia: direccionSalto.
				].
			(pelota tipo = #Playera) ifTrue: [				
				self playeraEsPateadoAMatarYArqueroSaltaHacia: direccionSalto
				]
			"! !


!classDefinition: #Playera category: #Penales!
Pelota subclass: #Playera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Playera methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 21:05:42'!
pateadoAColocarEn: unaRondaDePenales

	unaRondaDePenales playeraEsPateadoAColocar 
				"
				(pelota tipo = #Playera) 
					ifTrue: [
						self playeraEsPateadoAColocar.
						].
				(pelota tipo = #JabulaniSudafricana) 
					ifTrue: [
						self jabulaniEsPateadoAColocar.
					].
				"! !

!Playera methodsFor: 'as yet unclassified' stamp: 'ml 4/28/2025 21:22:24'!
pateadoAMatarYArqueroSaltaHacia: direccionSalto con: direccionPelota en: unaRondaDePenales

	unaRondaDePenales playeraEsPateadoAMatarYArqueroSaltaHacia: direccionSalto con: direccionPelota 

			"
			(pelota tipo = #JabulaniSudafricana) 			ifTrue: [
				self jabulaniEsPateadoAMatarYArqueroSaltaHacia: direccionSalto.
				].
			(pelota tipo = #Playera) ifTrue: [				
				self playeraEsPateadoAMatarYArqueroSaltaHacia: direccionSalto
				]
			"! !


!classDefinition: #Penales category: #Penales!
Object subclass: #Penales
	instanceVariableNames: 'delanteroActual arqueroActual puntajeArquero puntajeDelantero varDireccionRemate varFuerzaTiro varFuerzaAtajada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Penales methodsFor: 'initialization' stamp: 'ml 4/28/2025 17:16:41'!
initializeConDelantero: delantero yArquero: arquero 

	delanteroActual := delantero.
	arqueroActual := arquero.
	puntajeArquero := 0.
	puntajeDelantero:=0.! !


!Penales methodsFor: 'puntaje' stamp: 'ml 4/26/2025 18:00:19'!
puntajeDeArquero
	
	^puntajeArquero ! !

!Penales methodsFor: 'puntaje' stamp: 'ml 4/26/2025 18:00:02'!
puntajeDeDelantero

	^puntajeDelantero ! !


!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 22:01:42'!
arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: direccionPelota arqueroSeLanzaEnDirección: direccionSalto.

	self asertarDireccionEnRango: direccionPelota conMsgError: self class direccionTiroFueraDeRango.
	self asertarDireccionEnRango: direccionSalto conMsgError:  self class direccionArqueroFueraDeRango .
		
	varFuerzaAtajada := arqueroActual fuerza.
	varFuerzaTiro := delanteroActual fuerza.
	varDireccionRemate := direccionPelota.
	
	delanteroActual patea una: pelota hacia: direccionPelota arqueroSaltaHacia: direccionSalto en: self .! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 22:02:44'!
arqueroSaltaHacia: direccionSalto porUnTiroAColocarDe: pelota

	^ (varDireccionRemate = direccionSalto) not 
			ifTrue: [ 		arqueroActual estrategia  contraUnTiroAColocarEn: self con: direccionSalto y: pelota. 				]
			ifFalse:[	 pelota pateadoAColocarEn: self.			]! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 16:25:27'!
asertarDireccionEnRango: direccionPelota conMsgError: msjError 

	^ (direccionPelota between: 0@0 and: 2@2) ifFalse: [self error: msjError ]! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 19:33:02'!
aumentaFuerzaAtajada50Porciento

	^ varFuerzaAtajada := varFuerzaAtajada *1.5! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 19:33:30'!
aumentaFuerzaAtajadaElDoble

	^ varFuerzaAtajada := varFuerzaAtajada *2! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 17:21:36'!
coincidenAlturaSaltoYRemate: direccionSalto

	^ varDireccionRemate y = direccionSalto y! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 17:27:34'!
determinarPuntoSiCoincideAltura: direccionSalto

	^ ((self coincidenAlturaSaltoYRemate: direccionSalto))				
								ifTrue: [		self determinoPuntoSegunFuerzasAtajadaVsTiro									]
								ifFalse: [		self puntoDelantero.]! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 20:05:13'!
determinoPuntoSegunFuerzasAtajadaVsTiro

	^ varFuerzaAtajada < varFuerzaTiro								
		ifTrue: [	self puntoDelantero.]					
		ifFalse: [self puntoArquero.]! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 17:09:51'!
elevaDosUnidadesDeAlturaSiElTiroNoEsAlAngulo: direccionPelota

	^ (self pelotaAlAngulo: direccionPelota) not ifTrue: [					
					varDireccionRemate := (direccionPelota x)@(direccionPelota y +2).				
					]! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 18:56:01'!
ignoraAlturaParaAtajar: direccionSalto

	^ (varDireccionRemate x = direccionSalto x)							
	ifTrue: [	self determinoPuntoSegunFuerzasAtajadaVsTiro											]
	ifFalse: [		self puntoDelantero.			]! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 20:44:43'!
jabulaniEsPateadoAColocar

	arqueroActual estrategia contraUnTiroAColocarConJabulaniEn: self.
						self determinoPuntoSegunFuerzasAtajadaVsTiro! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 20:46:59'!
jabulaniEsPateadoAMatarYArqueroSaltaHacia: direccionSalto

	varFuerzaTiro := varFuerzaTiro *1.2.			
				arqueroActual estrategia contraUnTiroAMatarConJAbulaniEn:self con: direccionSalto! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 21:52:56'!
pateaAMatarLa: pelota arqueroSaltaHacia: direccionSalto delanteroApuntaHacia: direccionPelota

	(self pelotaAlAngulo: direccionPelota) 		ifTrue: [	varDireccionRemate := direccionPelota x@1.			].		
		pelota pateadoAMatarYArqueroSaltaHacia: direccionSalto con: direccionPelota en: self! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/26/2025 20:15:58'!
pelotaAlAngulo: direccionPelota

	^ direccionPelota = (0@0) or: direccionPelota = (2@0) or: direccionPelota = (2@2) or: direccionPelota = (0@2)! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 20:44:23'!
playeraEsPateadoAColocar

	varFuerzaTiro := varFuerzaTiro *0.8.
						arqueroActual estrategia contraUnTiroAColocarConPlayeraEn: self! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 22:12:23'!
playeraEsPateadoAMatarYArqueroSaltaHacia: direccionSalto con: direccionPelota 

	self elevaDosUnidadesDeAlturaSiElTiroNoEsAlAngulo: direccionPelota .
	(varDireccionRemate = direccionSalto)					
	ifTrue: [self puntoArquero			]	
	ifFalse: [	
		(varDireccionRemate between: 0@0 and: 2@2)
		ifFalse: [
			self puntoArquero]						
		ifTrue: [	
			arqueroActual estrategia contraUnTiroAMatarConPlayeraEn:self con: direccionSalto.				
		]
	]! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 14:15:27'!
puntoArquero

	^ puntajeArquero := puntajeArquero +1! !

!Penales methodsFor: 'ronda penales' stamp: 'ml 4/28/2025 14:14:38'!
puntoDelantero

	^ puntajeDelantero := puntajeDelantero +1! !


!Penales methodsFor: 'getters var' stamp: 'ml 4/28/2025 17:09:50'!
varDireccionRemateResultante

	^varDireccionRemate ! !

!Penales methodsFor: 'getters var' stamp: 'ml 4/26/2025 18:48:23'!
varFuerzaResultanteDeAtajada

	^varFuerzaAtajada! !

!Penales methodsFor: 'getters var' stamp: 'ml 4/26/2025 18:48:48'!
varFuerzaResultanteDeTiro

	^varFuerzaTiro! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Penales class' category: #Penales!
Penales class
	instanceVariableNames: ''!

!Penales class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:49'!
direccionArqueroFueraDeRango
	
	^'El arquero debe lanzarse a coordenadas válidas'! !

!Penales class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:32'!
direccionTiroFueraDeRango
	
	^'La pelota debe dirigirse a coordenadas válidas'! !


!Penales class methodsFor: 'instance creation' stamp: 'ml 4/26/2025 17:52:39'!
conDelantero: delantero yArquero: arquero 

	^self new initializeConDelantero: delantero yArquero: arquero ! !


!classDefinition: #SistemaVAR category: #Penales!
Object subclass: #SistemaVAR
	instanceVariableNames: 'varRemate varFuerzaTiro varFuerzaAtajada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!
