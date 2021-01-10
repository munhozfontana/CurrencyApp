import 'dart:async';

import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:conversor_moedas/domain/entities/currency_live.dart';
import 'package:conversor_moedas/domain/usecases/currency_usecase.dart';
import 'package:conversor_moedas/domain/usecases/no_params.dart';
import 'package:conversor_moedas/presentation/providers/loading_controller.dart';
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

  Future<void> liveCurrency() async {
    changeLoading(true);
    var res = await currencyLiveUseCase(NoParams());

    res.fold(
      (failure) => print(failure),
      (response) => resLiveCurrency = response,
    );

    changeLoading(false);
  }

  Future<void> listCurrency() async {
    changeLoading(true);

    var res = await currencyListUseCase(NoParams());

    res.fold(
      (failure) => print(failure),
      (response) => toDropDownMenu(response.toJson(), "currencies"),
    );

    changeLoading(false);
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
      int dolar = resLiveCurrency.quotes.uSDUSD;

      print(dolar);

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

      ;

      return (((1 / moedaOrigem) * moedaDestino) *
              (moneyValue == null || moneyValue.isEmpty
                  ? 0
                  : double.parse(moneyValue)))
          .toString();
    }
    return "Escolha a moeda de origem e destino";
  }

  void toDropDownMenu(Map<String, dynamic> json, String key) {
    listDropDown = json[key]
        .entries
        .map<DropdownMenuItem<String>>(
            (MapEntry<String, dynamic> item) => DropdownMenuItem<String>(
                  value: item.key.toString(),
                  child: Text(
                    item.value.toString(),
                  ),
                ))
        .toList();

    if (listDropDown.isNotEmpty) {
      changeSelectFromCountry(listDropDown.first.value);
      changeSelectToCountry(listDropDown.first.value);
    }
    notifyListeners();
  }

  void onChangedMoney(String value) {
    money = value;
    notifyListeners();
  }
}
