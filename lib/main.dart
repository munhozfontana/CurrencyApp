import 'package:conversor_moedas/initial_widget.dart';
import 'package:conversor_moedas/main_contoller.dart';
import 'package:conversor_moedas/pages/conversor/conversor_controller.dart';
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
        home: InitialWidget(),
      ),
    );
  }
}
