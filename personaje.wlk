import wollok.game.*
import muros.*
import direcciones.*
import cultivos.*



object personaje {
	var property position = game.center()
	const property image = "fplayer.png"

	method position() {
	  
		return position

	}

	method mover(direccion) {
    
	const posibleDestino = direccion.siguiente(self.position())
    const objetosEnDestino = game.getObjectsIn(posibleDestino) //  pregunta al juego que hay en posibleDestino
    
    if (not objetosEnDestino.any({ obj => obj.esUnObstaculo() })) {position = posibleDestino} //si no es obstaculo se mueve
    }

	method position(_position) { //el setter solo lo necesito para testear
		position = _position 
	}

	method sembrarSiPuede(unaPlanta) {
	  
		if(self.validarUbicacionDePlanta()) {

			game.addVisual(unaPlanta)
		}
	}

	method validarUbicacionDePlanta() {
		
		const lugarLibre = self.esLugarLibre()
		
		if (not lugarLibre) {
			game.say(self, "ya hay una planta acá")
		
		}
		return lugarLibre
	}

	method esLugarLibre() {
	  
		return game.getObjectsIn(self.position()).size() < 2
	}

}