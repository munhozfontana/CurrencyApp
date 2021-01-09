import 'package:conversor_moedas/main_contoller.dart';
import 'package:flutter/cupertino.dart';

import 'package:conversor_moedas/services/currency_api_impl.dart';

class ConversorController extends ChangeNotifier {
  final CurrencyApiImpl currencyApi;
  final MainController mainController;

  ConversorController({
    this.currencyApi,
    this.mainController,
  });

  void listCurrency() {
    mainController.changeLoading();
    // currencyApi.live().then((res) => resultListCurrency.value = res);
    // mainControler.changeLoading(false);
  }
}
