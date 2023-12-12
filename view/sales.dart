import 'dart:ui';
import 'package:app_punto_venta/view/home.dart';
import 'package:app_punto_venta/view/list_storeWh.dart';
import 'package:flutter/material.dart';
import 'navigationBar.dart';
import 'products.dart';

class sales extends StatefulWidget {
  const sales({super.key});

  @override
  State<sales> createState() => _salesState();
}

class _salesState extends State<sales> {
  int _selectedIndex = 1;

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
                    "lib/assets/Sales_view.webp",
                  ),
                  fit: BoxFit.cover,
                ),
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
                      child: const Text("      Ventas      ",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                          textAlign: TextAlign.left),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ListView(
                            children: const [
                              Text('ldfksjfdljs'),
                              Text('ldfksjfdljs'),
                              Text('ldfksjfdljs'),
                              Text('ldfksjfdljs'),
                              Text('ldfksjfdljs'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        infoventa(infotexto: 'Total: '),
                        infoventa(infotexto: 'dinero '),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        boton(
                            texto: 'Pagar',
                            tituloDialog: 'Pagar a Precio Normal'),
                        boton(
                            texto: 'Pagar Sugerido',
                            tituloDialog: 'Pagar a Precio Sugerido'),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 8)),
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

  Widget boton({
    required String texto,
    required String tituloDialog,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          child: ElevatedButton(
            onPressed: () {
              _mostrarDialog(context, tituloDialog);
            },
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(
                Color.fromARGB(255, 227, 155, 22),
              ),
              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              elevation: const MaterialStatePropertyAll(10.0),
            ),
            child: Text(
              texto,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget campo({
    required String hintTextC,
    required double distanciaCL,
  }) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          hintText: hintTextC,
          hintStyle: const TextStyle(
              fontStyle: FontStyle.italic, color: Colors.white, fontSize: 12),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget infoventa({
    required String infotexto,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(
            infotexto,
            style: const TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

Future<void> _mostrarDialog(BuildContext context, String titulo) async {
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
          child: Text(
            titulo,
            style: const TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ),
          ),
        ),
        // container de campos
        const Padding(padding: EdgeInsets.only(top: 5)),
        Container(
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: Colors.black54, borderRadius: BorderRadius.circular(25)),
          child: const Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              // primer campo
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Text(
                    'Ingresar el Pago:    ',
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
                        //controller: ,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 25,
                  )
                ],
              ),
              // segundo campo
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text(
                    'El cambio es de:     ',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 30,
                    child: Text(
                      // controlador que actualize el precio();
                      '50.0',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
                await _pagoExitosoDialog(context);
                await Future.delayed(const Duration(milliseconds: 300));
                Navigator.pop(context);
                // registrar venta
              },
              style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(10),
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 64, 169, 69)),
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
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 230, 35, 35)),
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

Future<void> _pagoExitosoDialog(BuildContext context) async {
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
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '¡Pago Exitoso!',
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
