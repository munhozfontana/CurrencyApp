import 'package:flutter/material.dart';

class ListItem {
  final String title;
  final String subtitle;

  ListItem(this.title, this.subtitle);

  Widget buildTitle(BuildContext context) => Text(title);

  Widget buildSubtitle(BuildContext context) => Text(subtitle);
}
