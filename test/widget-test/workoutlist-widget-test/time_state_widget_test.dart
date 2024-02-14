import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/time_state_widget.dart';

void main() {
  testWidgets('test TimeState widget', (WidgetTester tester) async {
    int testTextState = 5;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TimeStateWidget(
            textState: testTextState,
          ),
        ),
      ),
    );

    expect(find.text('05'), findsOneWidget);
    final textWidget = find.byType(Text).evaluate().first.widget as Text;
    expect(textWidget.style!.fontWeight, FontWeight.w600);
    expect(textWidget.style!.color, Color(0xFF6285D7));
  });
}
