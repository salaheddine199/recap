import 'package:flutter/material.dart';

class MyColors {
  static MaterialColor kmainColor = Colors.purple;
  static MaterialColor kmainColorDark = Colors.blueGrey;
  static Color ksecondColorDark = hexToColor("#322653");
  static Color kfirstColorDark =   hexToColor("#322653");//hexToColor("#9288F8");
}

Color hexToColor(String hexString) {
  String formattedString = hexString.toUpperCase().replaceAll("#", "");
  int hexValue = int.parse(formattedString, radix: 16);
  return Color(hexValue | 0xFF000000);
}
