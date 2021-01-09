import 'package:flutter/cupertino.dart';

import 'package:conversor_moedas/main.dart';
import 'package:conversor_moedas/services/currency_api_impl.dart';
import 'package:conversor_moedas/services/models/liveCurrency.dart';

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
