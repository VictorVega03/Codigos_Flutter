import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class navigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;
  const navigationBar(
      {super.key, required this.selectedIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.width * 0.05;
    return Container(
      color: Colors.black,
      //child: Padding(
      //padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
      child: GNav(
        backgroundColor: Colors.black,
        color: const Color.fromARGB(255, 232, 155, 46),
        activeColor: const Color.fromARGB(255, 232, 155, 46),
        tabBackgroundColor: const Color.fromARGB(81, 254, 179, 73),
        gap: 8,
        selectedIndex: selectedIndex,
        onTabChange: onTabChange,
        tabs: [
          GButton(
            icon: Icons.home,
            text: " Inicio",
            iconSize: iconSize,
          ),
          GButton(
              icon: Icons.shopping_cart_outlined,
              text: " Ventas",
              iconSize: iconSize),
          GButton(icon: Icons.store, text: " Productos", iconSize: iconSize),
          GButton(
              icon: Icons.warehouse_rounded,
              text: " Almacen",
              iconSize: iconSize),
        ],
      ),
    );
    //)
  }
}
