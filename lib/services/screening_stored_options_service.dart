import 'package:unwind_app/services/general_stored_service.dart';

class ScreeningStoredService {
  static const String pagename = 'screening';
  
  static Future<void> writeScreeningAnswer(
      int questionPage, int questionId, bool value) async {
        await GeneralStoredService.writeBoolean(pagename, questionPage, questionId, value);
  }

  static Future<bool?> readScreeningAnswer(
    int questionPage, int questionId) async {
    var result = await GeneralStoredService.readBoolean(pagename, questionPage, questionId);
    return result;
  }

  static Future<void> removeScreeningAnswer(int questionPage, int questionId) async {
    var result = await GeneralStoredService.remove(pagename, questionPage, questionId);
    return result;
  }
}