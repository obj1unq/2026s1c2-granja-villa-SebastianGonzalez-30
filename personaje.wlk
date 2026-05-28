import wollok.game.*
import cultivos.*
import herramientas.*



object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	var property plantasEnElInventario = #{} 
	var property dineroActual = 0

	method position() {
	  
		return position

	}

	

	method sembrarSiPuede(unaPlanta) {
	  
		self.validarUbicacionDePlanta() 
		game.addVisual(unaPlanta)
		
	}

	method ponerAspersorSiPuede(unAspersor) {
      
        
        game.addVisual(unAspersor)

    }


	method validarUbicacionDePlanta() {
    if (self.esLugarConPlanta()) {
        
	throw new Exception(message = "ya hay algo acá")
    }
}

	method esLugarConPlanta() {
	  
		return game.getObjectsIn(self.position()).size() >= 2 //el granjero cuenta como un objeto, si la posicion tiene al granjero
															 // + una planta ya plantada, es porque la posicion tiene 2 objetos
															 // (granjero + planta)
	}

	method regarSiPuede() {
	  
		self.validarRiegoDePlanta()
		//busca en la posicion actual un objeto que no sea si mismo (el granjero) 
		const plantaActual = self.cultivoActual()
																								
		plantaActual.crecer()
		
	}

	method validarRiegoDePlanta() {
	  
		if (not self.esLugarConPlanta()) {
        
			throw new Exception(message = "No hay una planta acá!")
    }
    }

	method cosecharSiPuede() {
	  
		self.validarCosechaDePlanta()
		
		const plantaActual = self.cultivoActual()
		plantasEnElInventario.add(plantaActual)
		game.removeVisual(plantaActual)


	}

	method validarCosechaDePlanta() {
	  
		

		if (not self.esLugarConPlanta()) {
        
			throw new Exception(message = "No hay una planta!")
    }
		const plantaActual = self.cultivoActual()
		
		if(not plantaActual.esAptoParaCosechar()) {
			
			throw new Exception(message = "No es apta para cosechar!")
		}
    }

	method cultivoActual() {
    
		const cultivoActual = game.getObjectsIn(self.position()).find({ obj => obj != self }) 
    
			
			return cultivoActual
	}

	method venderCosechas() {
	  
		dineroActual = dineroActual + plantasEnElInventario.sum({cultivo => cultivo.valor()})
		plantasEnElInventario.clear()
}

	method decirDineroYPlantas() {
	  
		game.say(self, "tengo	" + self.dineroActual() + "dinero y	" + self.cantidadDePlantasEnElInventario() + "plantas!" )

	}

	method cantidadDePlantasEnElInventario() {
	  
		return plantasEnElInventario.size()

	}

	
}