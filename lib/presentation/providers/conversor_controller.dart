import 'dart:async';

import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:conversor_moedas/domain/entities/currency_live.dart';
import 'package:conversor_moedas/domain/usecases/currency_usecase.dart';
import 'package:conversor_moedas/domain/usecases/no_params.dart';
import 'package:conversor_moedas/presentation/providers/utils/loading_controller.dart';
import 'package:conversor_moedas/presentation/providers/utils/utils_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversorController extends LoadingController {
  final CurrencyLiveUseCase currencyLiveUseCase;
  final CurrencyListUseCase currencyListUseCase;

  DropdownMenuItem<String> selectFromCountry;
  DropdownMenuItem<String> selectToCountry;

  CurrencyLive resLiveCurrency;
  Currency resListCurrency;
  String money;

  List<DropdownMenuItem<String>> listDropDown = [];

  ConversorController({
    @required this.currencyLiveUseCase,
    @required this.currencyListUseCase,
  });

  Future<void> init() async {
    changeLoading(true);
    await listCurrency();
    await liveCurrency();
    changeLoading(false);
  }

  Future<void> liveCurrency() async {
    var res = await Future.delayed(
      Duration(milliseconds: 5),
      () => currencyLiveUseCase(NoParams()),
    );
    res.fold(
      (failure) => print(failure),
      (response) {
        resLiveCurrency = response;
      },
    );
  }

  Future<void> listCurrency() async {
    var res = await Future.delayed(
        Duration(milliseconds: 5), () => currencyListUseCase(NoParams()));
    res.fold(
      (failure) => print(failure),
      (response) {
        listDropDown =
            UtilsProviders.jsonToDowpDown(response.toJson(), "currencies");

        if (listDropDown.isNotEmpty) {
          changeSelectFromCountry(listDropDown.first.value);
          changeSelectToCountry(listDropDown.first.value);
        }
      },
    );
  }

  void changeSelectFromCountry(String code) {
    selectFromCountry =
        listDropDown.singleWhere((DropdownMenuItem item) => item.value == code);
    notifyListeners();
  }

  void changeSelectToCountry(String code) {
    selectToCountry =
        listDropDown.singleWhere((DropdownMenuItem item) => item.value == code);
    notifyListeners();
  }

  String calculateCurrency(String key, String key2, String moneyValue) {
    if (resLiveCurrency != null) {
      dynamic moedaOrigem = (resLiveCurrency
                  .toJson()['quotes']
                  .entries
                  .singleWhere((MapEntry item) => '${item.key}' == 'USD${key}')
              as MapEntry)
          .value;

      dynamic moedaDestino = (resLiveCurrency
                  .toJson()['quotes']
                  .entries
                  .singleWhere((MapEntry item) => '${item.key}' == 'USD${key2}')
              as MapEntry)
          .value;

      return _calcCoin(moedaOrigem, moedaDestino, moneyValue)
          .toStringAsFixed(2);
    }
    return "Escolha a moeda de origem e destino";
  }

  double _calcCoin(moedaOrigem, moedaDestino, String moneyValue) {
    return (((1 / moedaOrigem) * moedaDestino) *
        (moneyValue == null || moneyValue.isEmpty
            ? 0
            : double.parse(moneyValue)));
  }

  void onChangedMoney(String value) {
    money = value;
    notifyListeners();
  }
}
