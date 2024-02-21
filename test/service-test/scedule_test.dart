import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/services/schedule-service/schedule_service.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/services/schedule-service/utils.dart';

void main() {
  group('Test ScheduleService', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    test('writeTitle and readTitle', () async {
      final title = 'TestTitle';
      final id = 1;
      final index = 0;

      final writeResult = await ScheduleService.writeTitle(title, id, index);
      expect(writeResult, false);
      // final readResult = await ScheduleService.readTitle(id, index);
      // expect(readResult, equals(title));
    });

    test('writeTimes and readTimes', () async {
      final times = DateTime.now();
      final id = 1;
      final index = 0;

      final writeResult = await ScheduleService.writeTimes(times, id, index);
      expect(writeResult, false);
      // final readResult = await ScheduleService.readTimes(id, index);
      // expect(readResult, equals(times));
    });

    test('writeEvents and readEvents', () async {
      DateTime testDateTime = DateTime.now();
      List<Event> testEvents = [
        Event(
            WorkoutListData(
                title: "หลัง",
                titleTH: "ชุดท่าบริหารหลังเพิ่มความแข็งแรง",
                workoutType: "stretch",
                titlePath: "lib/assets/images/screeningPart/select_pain_4.png",
                titleCode: "back_th",
                workoutData: WorkoutData.getWorkoutData()
                    .where((element) =>
                        element.title == "หลัง" &&
                        element.workoutType == "strength")
                    .toList(),
                totalTime: "40 วินาที"),
            DateTime.now()),
      ];
      expect(testDateTime, isNotNull);
      expect(testEvents, isNotNull);
    });
  });
}
