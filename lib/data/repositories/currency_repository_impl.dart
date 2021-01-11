import 'package:conversor_moedas/core/errors/excptions.dart';
import 'package:conversor_moedas/core/errors/failure.dart';
import 'package:conversor_moedas/core/utils/conectivity_adapter.dart';
import 'package:conversor_moedas/data/data_messages.dart';
import 'package:conversor_moedas/data/datasources/apis/repositories/currency_api.dart';
import 'package:conversor_moedas/data/datasources/database/repositories/currency_database.dart';
import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:conversor_moedas/domain/entities/currency_live.dart';
import 'package:conversor_moedas/domain/repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyApi currencyoApi;
  final CurrencyDatabase currencyDatabase;
  final ConnectivityAdapter connectivityAdapter;

  CurrencyRepositoryImpl({
    @required this.currencyoApi,
    @required this.connectivityAdapter,
    @required this.currencyDatabase,
  });

  @override
  Future<Either<Failure, Currency>> list() async {
    if (await connectivityAdapter.isConnected() == true) {
      try {
        var res = await currencyoApi.list();
        currencyDatabase.saveList(res);
        return Right(res);
      } on ServerApiException catch (e) {
        return Left(
          ServerFailure(menssagem: e.error),
        );
      }
    } else {
      try {
        return Right(await currencyDatabase.list());
      } catch (e) {
        return Left(
          DataBaseFailure(
            menssagem: MessagesRepository.noConnection.value,
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, CurrencyLive>> live() async {
    if (await connectivityAdapter.isConnected() == true) {
      try {
        var res = await currencyoApi.live();
        currencyDatabase.saveLive(res);
        return Right(res);
      } on ServerApiException catch (e) {
        return Left(
          ServerFailure(menssagem: e.error),
        );
      }
    } else {
      try {
        return Right(await currencyDatabase.live());
      } catch (e) {
        return Left(
          DataBaseFailure(
            menssagem: MessagesRepository.noConnection.value,
          ),
        );
      }
    }
  }
}
