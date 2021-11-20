import 'package:flutter/material.dart';

class Boxs {
  int? id;
  Color? color;
  bool? disable;
  String? text;

  Boxs(
      {this.id,
      this.color = Colors.grey,
      this.disable = false,
      this.text = ""});
}
