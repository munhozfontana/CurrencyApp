import 'package:conversor_moedas/initial_widget.dart';
import 'package:conversor_moedas/presentation/providers/conversor_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Conversor extends StatefulWidget {
  final String title;

  const Conversor({Key key, this.title = "Conversor"});

  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ConversorController>().listCurrency());
    Future.microtask(() => context.read<ConversorController>().liveCurrency());
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Consumer<ConversorController>(
      builder: (_, controller, child) {
        return AddLoading(
          loading: controller.loading,
          child: Container(
            padding: EdgeInsets.all(screenSize.width * .1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  controller.calculateCurrency(
                      controller.selectFromCountry?.value,
                      controller.selectToCountry?.value,
                      controller.money),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: screenSize.width * .3,
                      child: DropdownButton<String>(
                        value: controller.selectFromCountry?.value,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: controller.changeSelectFromCountry,
                        items: controller.listDropDown,
                      ),
                    ),
                    Container(
                      width: screenSize.width * .3,
                      child: DropdownButton<String>(
                          value: controller.selectToCountry?.value,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: controller.changeSelectToCountry,
                          items: controller.listDropDown),
                    ),
                  ],
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  onChanged: controller.onChangedMoney,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
