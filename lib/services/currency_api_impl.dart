import 'dart:async';
import 'dart:convert';

import 'package:conversor_moedas/services/currency_api.dart';
import 'package:conversor_moedas/services/fixture/FakeRequest.dart';
import 'package:conversor_moedas/services/models/liveCurrency.dart';

import 'package:http/http.dart' as http;

class CurrencyApiImpl {
  String _host = "https://api.currencylayer.com/";

  @override
  Future<LiveCurrency> list() async {
    // var response = await http.get('$_host/list');

    Timer(Duration(seconds: 2), () {});

    return LiveCurrency.fromJson(
        json.decode(FakeRequest().fixture('req.json')));
  }

  @override
  Future<LiveCurrency> live() async {
    // var response = await http.get('$_host/list');

    Timer(Duration(seconds: 2), () {});

    return await LiveCurrency.fromJson(
        json.decode(FakeRequest().fixture('req.json')));
  }
}
