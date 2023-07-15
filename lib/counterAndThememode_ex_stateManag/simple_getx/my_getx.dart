import 'package:get/get.dart';
import 'cache_helper.dart';


class MyGetx extends GetxController{

  late bool isLight;
  // bool isLight = CacheHelper.getLightMode()? true:false;

  MyGetx(){
    // ignore: curly_braces_in_flow_control_structures
    if (CacheHelper.getLightMode() == true) 
      isLight = true;
    else  
      isLight = false;

    print("getx caaaaaaalled :p");
  }

void changeMode(bool newValue) {
    isLight = newValue;
    if (isLight == true) {
      CacheHelper.setLightMode(val: true);
      print("Theme Mode changed to light mode");
    } else {
      CacheHelper.setLightMode(val: false);
      print("Theme Mode changed to dark mode");
    }

    update();
  }

  int counter = 0;
  void incrementCounter() {
    counter++;
    update();
  }

}