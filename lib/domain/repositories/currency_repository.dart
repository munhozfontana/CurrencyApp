import 'package:conversor_moedas/core/errors/failure.dart';
import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:conversor_moedas/domain/entities/currency_live.dart';
import 'package:dartz/dartz.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, CurrencyLive>> live();
  Future<Either<Failure, Currency>> list();
}
