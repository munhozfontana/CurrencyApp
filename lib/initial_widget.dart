import 'package:conversor_moedas/core/components/global_app_bar.dart';
import 'package:conversor_moedas/core/components/global_bottom_navigation_bar.dart';
import 'package:conversor_moedas/main_contoller.dart';
import 'package:conversor_moedas/pages/conversor/conversor.dart';
import 'package:conversor_moedas/pages/lista_moedas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitialWidget extends StatefulWidget {
  @override
  _InitialWidgetState createState() => _InitialWidgetState();
}

class _InitialWidgetState extends State<InitialWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar().build(context),
      bottomNavigationBar: GlobalBottomNavigationBar(),
      body: Consumer<MainController>(
        builder: (context, main, child) {
          return main.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : <Widget>[
                  Conversor(),
                  ListaMoedas(),
                ].elementAt(0);
        },
      ),
    );
  }
}
