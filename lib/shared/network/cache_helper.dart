import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _sharedPref;

  static Future<void> init() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> setDarkMode({
    required bool value,
  }) async {
    return await _sharedPref.setBool('DarkModeActive', value);
  }

  static bool getDarkMode() {
    return (_sharedPref.getBool('DarkModeActive') ?? false); // default = true
  }

  static Future<bool> setEnglishLanguage({
    required bool value,
  }) async {
    return await _sharedPref.setBool('EnglishLanguageActive', value);
  }

  static bool getEnglishLanguage() {
    return (_sharedPref.getBool('EnglishLanguageActive') ??
        true); // default = true
  }
}
// todo     try the same with HIVE