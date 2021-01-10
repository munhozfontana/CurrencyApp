import 'package:conversor_moedas/presentation/components/global_app_bar.dart';
import 'package:conversor_moedas/presentation/components/global_bottom_navigation_bar.dart';
import 'package:conversor_moedas/presentation/pages/conversor.dart';
import 'package:conversor_moedas/presentation/pages/list_coins.dart';
import 'package:conversor_moedas/presentation/providers/utils/main_contoller.dart';
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
        builder: (_, main, child) {
          return <Widget>[
            Conversor(),
            ListCoins(),
          ].elementAt(main.selectedIndex);
        },
      ),
    );
  }
}

class AddLoading extends StatelessWidget {
  final bool loading;
  final Widget child;

  const AddLoading({
    this.loading = false,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (loading)
          Container(
            color: Colors.grey.withOpacity(.3),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
