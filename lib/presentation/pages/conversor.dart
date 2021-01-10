import 'package:conversor_moedas/initial_widget.dart';
import 'package:conversor_moedas/presentation/providers/conversor_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Consumer<ConversorController>(
      builder: (_, controller, child) {
        controller.calculateCurrency(
            controller.selectFromCountry, controller.selectFromCountry);

        return AddLoading(
          loading: controller.loading,
          child: Container(
            padding: EdgeInsets.all(screenSize.width * .1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("a"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // DropdownButton<String>(
                    //   value: controller.selectFromCountry?.code,
                    //   icon: Icon(Icons.arrow_downward),
                    //   iconSize: 24,
                    //   elevation: 16,
                    //   style: TextStyle(color: Colors.deepPurple),
                    //   underline: Container(
                    //     height: 2,
                    //     color: Colors.deepPurpleAccent,
                    //   ),
                    //   onChanged: controller.changeSelectFromCountry,
                    //   items: controller.resListCurrency
                    //       .map<DropdownMenuItem<String>>((value) {
                    //     return DropdownMenuItem(
                    //       value: value.code,
                    //       child: Container(
                    //           width: screenSize.width * .2,
                    //           child: Text(value.name.toString())),
                    //     );
                    //   }).toList(),
                    // ),
                    // DropdownButton<String>(
                    //   value: controller.selectToCountry?.code,
                    //   icon: Icon(Icons.arrow_downward),
                    //   iconSize: 24,
                    //   elevation: 16,
                    //   style: TextStyle(color: Colors.deepPurple),
                    //   underline: Container(
                    //     height: 2,
                    //     color: Colors.deepPurpleAccent,
                    //   ),
                    //   onChanged: controller.changeSelectToCountry,
                    //   items: controller.resListCurrency
                    //       .map<DropdownMenuItem<String>>((value) {
                    //     return DropdownMenuItem(
                    //       value: value.code,
                    //       child: Container(
                    //           width: screenSize.width * .2,
                    //           child: Text(value.name.toString())),
                    //     );
                    //   }).toList(),
                    // ),
                  ],
                ),
                TextFormField(),
              ],
            ),
          ),
        );
      },
    );
  }
}
