import 'package:flutter/material.dart';

class vista_inventario extends StatefulWidget {
  const vista_inventario({super.key});

  @override
  State<vista_inventario> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<vista_inventario> {
  String textoventa5 = 'Venta 5';
  Color colorventa5 = Colors.black12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: [
          const Padding(padding: EdgeInsets.all(5)),
          Container(
            width: 100,
            height: 200,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Colors.black12,
              boxShadow: const [
                BoxShadow(
                    blurRadius: 67, spreadRadius: -90, offset: Offset(-80, 40)),
              ],
            ),
            child: const Text('Venta 1:',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Container(
            width: 200,
            height: 200,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Colors.black12,
              boxShadow: const [
                BoxShadow(
                    blurRadius: 67, spreadRadius: -90, offset: Offset(-80, 40)),
              ],
            ),
            child: const Text('Venta 2:',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Container(
            width: 200,
            height: 200,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Colors.black12,
              boxShadow: const [
                BoxShadow(
                    blurRadius: 67, spreadRadius: -90, offset: Offset(-80, 40)),
              ],
            ),
            child: const Text('Venta 3:',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Container(
            width: 200,
            height: 200,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Colors.black12,
              boxShadow: const [
                BoxShadow(
                    blurRadius: 67, spreadRadius: -90, offset: Offset(-80, 40)),
              ],
            ),
            child: const Text('Venta 4:',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Container(
            width: 200,
            height: 200,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Colors.black12,
              boxShadow: const [
                BoxShadow(
                    blurRadius: 67, spreadRadius: -90, offset: Offset(-80, 40)),
              ],
            ),
            child: const Text('Venta 5:',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
          ),
          const Padding(
              padding:
                  EdgeInsets.all(5)), //Prueba container con acción de botón
          InkWell(
            child: Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: colorventa5,
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 67,
                      spreadRadius: -90,
                      offset: Offset(-80, 40)),
                ],
              ),
              child: Text(textoventa5,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 20, fontStyle: FontStyle.italic)),
            ),
            onLongPress: () {
              setState(() {
                textoventa5 = 'Ha cambiado el texto';
                colorventa5 = Colors.blue;
              });
            },
          ),
        ],
      ),
    );
  }
}
