import 'dart:async';

import 'package:conversor_moedas/data/datasources/currency_api.dart';
import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:conversor_moedas/domain/entities/currency_live.dart';
import 'package:flutter/cupertino.dart';

class ConversorController extends LoadingController {
  final CurrencyApi currencyApi;
  CurrencyLive resLiveCurrency = CurrencyLive();
  Currency resListCurrency = Currency();

  Currency selectFromCountry;
  Currency selectToCountry;

  ConversorController({
    @required this.currencyApi,
  });

  Future<void> liveCurrency() async {
    changeLoading(true);
    resLiveCurrency =
        await Future.delayed(Duration(seconds: 1), () => currencyApi.live());
    changeLoading(false);
  }

  Future<void> listCurrency() async {
    changeLoading(true);
    resListCurrency =
        await Future.delayed(Duration(seconds: 1), () => currencyApi.list());

    resListCurrency
        .toJson()['currencies']
        .entries
        .forEach((value) => print(value));

    // if (resListCurrency.isNotEmpty) {
    //   changeSelectFromCountry(resListCurrency.first.code);
    //   changeSelectToCountry(resListCurrency.first.code);
    // }
    // resListCurrency.map((value) => value.name);
    changeLoading(false);
  }

  void changeSelectFromCountry(String code) {
    // selectFromCountry =
    //     resListCurrency.singleWhere((value) => value.code == code);
    notifyListeners();
  }

  void changeSelectToCountry(String code) {
    // selectToCountry =
    //     resListCurrency.singleWhere((value) => value.code == code);
    notifyListeners();
  }

  void calculateCurrency(Currency value, Currency value2) {
    // print('name: ${value?.name}  code: ${value?.code}');
    // print('name: ${value2?.name}  code: ${value2?.code}');
  }
}

class LoadingController with ChangeNotifier {
  bool loading = false;

  void changeLoading(bool value) {
    loading = value;
    notifyListeners();
  }
}
