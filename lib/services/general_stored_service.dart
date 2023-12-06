import 'package:shared_preferences/shared_preferences.dart';

class GeneralStoredService {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static String getKey(String pagename, int id, int index) {
    return pagename + id.toString() + index.toString();
  }

  static Future<bool> writeBoolean(
      String pagename, int id, int index, bool value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(getKey(pagename, id, index), value);
    return value;
  }

  static Future<bool?> readBoolean(String pagename, int id, int index) async {
    final SharedPreferences prefs = await _prefs;

    var value = prefs.getBool(getKey(pagename, id, index));
    return value;
  }

  static Future<void> remove(String pagename, int id, int index) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(getKey(pagename, id, index));
  }
}
