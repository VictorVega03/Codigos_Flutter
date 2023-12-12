import 'package:hive_flutter/adapters.dart';

class Producto {
  String nombre;
  String id;
  //String categoria;
  String cantidad;
  String precio;
  String sugerido;
  String codigo;

  Producto({
    required this.nombre,
    required this.id,
    //required this.categoria,
    required this.cantidad,
    required this.precio,
    required this.sugerido,
    required this.codigo,
  });

  factory Producto.fromJson(Map<dynamic, dynamic> json) {
    return Producto(
      nombre: json['nombre'],
      id: json['id'],
      // categoria: json['categoria'],
      cantidad: json['cantidad'],
      precio: json['precio'],
      sugerido: json['sugerido'],
      codigo: json['codigo'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'id': id,
        // 'categoria': categoria,
        'cantidad': cantidad,
        'precio': precio,
        'sugerido': sugerido,
        'codigo': codigo,
      };

  @override
  String toString() {
    return 'Producto{nombre: $nombre, id: $id, cantidad:$cantidad, precio: $precio, sugerido: $sugerido, codigo:$codigo}';
  }

  void save() async {
    //inicializa hive si aun no lo hizo

    // abrir caja de productos
    var box = await Hive.openBox('productos');

    // Guarda el producto en la caja
    box.put(codigo, toJson());

    // Imprime los productos
    var productos = box.values.toList();
    print(productos);

    //   Hive.box('productos').add(toJson());
    //   var productos = Hive.box('productos').values.toList();
    //   print(productos);
  }

  void update(String codigo) {
    //actualiza en Hive
    Hive.box('productos').put(codigo, toJson());
  }

  void delete(String codigo) {
    // eliminar en Hive
    Hive.box('productos').delete(codigo);
  }

  static List<Producto> getAll() {
    var productos = Hive.box('productos').values.toList();
    print(productos);
    return productos.map((p) => Producto.fromJson(p)).toList();
  }
}
