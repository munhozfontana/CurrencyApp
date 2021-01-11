import 'package:conversor_moedas/core/utils/conectivity_adapter.dart';
import 'package:conversor_moedas/data/datasources/apis/currency_api_impl.dart';
import 'package:conversor_moedas/data/datasources/database/currency_database_impl.dart';
import 'package:conversor_moedas/data/datasources/database/repositories/currency_database.dart';
import 'package:conversor_moedas/data/repositories/currency_repository_impl.dart';
import 'package:conversor_moedas/domain/usecases/currency_usecase.dart';
import 'package:conversor_moedas/initial_widget.dart';
import 'package:conversor_moedas/presentation/providers/conversor_controller.dart';
import 'package:conversor_moedas/presentation/providers/list_coins_controller.dart';
import 'package:conversor_moedas/presentation/providers/main_contoller.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  List<SingleChildWidget> get providers {
    return [
      ChangeNotifierProvider<MainController>.value(value: MainController()),
      ChangeNotifierProvider<ListCoinsController>.value(
        value: ListCoinsController(
          currencyListUseCase: CurrencyListUseCase(
            currencyRepository: CurrencyRepositoryImpl(
                currencyoApi: CurrencyApiImpl(),
                connectivityAdapter: ConnectivityAdapterImpl(),
                currencyDatabase: SharedPreferencesDatabase()),
          ),
        ),
      ),
      ChangeNotifierProvider<ConversorController>.value(
        value: ConversorController(
          currencyLiveUseCase: CurrencyLiveUseCase(
            currencyRepository: CurrencyRepositoryImpl(
              currencyDatabase: SharedPreferencesDatabase(),
              currencyoApi: CurrencyApiImpl(),
              connectivityAdapter: ConnectivityAdapterImpl(),
            ),
          ),
          currencyListUseCase: CurrencyListUseCase(
            currencyRepository: CurrencyRepositoryImpl(
              currencyDatabase: SharedPreferencesDatabase(),
              currencyoApi: CurrencyApiImpl(),
              connectivityAdapter: ConnectivityAdapterImpl(),
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Demo",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: InitialWidget(),
      ),
    );
  }
}
