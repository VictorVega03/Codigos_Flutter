import 'dart:ui';
import 'package:app_punto_venta/controllers/eliminarproducto_controller.dart';
import 'package:app_punto_venta/models/product_model.dart';
import 'package:app_punto_venta/view/home.dart';
import 'package:app_punto_venta/view/products.dart';
import 'package:app_punto_venta/view/sales.dart';
import 'package:flutter/material.dart';
import 'navigationBar.dart';

class liststore_wh extends StatefulWidget {
  const liststore_wh({super.key});

  @override
  State<liststore_wh> createState() => _liststore_whState();
}

class _liststore_whState extends State<liststore_wh> {
  final List<Producto> listaproductos = Producto.getAll();
  final EliminarProducto eliminar = EliminarProducto();
  final _textnombreController = TextEditingController();
  final _textidController = TextEditingController();
  //final _textcategoriaController = TextEditingController();
  final _textcantidadController = TextEditingController();
  final _textprecioController = TextEditingController();
  final _textsugeridoController = TextEditingController();
  final _textcodigoController = TextEditingController();
  final cantidadController = TextEditingController();
  final precioController = TextEditingController();
  final sugeridoController = TextEditingController();
  int _selectedIndex = 3;

  void _onTabChange(int elegir) {
    setState(() {
      _selectedIndex = elegir;
    });
    switch (elegir) {
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
                      "lib/assets/storeWh_view.webp",
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
                      child: const Text("Almacen   ",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            children: [
                              const Padding(padding: EdgeInsets.only(top: 7)),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Text(
                                  '     Nombre ID              Cantidad         Precio  ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: ListView.separated(
                                  padding: const EdgeInsets.all(7),
                                  itemCount: listaproductos.length,
                                  separatorBuilder: (context, index) {
                                    return const Padding(
                                        padding: EdgeInsets.only(top: 9));
                                  },
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black54,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Stack(
                                          children: [
                                            const SizedBox(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                              ),
                                            ),
                                            SizedBox(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 8, bottom: 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      listaproductos
                                                          .elementAt(index)
                                                          .id,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    ),
                                                    Text(
                                                      listaproductos
                                                          .elementAt(index)
                                                          .cantidad,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    ),
                                                    Text(
                                                      listaproductos
                                                          .elementAt(index)
                                                          .precio,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) =>
                                              _BottomSheetWh(index: index),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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

  Future<void> _mostrarDialogEditar(BuildContext context, int index) async {
    return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange,
        contentPadding: EdgeInsets.zero,
        actions: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 12)),
          // container de titulo
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(11)),
            alignment: Alignment.center,
            child: const Text(
              'Editar Producto',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            ),
          ),
          // container de campos
          const Padding(padding: EdgeInsets.only(top: 5)),
          Container(
            height: MediaQuery.of(context).size.height * 0.23,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 10)),
                // primer campo
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 15)),
                    const Text(
                      'Nombre:   ',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 30,
                        child: TextField(
                          controller: _textnombreController,
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
                const Row(
                  children: [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
                // segundo campo
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 15)),
                    const Text(
                      'Precio de Lista:   ',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 30,
                        child: TextField(
                          controller: _textprecioController,
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 19,
                              color: Colors.white),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
                const Row(
                  children: [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
                //tercer campo
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 15)),
                    const Text(
                      'Precio Sugerido:   ',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 30,
                        child: TextField(
                          controller: _textsugeridoController,
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 19,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
              ],
            ),
          ),
          // botones de pagar y cancelar
          const Padding(padding: EdgeInsets.only(top: 7)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //boton aceptar
              ElevatedButton(
                onPressed: () async {
                  await _editarExitosoDialog(context);
                  await Future.delayed(const Duration(milliseconds: 300));
                  Navigator.pop(context);
                  // registrar venta
                  var producto = Producto(
                      nombre: listaproductos.elementAt(index).nombre,
                      id: listaproductos.elementAt(index).id,
                      cantidad: cantidadController.text,
                      precio: precioController.text,
                      sugerido: sugeridoController.text,
                      codigo: listaproductos.elementAt(index).codigo);
                  producto.update(producto.codigo);
                  setState(() {
                    listaproductos[index] = producto;
                  });
                },
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(10),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 64, 169, 69)),
                ),
                child: const Text(
                  'Aceptar',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              //espaciado
              const SizedBox(
                height: 20,
                width: 20,
              ),
              //boton cancelar
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(10),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 230, 35, 35)),
                ),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _BottomSheetWh({
    required int index,
  }) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 10)),
            SizedBox(
              height: screenHeight * 0.5,
              width: screenWidth * 0.8,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.orange),
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    SizedBox(
                      height: 40,
                      width: screenWidth * 0.8,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Center(
                          child: Text(
                            'Información del Producto',
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    SizedBox(
                      height: 180,
                      child: Container(
                        width: screenWidth * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadiusDirectional.circular(30)),
                        child: Center(
                          child: Column(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.only(left: 20, top: 10)),
                              Row(
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(left: 20)),
                                  const Text('Nombre:',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 10)),
                                  Text(listaproductos.elementAt(index).nombre,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(left: 20)),
                                  const Text('ID:',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 10)),
                                  Text(listaproductos.elementAt(index).id,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(left: 20)),
                                  const Text('Cantidad:',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 10)),
                                  Text(listaproductos.elementAt(index).cantidad,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(left: 20)),
                                  const Text('Precio:',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 10)),
                                  Text(listaproductos.elementAt(index).precio,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(left: 20)),
                                  const Text('Precio Sugerido:',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 10)),
                                  Text(listaproductos.elementAt(index).sugerido,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(left: 20)),
                                  const Text('Código de Barras:',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 10)),
                                  Text(listaproductos.elementAt(index).codigo,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Row(
                      children: [
                        SizedBox(height: 10),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        ElevatedButton.icon(
                          onPressed: () async {
                            await _mostrarDialogEditar(context, index);
                            await Future.delayed(
                                const Duration(milliseconds: 300));
                            Navigator.pop(context);
                            setState(() {});
                          },
                          icon: const Icon(Icons.edit,
                              size: 20, color: Colors.white),
                          label: const Text(
                            'Editar',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.green[400]),
                              elevation: const MaterialStatePropertyAll(10)),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          onPressed: () async {
                            await _eliminarDialog(context);
                            await Future.delayed(
                                const Duration(milliseconds: 300));
                            Navigator.pop(context);
                            setState(() {
                              listaproductos.elementAt(index).delete(
                                  listaproductos.elementAt(index).codigo);
                              listaproductos.removeAt(index);
                              Producto.getAll();
                            });
                          },
                          icon: const Icon(
                            Icons.cancel_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Eliminar',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.red[600]),
                              elevation: const MaterialStatePropertyAll(10)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _eliminarDialog(BuildContext context) async {
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
                          Icons.delete_forever,
                          color: Color.fromARGB(255, 252, 27, 27),
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
                          'Producto Eliminado :D',
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

  Future<void> _editarExitosoDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(milliseconds: 1250), () async {
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
                          Icons.border_color_outlined,
                          color: Color.fromARGB(255, 38, 171, 45),
                          size: 100,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // mensaje
                      Container(
                        height: 35,
                        width: 260,
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          '¡Editado Exitosamente!',
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
}
