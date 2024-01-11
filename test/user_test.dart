import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unwind_app/models/user.dart';
import 'package:unwind_app/services/profile-service/profile_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  group('Test create user', () {
    User user = User();
    test('creat user firstname', () async {
      user.firstName = 'nadthanicha';
      await ProfileService.writeName(user.firstName);
      User storageUser = await ProfileService.getUser();
      expect(storageUser.firstName, 'nadthanicha');
    });
    test('creat user lastname', () async {
      user.lastName = 'ardsuwan';
      await ProfileService.writeLastname(user.lastName);
      User storageUser = await ProfileService.getUser();
      expect(storageUser.lastName, 'ardsuwan');
    });
    test('creat user age', () async {
      user.age = 23;
      await ProfileService.writeAge(user.age);
      User storageUser = await ProfileService.getUser();
      expect(storageUser.age, 23);
    });
    test('creat user sex', () async {
      user.sex = 'หญิง';
      await ProfileService.writeSex(user.sex);
      User storageUser = await ProfileService.getUser();
      expect(storageUser.sex, 'หญิง');
    });
    test('creat user height', () async {
      user.height = 158;
      await ProfileService.writeHeight(user.height);
      User storageUser = await ProfileService.getUser();
      expect(storageUser.height, 158);
    });
    test('creat user weight', () async {
      user.weight = 45;
      await ProfileService.writeWeight(user.weight);
      User storageUser = await ProfileService.getUser();
      expect(storageUser.weight, 45);
    });
    test('creat user career', () async {
      user.career = 'นักเรียน/นักศึกษา';
      await ProfileService.writeCareer(user.career);
      User storageUser = await ProfileService.getUser();
      expect(storageUser.career, 'นักเรียน/นักศึกษา');
    });
    test('creat user accident', () async {
      user.accident = 'เคย';
      await ProfileService.writeAccident(user.accident);
      User storageUser = await ProfileService.getUser();
      expect(storageUser.accident, 'เคย');
    });
  });
}
