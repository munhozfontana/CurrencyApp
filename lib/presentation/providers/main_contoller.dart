import 'package:flutter/material.dart';

class MainController extends ChangeNotifier {
  int selectedIndex = 0;

  void changeIndex(index) {
    selectedIndex = index;
    notifyListeners();
  }
}
