import 'package:conversor_moedas/core/errors/excptions.dart';
import 'package:conversor_moedas/core/errors/failure.dart';
import 'package:conversor_moedas/core/utils/conectivity_adapter.dart';
import 'package:conversor_moedas/data/data_messages.dart';
import 'package:conversor_moedas/data/datasources/currency_api.dart';
import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:conversor_moedas/domain/entities/currency_live.dart';
import 'package:conversor_moedas/domain/repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyApi currencyoApi;
  final ConnectivityAdapter connectivityAdapter;

  CurrencyRepositoryImpl({
    @required this.currencyoApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, Currency>> list() async {
    if (await connectivityAdapter.isConnected() == true) {
      try {
        return Right(
          await currencyoApi.list(),
        );
      } on ServerApiException catch (e) {
        return Left(
          ServerFailure(menssagem: e.error),
        );
      }
    } else {
      return Left(
        ServerFailure(menssagem: MessagesRepository.noConnection.value),
      );
    }
  }

  @override
  Future<Either<Failure, CurrencyLive>> live() async {
    if (await connectivityAdapter.isConnected() == true) {
      try {
        return Right(
          await currencyoApi.live(),
        );
      } on ServerApiException catch (e) {
        return Left(
          ServerFailure(menssagem: e.error),
        );
      }
    } else {
      return Left(
        ServerFailure(menssagem: MessagesRepository.noConnection.value),
      );
    }
  }
}
