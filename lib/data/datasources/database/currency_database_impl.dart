import 'dart:convert';

import 'package:conversor_moedas/core/errors/excptions.dart';
import 'package:conversor_moedas/data/datasources/database/repositories/currency_database.dart';
import 'package:conversor_moedas/domain/entities/currency_live.dart';
import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrencyDatabaseImpl implements CurrencyDatabase {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String lastDataList = "LAST_DATA_LIST";
  String lastDataLive = "LAST_DATA_LIVE";

  @override
  Future<Currency> list() async {
    try {
      return Currency.fromJson(
        json.decode(
          (await _prefs).getString(lastDataList),
        ),
      );
    } catch (e) {
      throw ClientDataBaseException(error: e.toString());
    }
  }

  @override
  Future<void> saveList(Currency currency) async {
    try {
      (await _prefs).setString(
        lastDataList,
        jsonEncode(currency.toJson()),
      );
    } catch (e) {
      throw ClientDataBaseException(error: e.toString());
    }
  }

  @override
  Future<void> saveLive(CurrencyLive currencyLive) async {
    try {
      (await _prefs).setString(
        lastDataLive,
        jsonEncode(currencyLive.toJson()),
      );
    } catch (e) {
      throw ClientDataBaseException(error: e.toString());
    }
  }

  @override
  Future<CurrencyLive> live() async {
    try {
      return CurrencyLive.fromJson(
        json.decode(
          (await _prefs).getString(lastDataLive),
        ),
      );
    } catch (e) {
      throw ClientDataBaseException(error: e.toString());
    }
  }
}
