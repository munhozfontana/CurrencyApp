import 'package:flutter/material.dart';

class FormStyle {
  InputDecoration getInputDecorator({Icon icon = const Icon(Icons.done)}) {
    return InputDecoration(
      prefixIcon: icon,
    );
  }
}
