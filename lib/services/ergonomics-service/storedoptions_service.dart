import 'package:shared_preferences/shared_preferences.dart';
import 'package:unwind_app/services/ergonomics-service/question_service.dart';

class StoredOptionsService {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static String getKey(int questionIndex, int idCategory) {
    return idCategory.toString() + questionIndex.toString();
  }

  static Future<void> writeCurrentOptions(
      int questionIndex, bool value, int idCategory) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(getKey(questionIndex, idCategory), value);
  }

  static Future<Map<int, bool?>> readCurrntOptions(int idCategory) async {
    final SharedPreferences prefs = await _prefs;
    int questionLength = QuestionService.getLenghtByIdCategory(idCategory);
    Map<int, bool?> storedOptions = {};

    for (var i = 1; i <= questionLength; i++) {
      var value = prefs.getBool(getKey(i, idCategory));
      storedOptions[i] = value;
    }

    return storedOptions;
  }

  static Future<void> removeStoredOptions(int idCategory) async {
    final SharedPreferences prefs = await _prefs;
    int questionLength = QuestionService.getLenghtByIdCategory(idCategory);

    for (var i = 1; i <= questionLength; i++) {
      prefs.remove(getKey(i, idCategory));
    }
  }

  static Future<void> clearStoredOptions() async {
    var allIdCategory = QuestionService.getAllIdCategory();

    for (var idCategory in allIdCategory) {
      await removeStoredOptions(idCategory);
    }
  }
}
