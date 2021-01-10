import 'package:flutter/material.dart';

class MainController extends ChangeNotifier {
  int selectedIndex = 1;

  void changeIndex(index) {
    selectedIndex = index;
    notifyListeners();
  }
}
