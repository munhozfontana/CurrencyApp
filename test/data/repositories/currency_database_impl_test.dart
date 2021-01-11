import 'package:conversor_moedas/core/errors/excptions.dart';
import 'package:conversor_moedas/core/errors/failure.dart';
import 'package:conversor_moedas/core/utils/conectivity_adapter.dart';
import 'package:conversor_moedas/data/datasources/apis/repositories/currency_api.dart';
import 'package:conversor_moedas/data/datasources/database/repositories/currency_database.dart';
import 'package:conversor_moedas/data/repositories/currency_repository_impl.dart';
import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:conversor_moedas/domain/entities/currency_live.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockContatoApi extends Mock implements CurrencyApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

class MockCurrencyDatabase extends Mock implements CurrencyDatabase {}

void main() {
  CurrencyRepositoryImpl currencyRepositoryImpl;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockContatoApi mockContatoApi;
  MockCurrencyDatabase mockCurrencyDatabase;

  var currency = Currency();
  var currencyLive = CurrencyLive();

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockCurrencyDatabase = MockCurrencyDatabase();
    mockContatoApi = MockContatoApi();
    currencyRepositoryImpl = CurrencyRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      currencyDatabase: mockCurrencyDatabase,
      currencyoApi: mockContatoApi,
    );
  });

  void mockContatoApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected())
            .thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockContatoApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected())
            .thenAnswer((_) async => false);
      });
      body();
    });
  }

  mockContatoApiConnected(() {
    test('test call list no failure', () async {
      when(mockContatoApi.list()).thenAnswer((_) async => currency);

      var res = await currencyRepositoryImpl.list();

      expect(res.fold((l) => l, (r) => r), isA<Currency>());
    });

    test('test call list with failure', () async {
      when(mockContatoApi.list()).thenThrow(ServerApiException());

      var res = await currencyRepositoryImpl.list();

      expect(res.fold((l) => l, (r) => r), isA<ServerFailure>());
    });

    test('test call live no failure', () async {
      when(mockContatoApi.live()).thenAnswer((_) async => currencyLive);

      var res = await currencyRepositoryImpl.live();

      expect(res.fold((l) => l, (r) => r), isA<CurrencyLive>());
    });

    test('test call live with failure', () async {
      when(mockContatoApi.live()).thenThrow(ServerApiException());

      var res = await currencyRepositoryImpl.live();

      expect(res.fold((l) => l, (r) => r), isA<ServerFailure>());
    });
  });

  mockContatoApiDisconnected(() {
    test('test call list no failure', () async {
      when(mockCurrencyDatabase.list()).thenAnswer((_) async => currency);

      var res = await currencyRepositoryImpl.list();

      expect(res.fold((l) => l, (r) => r), isA<Currency>());
    });

    test('test call list with failure', () async {
      when(mockCurrencyDatabase.list()).thenThrow(Exception());

      var res = await currencyRepositoryImpl.list();

      expect(res.fold((l) => l, (r) => r), isA<DataBaseFailure>());
    });

    test('test call live no failure', () async {
      when(mockCurrencyDatabase.live()).thenAnswer((_) async => currencyLive);

      var res = await currencyRepositoryImpl.live();

      expect(res.fold((l) => l, (r) => r), isA<CurrencyLive>());
    });

    test('test call live with failure', () async {
      when(mockCurrencyDatabase.live()).thenThrow(ServerApiException());

      var res = await currencyRepositoryImpl.live();

      expect(res.fold((l) => l, (r) => r), isA<DataBaseFailure>());
    });
  });
}
