import 'package:conversor_moedas/pages/conversor/conversor.dart';
import 'package:conversor_moedas/pages/conversor/conversor_controller.dart';
import 'package:conversor_moedas/pages/lista_moedas.dart';
import 'package:conversor_moedas/services/models/liveCurrency.dart';
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
      ChangeNotifierProxyProvider<MainController, ConversorController>(
        update: (context, mainController, previous) {
          return ConversorController(mainController: mainController);
        },
        create: (context) => ConversorController(),
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
        home: HomeWidget(),
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("provider"),
      ),
      body: Container(
        child: Center(
          child: Consumer2<ConversorController, MainController>(
            builder: (context, conversor, main, child) => GestureDetector(
              onTap: () => conversor.listCurrency(),
              child: Text(
                main.loading.toString(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainController extends ChangeNotifier {
  int selectedIndex = 0;
  bool loading = false;

  void changeIndex(index) {
    selectedIndex = index;
  }

  void changeLoading() {
    loading = !loading;
    notifyListeners();
  }
}
