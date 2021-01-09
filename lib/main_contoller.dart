import 'package:flutter/material.dart';

class MainController extends ChangeNotifier {
  int selectedIndex = 0;
  bool loading = false;

  void changeIndex(index) {
    selectedIndex = index;
    notifyListeners();
  }

  void changeLoading() {
    loading = !loading;
    notifyListeners();
  }
}
