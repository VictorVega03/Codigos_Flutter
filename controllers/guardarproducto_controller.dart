import '../models/product_model.dart';

class GuardarProductoController {
  void guardarProducto({
    required String nombre,
    required String id,
    //required String categoria,
    required String cantidad,
    required String precio,
    required String sugerido,
    required String codigo,
  }) {
    //VALIDAR PRIMERO CANTIDAD Y PRECIO
    //RegExp("");
    Producto producto = Producto(
      nombre: nombre,
      id: id,
      //categoria: categoria,
      cantidad: cantidad,
      precio: precio,
      sugerido: sugerido,
      codigo: codigo,
    );

    producto.save();
  }
}
