class Rutina {
    method descanso(tiempo) 
    method intensidad ()

    method caloríasQueSeConsumen(tiempo) {
        return 100 * ( tiempo - self.descanso(tiempo) ) * self.intensidad()
    }
}

class Running inherits Rutina {
    const intensidadRunning

    override method intensidad () {
        return intensidadRunning 
    }

    override method descanso(tiempo) {
        return if ( tiempo > 20 ) 5 else 2
    }
} 

class Maratón inherits Running {
    override method caloríasQueSeConsumen(tiempo) {
        return super(tiempo) * 2
    }
}

class Remo inherits Rutina {
    override method intensidad() {
        return 1.3
    }

    override method descanso(tiempo) {
        return tiempo / 5
    }
}

class RemoDeCompetición inherits Remo {
    override method intensidad() {
        return 1.7
    }

    override method descanso(tiempo) {
        return (super(tiempo) - 3).max(2) // no segura
    }
}

class Persona {
    var property peso

    method tiempo() // abstracto

    method caloríasPorKilo() // abstracto

    method pesoPerdidoEn(rutina) {
        return rutina.caloríasQueSeConsumen( self.tiempo() ) / self.caloríasPorKilo() 
    }

    method perderPesoHaciendo(rutina) {
        peso -= self.pesoPerdidoEn(rutina)
    }

    method practicarRutina(rutina) {
        self.validarPracticarRutina(rutina)
        self.perderPesoHaciendo(rutina)
    }

    method validarPracticarRutina(rutina){
        return if ( not self.puedeHacerRutina(rutina) ){
            self.error( "no puede realizar la rutina" + rutina )
        }
    }

    method puedeHacerRutina(rutina) // abstracto
}

class PersonaSedentaria inherits Persona {
    const tiempoDeEjercitación

    override method tiempo() {
        return tiempoDeEjercitación
    }

    override method caloríasPorKilo() {
        return 7000
    }

    override method puedeHacerRutina(rutina) {
        return peso > 50
    }
}

class PersonaAtleta inherits Persona {
    override method tiempo() {
        return 90
    }

    override method caloríasPorKilo() {
        return 8000
    }

    override method puedeHacerRutina(rutina) {
        return rutina.caloríasQueSeConsumen( self.tiempo() ) > 10000
    }

    override method pesoPerdidoEn(rutina) {
        return ( super(rutina) - 1 )
    }
    
}