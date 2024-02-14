import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/time_wheeltile_widget.dart';

void main() {
  testWidgets('test TimeWheeltile widget', (WidgetTester tester) async {
    int initHour = 5;
    int initMinute = 30;
    int selectedHour = 0;
    int selectedMinute = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TimeWheeltileWidget(
            initHour: initHour,
            initMinute: initMinute,
            onSelectedItemChangedHour: (hour) {
              selectedHour = hour;
            },
            onSelectedItemChangedMinute: (minute) {
              selectedMinute = minute;
            },
          ),
        ),
      ),
    );

    expect(find.text('05'), findsOneWidget);
    expect(find.text('30'), findsOneWidget);
    expect(initHour, 5);
    expect(initMinute, 30);
    expect(selectedHour, 0);
    await tester.fling(
        find.byType(ListWheelScrollView).first, const Offset(0, -100), 1000);
    await tester.pumpAndSettle();
    expect(selectedHour, 11);
    expect(selectedMinute, 0);
    await tester.fling(
        find.byType(ListWheelScrollView).last, const Offset(0, -100), 1000);
    await tester.pumpAndSettle();
    expect(selectedMinute, 36);
  });
}
