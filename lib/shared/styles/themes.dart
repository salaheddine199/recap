import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recap_awdi/shared/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: MyColors.kmainColor,
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: Colors.grey,
      fontSize: 12,
    ),
    labelLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 15,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    centerTitle: false,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.grey,
    selectedItemColor: MyColors.kmainColor.withOpacity(.8),
    elevation: 20,
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: MyColors.kmainColorDark,
  scaffoldBackgroundColor: MyColors.ksecondColorDark,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: Colors.white54,
      fontSize: 12,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 15,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: MyColors.kfirstColorDark, // 8062D6
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: MyColors.kfirstColorDark,
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    centerTitle: false,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.white54,
    backgroundColor: MyColors.kfirstColorDark,
    selectedItemColor: Colors.white,
    elevation: 20,
  ),
);

Color hexToColor(String hexString) {
  String formattedString = hexString.toUpperCase().replaceAll("#", "");
  int hexValue = int.parse(formattedString, radix: 16);
  return Color(hexValue | 0xFF000000);
}
