import 'dart:ui';
import 'package:app_punto_venta/view/products.dart';
import 'package:app_punto_venta/view/sales.dart';
import 'package:flutter/material.dart';
import 'list_storeWh.dart';
import 'navigationBar.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _selectedIndex = 0;

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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "lib/assets/homeImage.webp",
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
                      height: 35,
                      width: 220,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(131, 244, 176, 49),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text("Inicio",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: "Dosis"),
                          textAlign: TextAlign.center),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    Column(
                      children: [
                        Container(
                          height: 720,
                          width: 370,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ListView(
                            padding: const EdgeInsets.all(15),
                            children: [
                              //inicia
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Hora, calendario, etc",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    )
                                  ],
                                ),
                              ), //fin
                              const Padding(
                                  padding: EdgeInsets.all(10)), // espaciado
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "No. de ventas del dia",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    )
                                  ],
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(10)),
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Historial de ventas",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: navigationBar(
          selectedIndex: _selectedIndex, onTabChange: _onTabChange),
    );
  }
}
