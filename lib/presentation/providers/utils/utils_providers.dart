import 'package:conversor_moedas/presentation/vo/list_item.dart';
import 'package:flutter/material.dart';

class UtilsProviders {
  static List<DropdownMenuItem<String>> jsonToDowpDown(
      Map<String, dynamic> json, String key) {
    return json[key]
        .entries
        .map<DropdownMenuItem<String>>(
            (MapEntry<String, dynamic> item) => DropdownMenuItem<String>(
                  value: item.key.toString(),
                  child: Text(
                    item.value.toString(),
                  ),
                ))
        .toList();
  }

  static List<ListItem> jsonToListItem(Map<String, dynamic> json, String key) {
    return json[key].entries.map<ListItem>((MapEntry<String, dynamic> item) {
      return ListItem(item.key.toString(), item.value.toString());
    }).toList();
  }

  static List<ListItem> filterByTitle(List<ListItem> list, String text) {
    if (text.isNotEmpty) {
      return list
          .where(
              (item) => item.title.toUpperCase().contains(text.toUpperCase()))
          .toList();
    }
    return list;
  }
}
