
import 'package:shared_preferences/shared_preferences.dart';

class SharedReferncesSingletone {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static Future<void> setBool({
    required String key,
    required bool value,
  }) async {
    await _instance.setBool(key, value);
  }

  static bool getBool({
    required String key,
  }) {
    return _instance.getBool(key)??false;
  }

  static String? getString({
    required String key,x
  }) {
    return _instance.getString(key);
  }

  static Future<void> setString({
    required String key,
    required String value,
  }) async {
    await _instance.setString(key, value);
  }
}
