import 'package:conversor_moedas/presentation/providers/main_contoller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainController>(
      builder: (context, value, child) => BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
        ],
        currentIndex: value.selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: value.changeIndex,
      ),
    );
  }
}
