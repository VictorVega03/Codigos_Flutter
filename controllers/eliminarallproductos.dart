import 'package:hive/hive.dart';

class EliminarAllProductos {
  void eliminarTodosLosProductos() async {
    try {
      // abre la caja
      var box = await Hive.openBox('productos');
      //elimina todos los productos de la caja
      await box.clear();
      print('Todos los productos han sido eliminados');
    } catch (e) {
      print('Error al eliminar todos los productos: $e');
    }
  }
}
