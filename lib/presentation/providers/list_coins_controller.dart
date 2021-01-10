import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:conversor_moedas/core/errors/failure.dart';
import 'package:conversor_moedas/domain/usecases/currency_usecase.dart';
import 'package:conversor_moedas/domain/usecases/no_params.dart';
import 'package:conversor_moedas/presentation/providers/utils/loading_controller.dart';
import 'package:conversor_moedas/presentation/providers/utils/utils_providers.dart';
import 'package:conversor_moedas/presentation/vo/list_item.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class ListCoinsController extends LoadingController {
  final CurrencyListUseCase currencyListUseCase;

  List<ListItem> list = [];
  List<ListItem> filterList = [];
  Either<Failure, Currency> res;

  String textFileFind = "";

  ListCoinsController({
    @required this.currencyListUseCase,
  });

  Future<void> init() async {
    changeLoading(true);
    res = await currencyListUseCase(NoParams());
    changeLoading(false);
    res.fold(
      (failure) => failure,
      (success) {
        list = UtilsProviders.jsonToListItem(success.toJson(), "currencies");
        filterList = list;
      },
    );
  }

  void filter(String text) {
    print(text);
    textFileFind = text;
    filterList = UtilsProviders.filterByTitle(list, text);
    notifyListeners();
  }
}
