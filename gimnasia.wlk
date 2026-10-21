class Rutina {
    //var property tiempo

    method descanso () // hook

    method intensidad () // hook

    method caloríasQueSeConsumen(tiempo) {
        return 100 * ( tiempo - self.descanso() ) * self.intensidad()
    }
}

class Running inherits Rutina{
    var intensidadRunning

    override method intensidad (){
        return intensidadRunning 
    }
} 

class Maratón inherits Running {

}

class Remo inherits Rutina {
    
}

class RemoDeCompetición inherits Remo {

}