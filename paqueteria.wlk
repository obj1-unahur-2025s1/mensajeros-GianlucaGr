object paquete {
  var estaPago = false
  var destino = puente

  method precio() = 50
  method estaPago() = estaPago
  method cambiarDestino(nuevoDestino) {destino = nuevoDestino}
  method puedeSerEntregado(repartidor){
    destino.puedePasar(repartidor) && self.estaPago()
  }
}

object paquetito {
  method estaPago() = true //es gratis
  method puedeSerEntragado(repartidor) = true
  method precio() = 0
}

object paqueton{
  var pago = 0
  var destinos = [puente, matrix, puente, puente]
  method puedeSerEntregado(repartidor){ 
    destinos.all({e => e.puedePasar(repartidor)}) && self.estaPago()
  }

  method precio() = 100 * destinos.size()
  method estaPago() = pago == self.precio()
  method pagarMas(num) = pago + num
}

object puente{
  method puedePasar(repartidor) {repartidor.peso() < 1000}
}

object matrix{
  method puedePasar(repartidor) {repartidor.llamar()}
}

object roberto {
  var vehiculo = camion
  var pesoRoberto = 0
  method pesoRoberto(pesoNuevo) {pesoRoberto = pesoNuevo}
  method peso() = pesoRoberto + vehiculo.peso()
  method cambiarVehiculo(vehiculoNuevo) {vehiculo = vehiculoNuevo}
  method llamar() = false
}

object chuckNorris {
  method peso() = 80
  method llamar() = true
}

object neo {
  var credito = false
  method peso() = 0
  method llamar() = credito

  method cargarCredito() {credito = true}
}

object camion {
  var acoplado = 0
  method agregarAcoplado() = acoplado + 1
  method peso() = acoplado * 500
}

object bicicleta {
  method peso() = 5
}