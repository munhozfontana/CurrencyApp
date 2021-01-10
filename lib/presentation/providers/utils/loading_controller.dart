import 'package:flutter/cupertino.dart';

class LoadingController with ChangeNotifier {
  bool loading = false;

  void changeLoading(bool value) {
    loading = value;
    notifyListeners();
  }
}
