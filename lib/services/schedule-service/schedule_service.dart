import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/services/schedule-service/notification_service.dart';
import 'package:unwind_app/services/schedule-service/utils.dart';
import 'package:unwind_app/services/general_stored_service.dart';

class ScheduleService {
  static const pagename = "Schedule";

  static final kEvents = LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  static final kToday = getDateTimeToday();

  static final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
  static final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

  static Future<bool> writeEvent(Event event, int id, int index) async {
    List<bool> results = [];

    results.add(await writeTitle(event.wol?.titleCode ?? '', id, index));
    results.add(await writeTimes(event.times, id, index));

    if (results.contains(false)) {
      return false;
    } else
      return true;
  }

  static Future<Event> readEvent(int id, int index) async {
    final title = await readTitle(id, index);
    final times = await readTimes(id, index);

    return Event(WorkoutListData.workoutListFromTitleCode[title], times);
  }

  static Future<bool> writeTitle(String title, int id, int index) async {
    return await GeneralStoredService.writeString(
        pagename + 'title', id, index, title);
  }

  static Future<String> readTitle(int id, int index) async {
    return await GeneralStoredService.readString(
            pagename + 'title', id, index) ??
        '';
  }

  static Future<bool> writeTimes(DateTime times, int id, int index) async {
    return await GeneralStoredService.writeDateTime(
        pagename + 'times', id, index, times);
  }

  static Future<DateTime> readTimes(int id, int index) async {
    return await GeneralStoredService.readDateTime(
        pagename + 'times', id, index);
  }

  static Future<bool> writeEvents(DateTime times, List<Event> events) async {
    int id = getDaySinceEpoch(times);
    List<bool> results = [];
    for (var index = 0; index < events.length; index++) {
      results.add(await writeEvent(events[index], id, index));
      results.add(await writeLength(events.length, times));

      NotificationService.scheduleNotification(
          selectedDay: events[index].times,
          id: index,
          title: 'ดูเหมือนว่าคุณจะต้องบริหารร่างกายแล้ว~ !',
          body: events[index].wol?.titleTH ?? '');
    }
    if (results.contains(false)) {
      return false;
    } else
      return true;
  }

  static Future<List<Event>> readEvents(DateTime times) async {
    int id = getDaySinceEpoch(times);
    List<Event> events = [];

    int length = await readLength(times);
    for (var index = 0; index < length; index++) {
      events.add(await readEvent(id, index));
    }
    return events;
  }

  static Future<void> removeEvent(int index, DateTime selectedDay) async {
    final int length = await readLength(selectedDay);
    final List<Event> events = await readEvents(selectedDay);
    if (index >= 0 && index < events.length) {
      events.removeAt(index);
      await writeEvents(selectedDay, events);

      if (length == 1) {
        final List<DateTime> selectedDays = await readSelectedDays();
        final int size = await readkEventsSize();
        final List<DateTime> newSeletedDays =
            selectedDays.where((day) => day != selectedDay).toList();

        await writeSelectedDays(newSeletedDays, size);
        await writekEventsSize(size - 1);
      }
      NotificationService.cancel(index);
    }
  }

  static Future<bool> writeLength(int length, DateTime times) async {
    int id = getDaySinceEpoch(times);

    return await GeneralStoredService.writeInt(
        pagename + 'length', id, 0, length);
  }

  static Future<int> readLength(DateTime times) async {
    int id = getDaySinceEpoch(times);
    return await GeneralStoredService.readInt(pagename + 'length', id, 0) ?? 0;
  }

  static Future<bool> writekEventsSize(int size) async {
    return await GeneralStoredService.writeInt(
        pagename + 'kEventSize', 0, 0, size);
  }

  static Future<int> readkEventsSize() async {
    return await GeneralStoredService.readInt(pagename + 'kEventSize', 0, 0) ??
        0;
  }

  static Future<bool> writeSelectedDays(
      List<DateTime> selectedDays, int size) async {
    List<bool> results = [];
    results.add(await writekEventsSize(selectedDays.length));

    for (var index = 0; index < selectedDays.length; index++) {
      results.add(await GeneralStoredService.writeDateTime(
          pagename + 'selectedDays', 0, index, selectedDays[index]));
    }
    if (results.contains(false)) {
      return false;
    } else
      return true;
  }

  static Future<List<DateTime>> readSelectedDays() async {
    final size = await readkEventsSize();
    List<DateTime> selectedDays = [];
    for (var index = 0; index < size; index++) {
      selectedDays.add(await GeneralStoredService.readDateTime(
          pagename + 'selectedDays', 0, index));
    }
    return selectedDays;
  }

  static Future<bool> writekEvents(
      LinkedHashMap<DateTime, List<Event>> _kEvents) async {
    List<bool> results = [];
    final selectedDays = _kEvents.keys.toList();
    results.add(await writeSelectedDays(selectedDays, selectedDays.length));
    for (var selectday in selectedDays) {
      var events = _kEvents[selectday] ?? [];
      results.add(await writeEvents(selectday, events));
    }

    if (results.contains(false)) {
      return false;
    } else
      return true;
  }

  static Future<LinkedHashMap<DateTime, List<Event>>> readkEvents() async {
    final selectedDays = await readSelectedDays();
    final _kEvents = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    );

    for (var selectday in selectedDays) {
      final events = await readEvents(selectday);
      _kEvents.addAll({selectday: events});
    }

    return _kEvents;
  }

  static Future<void> loadkEvents() async {
    final _kEvents = await readkEvents();

    kEvents.addAll(_kEvents);
  }

  static Future<void> savekEvents() async {
    await writekEvents(kEvents);
  }
}
