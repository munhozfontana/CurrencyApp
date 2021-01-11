import 'dart:async';
import 'dart:convert';

import 'package:conversor_moedas/core/errors/excptions.dart';
import 'package:conversor_moedas/data/datasources/apis/repositories/currency_api.dart';
import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:conversor_moedas/domain/entities/currency_live.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CurrencyApiImpl implements CurrencyApi {
  String host = "http://api.currencylayer.com/";
  String key = "edcc5dd246c8a35f33281691f6098bca&format=1";
  final http.Client client;

  CurrencyApiImpl({@required this.client});

  Future<Currency> list() async {
    try {
      var response = await client.get('$host/list?access_key=$key');
      return Currency.fromJson(json.decode(response.body));
    } catch (e) {
      throw ServerApiException(error: e.toString());
    }
  }

  Future<CurrencyLive> live() async {
    try {
      var response = await client.get('$host/live?access_key=$key');
      return CurrencyLive.fromJson(json.decode(response.body));
    } catch (e) {
      throw ServerApiException(error: e.toString());
    }
  }
}
