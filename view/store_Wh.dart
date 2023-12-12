import 'dart:ui';
import 'package:app_punto_venta/view/home.dart';
import 'package:app_punto_venta/view/list_storeWh.dart';
import 'package:app_punto_venta/view/sales.dart';
import 'package:flutter/material.dart';

import 'products.dart';
import 'navigationBar.dart';

class store_wh extends StatefulWidget {
  const store_wh({super.key});

  @override
  State<store_wh> createState() => _store_whState();
}

class _store_whState extends State<store_wh> {
  int _selectedIndex = 3;

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
            MaterialPageRoute(builder: ((context) => const store_wh())));
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
                      height: 35,
                      width: 220,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(131, 244, 176, 49),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text("Categorias",
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
                          //inicio grid view
                          child: GridView.count(
                            padding: const EdgeInsets.all(10),
                            crossAxisCount: 2,
                            children: [
                              //inicio boton bebidas
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                const liststore_wh())));
                                  },
                                  child: Container(
                                    height: 250,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "lib/assets/Can_coke.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Text(
                                      "General",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontFamily: "Dosis"),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              // fin
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 250,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "lib/assets/Vegetables.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: const Text(
                                    "Verduras",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: "Dosis"),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 250,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "lib/assets/Food_cans.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: const Text(
                                    "Enlatados",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: "Dosis"),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 250,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "lib/assets/Cleaning.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: const Text(
                                    "Linea Blanca",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: "Dosis"),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 250,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "lib/assets/add_symbol.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: const Text(
                                    "Agregar +",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontFamily: "Dosis"),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
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
