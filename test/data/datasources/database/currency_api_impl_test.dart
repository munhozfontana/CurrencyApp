import 'dart:convert';

import 'package:conversor_moedas/core/errors/excptions.dart';
import 'package:conversor_moedas/data/datasources/apis/currency_api_impl.dart';
import 'package:conversor_moedas/data/datasources/database/currency_database_impl.dart';
import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/FakeRequest.dart';

main() {
  CurrencyDatabaseImpl currencyDatabase;
  http.Client client;

  var currencyJson = fixture("currency.json");

  setUp(() {
    currencyDatabase = CurrencyDatabaseImpl();
  });

  // mocks

  // test("test method currencyApi with exception", () {
  //   // when(client.get(
  //   //   any,
  //   // )).thenThrow(Exception());

  //   // expect(
  //   //     currencyDatabase.list(),
  //   //     throwsA(
  //   //       isA<ClientDataBaseException>(),
  //   //     ));
  // });
}
