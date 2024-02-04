import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/screening-widget/box_result_syndrom_widget.dart';

void main() {
  testWidgets('Test BoxResultSyndromWidget Widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BoxResultSyndromWidget(
            result: 'Your result here',
          ),
        ),
      ),
    );

    expect(find.text('อาการ : Your result here').first, findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    // expect(
    //     find.widgetWithText(Text, 'อาการ : Your result here'), findsOneWidget);
  });
}
