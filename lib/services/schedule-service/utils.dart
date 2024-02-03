class Event {
  final String title;
  final DateTime times;

  const Event(this.title, this.times);

  @override
  String toString() => title;
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

int getDaySinceEpoch(DateTime times) =>
    (((times.millisecondsSinceEpoch ~/ 1000) ~/ 60) ~/ 60) ~/ 24;

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

DateTime getDateTimeToday() {
  final DateTime now = DateTime.now();
  final DateTime currentDate = DateTime(now.year, now.month, now.day);

  return currentDate;
}
