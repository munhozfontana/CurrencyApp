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
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Container(
                      height: constraints.maxHeight * .15,
                      width: constraints.maxWidth * .9,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.find_in_page),
                          hintText: "Enter a message",
                          suffixIcon: IconButton(
                            onPressed: controller.orderBy,
                            icon: Icon(
                                controller.filterOrderBy == OrderBy.normal
                                    ? Icons.arrow_downward
                                    : Icons.arrow_upward),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        onChanged: controller.filter,
                      ),
                    ),
                    Container(
                      height: constraints.maxHeight * .85,
                      child: ListView.builder(
                        itemCount: controller.filterList.length,
                        itemBuilder: (context, index) {
                          final item = controller.filterList[index];
                          return ListTile(
                            title: item.buildTitle(context),
                            subtitle: item.buildSubtitle(context),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
