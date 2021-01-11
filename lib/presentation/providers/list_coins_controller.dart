import 'package:conversor_moedas/domain/entities/currency.dart';
import 'package:conversor_moedas/core/errors/failure.dart';
import 'package:conversor_moedas/domain/usecases/currency_usecase.dart';
import 'package:conversor_moedas/domain/usecases/no_params.dart';
import 'package:conversor_moedas/domain/usecases/params.dart';
import 'package:conversor_moedas/presentation/providers/utils/loading_controller.dart';
import 'package:conversor_moedas/presentation/providers/utils/utils_providers.dart';
import 'package:conversor_moedas/presentation/vo/list_item.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

enum OrderBy { normal, invert }

class ListCoinsController extends LoadingController {
  final CurrencyListUseCase currencyListUseCase;

  List<ListItem> list = [];
  List<ListItem> filterList = [];
  Either<Failure, Currency> res;

  String textFileFind = "";

  OrderBy filterOrderBy = OrderBy.normal;

  ListCoinsController({
    @required this.currencyListUseCase,
  });

  Future<void> init() async {
    changeLoading(true);
    res = await currencyListUseCase(Params(syncLocalBase: true));
    changeLoading(false);
    res.fold(
      (failure) => failure,
      (success) {
        list = UtilsProviders.jsonToListItem(success.toJson(), "currencies");
        filterList = list;
        toNormal();
      },
    );
  }

  void filter(String text) {
    print(text);
    textFileFind = text;
    filterList = UtilsProviders.filterByTitle(list, text);
    notifyListeners();
  }

  void orderBy() {
    if (filterOrderBy == OrderBy.normal) {
      toNormal();
    } else {
      toInvert();
    }

    notifyListeners();
  }

  void toInvert() {
    filterOrderBy = OrderBy.normal;
    filterList.sort((a, b) {
      return b.title.toLowerCase().compareTo(a.title.toLowerCase());
    });
  }

  void toNormal() {
    filterOrderBy = OrderBy.invert;
    filterList.sort((a, b) {
      return a.title.toLowerCase().compareTo(b.title.toLowerCase());
    });
  }
}
