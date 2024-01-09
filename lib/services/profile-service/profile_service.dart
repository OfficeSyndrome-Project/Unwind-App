import 'dart:async';

import 'package:unwind_app/models/user.dart';
import 'package:unwind_app/services/general_stored_service.dart';

class ProfileService {
  static const pagename = "Profile";
  static const Map<String, int> indexs = {
    "name": 0,
    "lastname": 1,
    "age": 2,
    "sex": 3,
    "height": 4,
    "weight": 5,
    "career": 6,
    "accident": 7,
  };
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

  static Future<bool> writeAge(int value) async {
    final int? index = indexs["age"];
    if (index != null) {
      GeneralStoredService.writeInt(pagename, id, index, value);
      return true;
    }
    return false;
  }

  static Future<int> getAge() async {
    final int? index = indexs["age"];
    if (index != null) {
      final int? age = await GeneralStoredService.readInt(pagename, id, index);
      if (age != null) {
        return age;
      } else {
        return -1;
      }
    }
    return -1;
  }

  static Future<bool> writeSex(String value) async {
    final int? index = indexs["sex"];
    if (index != null) {
      GeneralStoredService.writeString(pagename, id, index, value);
      return true;
    }
    return false;
  }

  static Future<String> getSex() async {
    final int? index = indexs["sex"];
    if (index != null) {
      final String? sex =
          await GeneralStoredService.readString(pagename, id, index);
      if (sex != null) {
        return sex;
      } else {
        return "";
      }
    }
    return "";
  }

  static Future<bool> writeHeight(int value) async {
    final int? index = indexs["height"];
    if (index != null) {
      GeneralStoredService.writeInt(pagename, id, index, value);
      return true;
    }
    return false;
  }

  static Future<int> getHeight() async {
    final int? index = indexs["height"];
    if (index != null) {
      final int? height =
          await GeneralStoredService.readInt(pagename, id, index);
      if (height != null) {
        return height;
      } else {
        return -1;
      }
    }
    return -1;
  }

  static Future<bool> writeWeight(int value) async {
    final int? index = indexs["weight"];
    if (index != null) {
      GeneralStoredService.writeInt(pagename, id, index, value);
      return true;
    }
    return false;
  }

  static Future<int> getWeight() async {
    final int? index = indexs["weight"];
    if (index != null) {
      final int? weight =
          await GeneralStoredService.readInt(pagename, id, index);
      if (weight != null) {
        return weight;
      } else {
        return -1;
      }
    }
    return -1;
  }

  static Future<bool> writeCareer(String value) async {
    final int? index = indexs["career"];
    if (index != null) {
      GeneralStoredService.writeString(pagename, id, index, value);
      return true;
    }
    return false;
  }

  static Future<String> getCareer() async {
    final int? index = indexs["career"];
    if (index != null) {
      final String? career =
          await GeneralStoredService.readString(pagename, id, index);
      if (career != null) {
        return career;
      } else {
        return "";
      }
    }
    return "";
  }

  static Future<bool> writeAccident(String value) async {
    final int? index = indexs["accident"];
    if (index != null) {
      GeneralStoredService.writeString(pagename, id, index, value);
      return true;
    }
    return false;
  }

  static Future<String> getAccident() async {
    final int? index = indexs["accident"];
    if (index != null) {
      final String? accident =
          await GeneralStoredService.readString(pagename, id, index);
      if (accident != null) {
        return accident;
      } else {
        return "";
      }
    }
    return "";
  }

  static Future<bool> writeUser(User newUser) async {
    List<bool> results = [];
    results.add(await writeName(newUser.firstName));
    results.add(await writeLastname(newUser.lastName));
    results.add(await writeAge(newUser.age));
    results.add(await writeSex(newUser.sex));
    results.add(await writeHeight(newUser.height));
    results.add(await writeWeight(newUser.weight));
    results.add(await writeCareer(newUser.career));
    results.add(await writeAccident(newUser.accident));
    if (results.toSet().toList().length <= 1 &&
        results.toSet().toList().contains(true)) {
      return true;
    } else {
      return false;
    }
  }

  static Future<User> getUser() async {
    return User(
      firstName: await getName(),
      lastName: await getLastname(),
      age: await getAge(),
      sex: await getSex(),
      height: await getHeight(),
      weight: await getWeight(),
      career: await getCareer(),
      accident: await getAccident(),
    );
  }
}
