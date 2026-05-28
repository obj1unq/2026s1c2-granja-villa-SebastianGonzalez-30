import wollok.game.*
import personaje.*
import estadosDelMaiz.*

class Maiz {

	var property position 
	var property faseDeCrecimiento = bebe 

	method image() {
		
		return faseDeCrecimiento.image()
	}


	method crecer() {
	  
		faseDeCrecimiento = faseDeCrecimiento.siguienteFase()

	}

	method esAptoParaCosechar() {
	  
		return faseDeCrecimiento.esCosechable()

	}

	method valor() {

		return 150 //valor de venta por maiz

	}

	
	
}

class Trigo {

	var property position 
	var property nivelEvolucion = 0 
	method image() {
		

		return "wheat_" + self.nivelEvolucion() + ".png"
	}


	method crecer() {
	  
		if(nivelEvolucion < 3) {

		 nivelEvolucion = nivelEvolucion + 1 //aumenta sus estados de crecimiento con cada riego
		
		} else {

			nivelEvolucion = nivelEvolucion - 3 //pero si ya esta en fase 3 y vuelve a regarse tiene que volver a 0
		}
	}

	method esAptoParaCosechar() {
	  
		return nivelEvolucion >= 2 // pregunta si el nivel de evolucion actual es dos o mas para saber que es cosechable

	}
	
	method valor() {
	  
		return (self.nivelEvolucion() -1) * 100 //valor por planta de trigo

	}

}

class Tomaco {

	var property position 
	
	method image() {
		
		return "tomaco.png"
	}

	

	method crecer() {
    const posicionDeArriba = position.up(1)
    
    if (posicionDeArriba.y() < game.height()) { //game.height() devuelve la altura
        
        position = posicionDeArriba
    } else {
        
        position = game.at(position.x(), 0)
    }
}

	method esAptoParaCosechar() {
	  
		return true

	}

	method valor() {
	  
		return 80 //valor por planta de tomaco

	}
	
}