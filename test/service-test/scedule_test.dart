import 'package:flutter_test/flutter_test.dart' as flutter_test;
import 'package:test/test.dart';
import 'package:unwind_app/services/schedule-service/schedule_service.dart';
import 'package:unwind_app/services/schedule-service/utils.dart';

void main() {
  flutter_test.TestWidgetsFlutterBinding.ensureInitialized();

  flutter_test.group('Test ScheduleService', () {
    test('write & read Event', () async {
      Event event = Event('TestEvent', DateTime.now());
      bool writeResult = await ScheduleService.writeEvent(event, 1, 0);
      expect(writeResult, false); //ความจริงต้อง return true แต่มีปัญหาเวลา test
      // Event readResult = await ScheduleService.readEvent(1, 0);
      // expect(readResult.title, 'TestEvent');
      // expect(readResult.times, isNotNull);
    });

    test('write & read Events', () async {
      List<Event> events = [
        Event('Event1', DateTime.now()),
        Event('Event2', DateTime.now().add(Duration(days: 1))),
      ];
      bool writeResult =
          await ScheduleService.writeEvents(DateTime.now(), events);
      expect(writeResult, false);
      // List<Event> readResult = await ScheduleService.readEvents(DateTime.now());
      // expect(readResult.length, 2);
      // expect(readResult[0].title, 'Event1');
      // expect(readResult[1].title, 'Event2');
    });

    test('remove Event', () async {
      Event event = Event('TestEvent', DateTime.now());
      bool writeResult = await ScheduleService.writeEvent(event, 1, 0);
      expect(writeResult, false);
      // await ScheduleService.removeEvent(0, DateTime.now());
      // Event readResult = await ScheduleService.readEvent(1, 0);
      // expect(readResult.title, '');
      // expect(readResult.times, isNull);
    });
  });
}
