import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  static getString(String key) {
    return _sharedPreferences.getString(key);
  }
}
