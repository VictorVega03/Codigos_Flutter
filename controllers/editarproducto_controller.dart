import 'package:hive/hive.dart';

class EditarProducto {
  void editar(int index, String dato) async {
    try {
      //abre la caja
      var box = await Hive.openBox('productos');
      // elimiar todos los productos de la caja
      await box.putAt(index, dato);
      print('El productos ha sido actualizado');
    } catch (e) {
      print('Error al actualizar el productos: $e');
    }
  }
}
