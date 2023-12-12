import 'dart:ui';
import 'package:app_punto_venta/controllers/eliminarallproductos.dart';
import 'package:app_punto_venta/controllers/guardarproducto_controller.dart';
import 'package:app_punto_venta/view/home.dart';
import 'package:app_punto_venta/view/list_storeWh.dart';
import 'package:app_punto_venta/view/navigationBar.dart';
import 'package:app_punto_venta/view/sales.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int _selectedIndex = 2;

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => const home())));

      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => const sales())));

      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const Products())));

      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const liststore_wh())));
    }
  }

  final GuardarProductoController _guardarproductocontroller =
      GuardarProductoController();
  final _textnombreController = TextEditingController();
  final _textidController = TextEditingController();
  //final _textcategoriaController = TextEditingController();
  final _textcantidadController = TextEditingController();
  final _textprecioController = TextEditingController();
  final _textsugeridoController = TextEditingController();
  final _textcodigoController = TextEditingController();
  final EliminarAllProductos eliminartodo = EliminarAllProductos();
  //final List<Producto> lista = [];

  Widget datosProducto({
    required String hintText,
    required TextEditingController controller,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
          width: screenWidth * 0.8,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.white70),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.clear();
                },
                icon: const Icon(Icons.clear, color: Colors.white, size: 25),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(bottom: 10),
              ),
            ),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 60)),
      ],
    );
  }

  Widget datosProducto2({
    required String hintText,
    required TextEditingController controller,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
          width: screenWidth * 0.8,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.white70),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.clear();
                },
                icon: const Icon(Icons.clear, color: Colors.white, size: 25),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(bottom: 10),
              ),
            ),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.white),
            keyboardType: TextInputType.number,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 60)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "lib/assets/Products_view.webp",
                    ),
                    fit: BoxFit.cover),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 7),
                child: Column(
                  children: [
                    const Align(alignment: Alignment.topCenter),
                    const Padding(padding: EdgeInsets.all(18)),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(131, 244, 176, 49),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text(" Alta de Productos   ",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          height: MediaQuery.sizeOf(context).width,
                          width: MediaQuery.sizeOf(context).height,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ListView(
                            children: [
                              datosProducto(
                                  hintText: 'Nombre del Producto',
                                  controller: _textnombreController),
                              datosProducto(
                                  hintText: 'Id del Producto',
                                  controller: _textidController),
                              datosProducto2(
                                  hintText: 'Cantidad',
                                  controller: _textcantidadController),
                              datosProducto2(
                                  hintText: 'Precio de Lista',
                                  controller: _textprecioController),
                              datosProducto2(
                                  hintText: 'Precio Sugerido',
                                  controller: _textsugeridoController),
                              datosProducto(
                                  hintText: 'Codigo de Barras',
                                  controller: _textcodigoController),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _altaExitosaDialog(context);
                        var guardar =
                            _guardarproductocontroller.guardarProducto(
                          nombre: _textnombreController.text,
                          id: _textidController.text,
                          // categoria: _textcategoriaController.text,
                          cantidad: _textcantidadController.text,
                          precio: _textprecioController.text,
                          sugerido: _textsugeridoController.text,
                          codigo: _textcodigoController.text,
                        );
                        //eliminartodo
                        //  .eliminarTodosLosProductos();
                        _textnombreController.clear();
                        _textidController.clear();
                        // _textcategoriaController.clear();
                        _textcantidadController.clear();
                        _textprecioController.clear();
                        _textsugeridoController.clear();
                        _textcodigoController.clear();
                        // producto.save();
                      },
                      style: const ButtonStyle(
                        elevation: MaterialStatePropertyAll(10),
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(154, 244, 176, 49),
                        ),
                      ),
                      child: const Text(
                        'Guardar',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 8))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: navigationBar(
          selectedIndex: _selectedIndex, onTabChange: _onTabChange),
    );
  }
}

Future<void> _altaExitosaDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (context) {
      Future.delayed(const Duration(milliseconds: 1450), () async {
        Navigator.of(context).pop();
      });
      return AnimatedBuilder(
        animation: ModalRoute.of(context)!.animation!,
        builder: (context, child) {
          return Transform.scale(
            scale: Curves.easeInOutBack
                .transform(ModalRoute.of(context)!.animation!.value),
            child: AlertDialog(
              backgroundColor: Colors.orangeAccent,
              contentPadding: const EdgeInsets.all(5),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // icono
                    const SizedBox(
                      height: 100,
                      width: 100,
                      child: Icon(
                        Icons.check_circle_sharp,
                        color: Color.fromARGB(255, 45, 189, 53),
                        size: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // mensaje
                    Container(
                      height: 35,
                      width: 225,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '¡Alta de Producto Exitosa!',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
