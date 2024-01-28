import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unwind_app/services/ergonomics-service/storedoptions_service.dart';

void main() {
  group('test ergonomic options', () {
    test('Write and Read options', () async {
      SharedPreferences.setMockInitialValues({});
      await StoredOptionsService.writeCurrentOptions(1, true, 1);
      final storedOptions = await StoredOptionsService.readCurrntOptions(1);
      expect(storedOptions, {1: true, 2: null, 3: null, 4: null, 5: null});
    });

    test('Remove stored options', () async {
      SharedPreferences.setMockInitialValues({
        '1': true,
        '2': false,
      });
      await StoredOptionsService.removeStoredOptions(1);
      final storedOptions = await StoredOptionsService.readCurrntOptions(1);
      expect(storedOptions, {1: null, 2: null, 3: null, 4: null, 5: null});
    });

    test('Clear stored options', () async {
      SharedPreferences.setMockInitialValues({'1': true, '2': false});
      await StoredOptionsService.clearStoredOptions();
      final storedOptions1 = await StoredOptionsService.readCurrntOptions(1);
      final storedOptions2 = await StoredOptionsService.readCurrntOptions(2);
      final storedOptions3 = await StoredOptionsService.readCurrntOptions(3);
      final storedOptions4 = await StoredOptionsService.readCurrntOptions(4);
      final storedOptions5 = await StoredOptionsService.readCurrntOptions(5);
      final storedOptions6 = await StoredOptionsService.readCurrntOptions(6);
      //idCategory1 มี 5 คำถาม
      expect(storedOptions1, {1: null, 2: null, 3: null, 4: null, 5: null});
      //idCategory2 มี 6 คำถาม
      expect(storedOptions2,
          {1: null, 2: null, 3: null, 4: null, 5: null, 6: null});
      //idCategory3 มี 3 คำถาม
      expect(storedOptions3, {1: null, 2: null, 3: null});
      //idCategory4 มี 2 คำถาม
      expect(storedOptions4, {1: null, 2: null});
      //idCategory5 มี 2 คำถาม
      expect(storedOptions5, {1: null, 2: null});
      //idCategory6 มี 1 คำถาม
      expect(storedOptions6, {1: null});
    });
  });
}
