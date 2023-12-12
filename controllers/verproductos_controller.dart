import 'package:app_punto_venta/models/product_model.dart';

class VerProductosController {
  List<Producto> getAll() {
    return Producto.getAll();
  }

//   Future<void> editarProducto(context, Producto producto, int index) async {
//     await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => EditarProducto(
//           producto: producto,
//           index: index,
//         ),
//       ),
//     );
//   }
}
