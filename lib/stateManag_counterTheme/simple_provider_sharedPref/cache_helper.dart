import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences pref_shared;

  static init() async{
    pref_shared = await SharedPreferences.getInstance();
  }

  static Future<bool> setLightMode({required bool val}) async{
    return await pref_shared.setBool('lightMode', val);
  }
  static bool getLightMode(){
    return pref_shared.getBool('lightMode')?? false; // default value is dark mode
  }


}