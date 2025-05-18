import paqueteria.*

object mensajeria{
    var mensajeros = []
    var ganancia = 0
    var paquetePendientes = [paquete]
    var paquetes = [paquete,paquetito,paqueton]

    method contratarMensajero(mensajero){
        mensajeros.add(mensajero)
    }
    method despedirUnMensajero(mensajero){
        mensajeros.remove(mensajero)
    }
    method despedirATodosLosMensajeros(){
        mensajeros.clear()
    }
    method mensajeriaEsGrande(){
        mensajeros.size() > 2
    }
    method puedeSerEntregadoPorPrimerEmpleado(){
        paquete.puedeSerEntregado(mensajeros.first())
    }
    method pesoDelUltimoMensajero(){
        mensajeros.last().peso()
    }

    method alMenosUnoPuedeEntregar(){
        mensajeros.any({e => paquete.puedeSerEntregado(e)})
    }

    method mensajerosQuePuedenEntregar(paqueteDado){
        mensajeros.filter({m => paqueteDado.puedeSerEntregado(m)})
    }

    method tieneSobrePeso(){
        mensajeros.sum({e => e.peso()}) / mensajeros.size() > 500
    }

    method enviarPaqueteSiPuede(paqueteDado){
        if (mensajeros.any({m => paqueteDado.puedeSerEntregado(m)})){
         ganancia += paqueteDado.precio()
        } else{
            paquetePendientes.add(paqueteDado)
        }
    }

    method facturacionMensajeria(){
        return ganancia
    }

    method enviarTodosLosPaquetes(paquetesDados){
       paquetesDados.all({m => paquetesDados.enviarPaqueteSiPuede(m)})
    }

    method encontrarPendienteMasCaro(){
        var paqueteMayor = paquetePendientes.max({e => e.precio()})
        self.enviarPaqueteSiPuede(paqueteMayor)
        if (paquetePendientes.contains(paqueteMayor)) {
            paquetePendientes.remove(paqueteMayor)
        }
    }

}

