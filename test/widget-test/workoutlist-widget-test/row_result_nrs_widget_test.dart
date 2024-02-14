import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/row_result_nrs_widget.dart';

void main() {
  testWidgets('test RowResultNrs widget', (WidgetTester tester) async {
    const int testFirstNrs = 5;
    const int testLastestNrs = 8;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RowResultNrsWidget(
            firstNrs: testFirstNrs,
            lastestNrs: testLastestNrs,
          ),
        ),
      ),
    );
    expect(find.text('ค่า NRS ครั้งแรก'), findsOneWidget);
    expect(find.text('ค่า NRS ครั้งล่าสุด'), findsOneWidget);
    expect(find.text(testFirstNrs.toString()), findsOneWidget);
    expect(find.text(testLastestNrs.toString()), findsOneWidget);
  });
}
