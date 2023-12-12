import 'package:app_punto_venta/view/home.dart';
import 'package:flutter/material.dart';

class splash_view extends StatefulWidget {
  const splash_view({super.key});

  @override
  State<splash_view> createState() => _splash_viewState();
}

class _splash_viewState extends State<splash_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/assets/fondo6.webp"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      height: 240,
                      width: 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(5, 7)),
                        ],
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'lib/assets/Duck_logoPro.gif',
                          ),
                        ),
                      )),
                  Container(
                    height: 60,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(4, 5)),
                      ],
                    ),
                    child: const Text(
                      "Punto de Venta",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  MaterialButton(
                    elevation: 10.0,
                    minWidth: 170.0,
                    height: 50.0,
                    color: const Color.fromARGB(255, 244, 167, 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: const Text(
                      "Ingresar",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const home()));
                    },
                  ),
                ],
              )),
          Positioned(child: SizedBox(width: MediaQuery.of(context).size.width)),
        ],
      ),
    );
  }
}
