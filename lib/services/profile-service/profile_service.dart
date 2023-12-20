import 'package:unwind_app/services/general_stored_service.dart';

class ProfileService {
  static const pagename = "Profile";
  static const Map<String, int> indexs = {"name": 0, "lastname": 1};
  static const int id = 0;

  static Future<bool> writeName(String value) async {
    final int? index = indexs["name"];
    if (index != null) {
      GeneralStoredService.writeString(pagename, id, index, value);
      return true;
    }
    return false;
  }

  static Future<String> getName() async {
    final int? index = indexs["name"];
    if (index != null) {
      final String? name =
          await GeneralStoredService.readString(pagename, id, index);
      if (name != null) {
        return name;
      } else {
        return "";
      }
    }
    return "";
  }

  static Future<bool> writeLastname(String value) async {
    final int? index = indexs["lastname"];
    if (index != null) {
      GeneralStoredService.writeString(pagename, id, index, value);
      return true;
    }
    return false;
  }

  static Future<String> getLastname() async {
    final int? index = indexs["lastname"];
    if (index != null) {
      final String? lastname =
          await GeneralStoredService.readString(pagename, id, index);
      if (lastname != null) {
        return lastname;
      } else {
        return "";
      }
    }
    return "";
  }
}
