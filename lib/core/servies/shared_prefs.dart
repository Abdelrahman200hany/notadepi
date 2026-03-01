import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _instance;
  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static setListOfString({
    required String key,
    required List<String> noteList,
  }) {
    _instance.setStringList(key, noteList);
  }

  static getListOfString({required String key}) {
    return _instance.getStringList(key) ?? [];
  }
}
