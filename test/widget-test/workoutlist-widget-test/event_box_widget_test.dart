import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/event_box_widget.dart';

void main() {
  testWidgets('test EventBox widget', (WidgetTester tester) async {
    String testEventName = 'Test Event';
    DateTime testTime = DateTime.now();
    // bool onTapCalled = false;
    // bool onTapCalled = true;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EventBoxWidget(
            eventName: testEventName,
            time: testTime,
            onTap: () {
              // onTapCalled = true;
            },
          ),
        ),
      ),
    );

    expect(find.byType(EventBoxWidget), findsOneWidget);
    expect(find.text(testEventName), findsOneWidget);
    expect(
        find.text(testTime.hour.toString().padLeft(2, '0') +
            ':' +
            testTime.minute.toString().padLeft(2, '0')),
        findsOneWidget);
    // await tester.tap(find.byType(EventBoxWidget));
    // await tester.pump();
    // expect(onTapCalled, true);
  });
}
