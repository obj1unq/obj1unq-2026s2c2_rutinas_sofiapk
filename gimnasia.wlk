class Rutina {
    //var property tiempo

    method descanso (tiempo) // hook

    method intensidad () // hook

    method caloríasQueSeConsumen(tiempo) {
        return 100 * ( tiempo - self.descanso(tiempo) ) * self.intensidad()
    }
}

class Running inherits Rutina {
    var intensidadRunning

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