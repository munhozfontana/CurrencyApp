import 'dart:async';
import 'dart:convert';

import 'package:conversor_moedas/FakeRequest.dart';
import 'package:conversor_moedas/core/errors/excptions.dart';
import 'package:conversor_moedas/data/datasources/apis/repositories/currency_api.dart';
import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:conversor_moedas/domain/entities/currency_live.dart';

class CurrencyApiImpl implements CurrencyApi {
  String _host = "https://api.currencylayer.com/";

  Future<Currency> list() async {
    try {
      return Currency.fromJson(json.decode(fakeReqList));
    } catch (e) {
      throw ServerApiException(error: e.toString());
    }
  }

  Future<CurrencyLive> live() async {
    try {
      return CurrencyLive.fromJson(json.decode(fakeReqLive));
    } catch (e) {
      throw ServerApiException(error: e.toString());
    }
  }
}
