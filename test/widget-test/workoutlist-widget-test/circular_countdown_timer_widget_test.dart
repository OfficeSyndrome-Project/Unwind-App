import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/circular_countdown_timer_widget.dart';

void main() {
  testWidgets('test CircularCountdownTimer widget',
      (WidgetTester tester) async {
    int testDuration = 1;
    CountDownController testController = CountDownController();
    bool onCompleteCalled = false;
    bool onStartCalled = false;
    String? onChangeValue;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CircularCountdownTimerWidget(
            duration: testDuration,
            controller: testController,
            onComplete: () {
              onCompleteCalled = true;
            },
            onStart: () {
              onStartCalled = true;
            },
            onChange: (value) {
              onChangeValue = value;
            },
          ),
        ),
      ),
    );

    expect(find.byType(CircularCountDownTimer), findsOneWidget);
    int widgetDuration = (tester.widget<CircularCountdownTimerWidget>(
      find.byType(CircularCountdownTimerWidget),
    )).duration;
    expect(widgetDuration, testDuration);
    await tester.pumpAndSettle();
    expect(onCompleteCalled, true);
    expect(onStartCalled, true);
    expect(onCompleteCalled, isNotNull);
    expect(onStartCalled, isNotNull);
    await tester.pump();
    expect(onChangeValue, (testDuration - 1).toString());
  });
}
