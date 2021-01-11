import 'dart:convert';

import 'package:conversor_moedas/core/errors/excptions.dart';
import 'package:conversor_moedas/data/datasources/apis/currency_api_impl.dart';
import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../fixtures/FakeRequest.dart';

class MockClient extends Mock implements http.Client {}

main() {
  CurrencyApiImpl currencyApi;
  http.Client client;

  var currencyJson = fixture("currency.json");

  setUp(() {
    client = MockClient();
    currencyApi = CurrencyApiImpl(client: client);
  });

  // mocks

  test("test method currencyApi with success", () async {
    when(client.get(
      any,
    )).thenAnswer(
      (_) async => http.Response(currencyJson, 200),
    );

    await currencyApi.list();
  });

  test("test method currencyApi with exception", () {
    when(client.get(
      any,
    )).thenThrow(ServerApiException());

    expect(
        currencyApi.list(),
        throwsA(
          isA<ServerApiException>(),
        ));
  });
}
