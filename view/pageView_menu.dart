import 'package:app_punto_venta/view/products.dart';
import 'package:app_punto_venta/view/sales.dart';
import 'package:app_punto_venta/view/store_Wh.dart';
import 'package:flutter/material.dart';

class pageView_menu extends StatelessWidget {
  const pageView_menu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: pageView_Menu());
  }
}

class pageView_Menu extends StatelessWidget {
  const pageView_Menu({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const <Widget>[
          pageview_sales(),
          pageview_products(),
          pageview_storeWh()
        ],
      ),
    );
  }
}

class pageview_sales extends StatelessWidget {
  const pageview_sales({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/Sales_view.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          PageView(
            controller: PageController(),
            children: const <Widget>[
              Center(),
            ],
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const sales()));
              },
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 243, 158, 62)),
              ),
              child: const Text(
                "Ventas",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 25.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class pageview_products extends StatelessWidget {
  const pageview_products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/Products_view.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          PageView(
            controller: PageController(),
            children: const <Widget>[
              Center(),
            ],
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const Products())));
              },
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 243, 158, 62)),
              ),
              child: const Text(
                "Productos",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 25.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class pageview_storeWh extends StatelessWidget {
  const pageview_storeWh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/storeWh_view.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          PageView(
            controller: PageController(),
            children: const <Widget>[
              Center(),
            ],
          )
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const store_wh())));
              },
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 243, 158, 62)),
              ),
              child: const Text(
                "Almacen",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 25.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
