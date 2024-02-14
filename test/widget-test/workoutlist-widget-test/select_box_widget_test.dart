import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/select_box_widget.dart';

void main() {
  testWidgets('test SelectBox widget', (WidgetTester tester) async {
    bool onTapCalled = false;
    const String testName = 'Test Name';
    const double testWidth = double.infinity;
    const bool testIsTap = true;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SelectBoxWidget(
            onTap: () {
              onTapCalled = true;
            },
            name: testName,
            width: testWidth,
            isTap: testIsTap,
          ),
        ),
      ),
    );

    expect(find.text(testName), findsOneWidget);
    expect(find.byIcon(Icons.unfold_more_rounded), findsOneWidget);
    await tester.tap(find.byType(SelectBoxWidget));
    await tester.pump();
    expect(onTapCalled, true);

    final nameTextWidget = find.text(testName).evaluate().first.widget as Text;
    expect(nameTextWidget.style!.fontWeight, FontWeight.w500);
  });
}
