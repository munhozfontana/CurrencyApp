import 'package:conversor_moedas/core/errors/excptions.dart';
import 'package:conversor_moedas/core/errors/failure.dart';
import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:conversor_moedas/domain/entities/currency_live.dart';
import 'package:conversor_moedas/domain/repositories/currency_repository.dart';
import 'package:conversor_moedas/domain/usecases/no_params.dart';
import 'package:conversor_moedas/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyLiveUseCase implements UseCase<CurrencyLive, NoParams> {
  final CurrencyRepository currencyRepository;

  CurrencyLiveUseCase({@required this.currencyRepository});

  @override
  Future<Either<Failure, CurrencyLive>> call(NoParams params) {
    return currencyRepository.live();
  }
}

class CurrencyListUseCase implements UseCase<Currency, NoParams> {
  final CurrencyRepository currencyRepository;

  CurrencyListUseCase({@required this.currencyRepository});

  @override
  Future<Either<Failure, Currency>> call(NoParams params) {
    return currencyRepository.list();
  }
}
