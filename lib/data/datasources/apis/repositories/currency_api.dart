import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:conversor_moedas/domain/entities/currency_live.dart';

abstract class CurrencyApi {
  Future<CurrencyLive> live();
  Future<Currency> list();
}
