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

  static Future<bool> writeString(
      String pagename, int id, int index, String value) async {
    try {
      final SharedPreferences prefs = await _prefs;
      prefs.setString(getKey(pagename, id, index), value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<String?> readString(String pagename, int id, int index) async {
    final SharedPreferences prefs = await _prefs;

    var value = prefs.getString(getKey(pagename, id, index));
    return value;
  }

  static Future<bool> writeInt(
      String pagename, int id, int index, int value) async {
    try {
      final SharedPreferences prefs = await _prefs;
      prefs.setInt(getKey(pagename, id, index), value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<int?> readInt(String pagename, int id, int index) async {
    final SharedPreferences prefs = await _prefs;

    var value = prefs.getInt(getKey(pagename, id, index));
    return value;
  }

  static Future<bool> writeDateTime(
      String pagename, int id, int index, DateTime value) async {
    try {
      final SharedPreferences prefs = await _prefs;
      prefs.setString(getKey(pagename, id, index), value.toString());
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<DateTime> readDateTime(
      String pagename, int id, int index) async {
    final SharedPreferences prefs = await _prefs;

    var value = prefs.getString(getKey(pagename, id, index));
    return DateTime.parse(value!);
  }
}
