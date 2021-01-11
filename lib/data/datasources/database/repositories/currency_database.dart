import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:conversor_moedas/domain/entities/currency_live.dart';

abstract class CurrencyDatabase {
  Future<Currency> list();
  Future<void> saveList(Currency currency);
  Future<CurrencyLive> live();
  Future<void> saveLive(CurrencyLive currencyLive);
}
