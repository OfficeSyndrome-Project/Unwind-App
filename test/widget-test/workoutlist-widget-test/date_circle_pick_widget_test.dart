import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/date_circle_pick_widget.dart';

void main() {
  testWidgets('test DateCirclePick widget', (WidgetTester tester) async {
    final String testDate = 'Mon';
    final double testPercent = 0.5;
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DateCirclePickWidget(
            date: testDate,
            percent: testPercent,
            onSelect: false,
            isDone: false,
            onTap: () {
              tapped = true;
            },
          ),
        ),
      ),
    );
    expect(find.text(testDate), findsOneWidget);
    expect(find.byType(CircularPercentIndicator), findsOneWidget);
    await tester.tap(find.byType(DateCirclePickWidget));
    await tester.pump();
    expect(tapped, true);
  });
}
