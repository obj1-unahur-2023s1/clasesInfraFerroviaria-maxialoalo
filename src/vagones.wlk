class VagonDePasajeros {
	const property largo
	const property ancho
	var property tieneBanio = true 
	var property estaOrdenado = false
	
	method capacidadParcial() { return
		if(ancho<=3) 8*largo else 10*largo
	}
	
	method capacidadPasajeros() {return
		if(estaOrdenado) self.capacidadParcial() 
		else 0.max(self.capacidadParcial() - 15)
	}
	
	method cantMaximaDeCarga() {return
		if(tieneBanio) 300 else 800
	}
	
	method pesoMaximo() {return
		2000 + 80*self.capacidadPasajeros()+ self.cantMaximaDeCarga()
	}
	
	method hacerMantenimiento() {
		estaOrdenado = true
	}
}

class VagonDeCarga {
	const property cargaMaximaIdeal
	var property maderasSueltas
	
	method cantMaximaDeCarga() {return
		cargaMaximaIdeal - 400*maderasSueltas
	}
	
	method capacidadPasajeros() = 0 
	method tieneBanio() = false
	
	method pesoMaximo() {return
		1500 + self.cantMaximaDeCarga()
	}
	
	method hacerMantenimiento() {
		maderasSueltas = 0.max(maderasSueltas-2)
	}
}

class VagonDormitorio {
	const property compartimentos
	var property camaPorCompart
	
	method cantMaximaDeCarga() = 1200
	method capacidadPasajeros() = compartimentos * camaPorCompart
	method tieneBanio() = true
	method pesoMaximo() {return 
		4000 + 80 * self.capacidadPasajeros() + self.cantMaximaDeCarga()
	}
	method hacerMantenimiento() {}
}
