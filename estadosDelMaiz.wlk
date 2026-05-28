object bebe {
  
    method image() {
		
		return "corn_baby.png"
	}

    method siguienteFase() {
      
        return adulto

    }

    method esCosechable() {
      
        return false

    }

}

object adulto {

    method image() {
		
		return "corn_adult.png"
	}
    
    method siguienteFase() {
      
        return self

    }

    method esCosechable() {
      
        return true

    }
}