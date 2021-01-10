import 'package:conversor_moedas/initial_widget.dart';
import 'package:conversor_moedas/presentation/providers/list_coins_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCoins extends StatefulWidget {
  @override
  _ListCoinsState createState() => _ListCoinsState();
}

class _ListCoinsState extends State<ListCoins> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ListCoinsController>().init());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ListCoinsController>(
      builder: (_, controller, child) {
        return AddLoading(
          loading: controller.loading,
          child: Container(
            child: ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                final item = controller.list[index];
                return ListTile(
                  title: item.buildTitle(context),
                  subtitle: item.buildSubtitle(context),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
