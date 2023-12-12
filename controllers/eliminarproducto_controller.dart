import 'package:hive/hive.dart';

class EliminarProducto {
  void eliminarProductos(int index) async {
    try {
      // Abre la caja
      var box = await Hive.openBox('productos');
      // Elimina todos los productos de la caja
      await box.deleteAt(index);
      print('El producto ha sido eliminado');
    } catch (e) {
      print('Error al eliminar todos los productos: $e');
    }
  }
}
