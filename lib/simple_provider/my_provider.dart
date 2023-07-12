import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;
  bool isLight = true;
  void changeMode(bool newValue){
    isLight = newValue;
    if(isLight == true){
      themeMode = ThemeMode.light;
      print("Theme Mode changed to light mode");
    }else{
      themeMode = ThemeMode.dark;
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