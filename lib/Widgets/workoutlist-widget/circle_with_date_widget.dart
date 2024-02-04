import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/date_circle_pick_widget.dart';
import 'package:unwind_app/data/workout-list-data/date_workout_mockup.dart';

Widget CircleWithDate(
    double percent, bool onSelect, bool isDone, void Function()? onTap) {
  List<DateWorkoutMockup> dateMockup = DateWorkoutMockup.getData();
  List<Widget> circleDate = [];

  for (var i = 0; i < dateMockup.length; i++) {
    circleDate.add(Row(
      children: [
        DateCirclePickWidget(
          date: DateFormat('E', 'th').format(dateMockup[i].dateTime),
          percent: percent,
          onSelect: onSelect,
          isDone: isDone,
          onTap: onTap,
        )
      ],
    ));
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: circleDate,
  );
}
