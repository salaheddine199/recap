import 'package:flutter/material.dart';
import 'package:recap_awdi/simple_provider_sharedPref/cache_helper.dart';

class MyProvider with ChangeNotifier {
  late ThemeMode themeMode;
  late bool isLight;

  MyProvider() {
    if (CacheHelper.getLightMode() == true) {
      themeMode = ThemeMode.light;
      isLight = true;
    } else {
      themeMode = ThemeMode.dark;
      isLight = false;
    }
  }
  void changeMode(bool newValue) {
    isLight = newValue;
    if (isLight == true) {
      themeMode = ThemeMode.light;
      CacheHelper.setLightMode(val: true);
      print("Theme Mode changed to light mode");
    } else {
      themeMode = ThemeMode.dark;
      CacheHelper.setLightMode(val: false);
      print("Theme Mode changed to dark mode");
    }

    notifyListeners();
  }

  int counter = 0;
  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}
