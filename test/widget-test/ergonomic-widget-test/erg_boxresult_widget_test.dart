import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/ergonomic-widget/erg_boxresult_widget.dart'; // ปรับตาม path ที่เหมาะสม
import 'package:unwind_app/data/ergonomic-data/ergonomic_model.dart';

void main() {
  testWidgets('test ErgBoxresult widget', (WidgetTester tester) async {
    final ErgonomicModel testQuestion = ErgonomicModel(
        idCategory: 1,
        questionOrder: 1,
        category: "ท่าทาง",
        solution: 'Solution 1',
        question: 'Question 1',
        prevent: 'Prevent 1',
        imagepath: 'Path 1');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ErgBoxresultWidget(question: testQuestion),
        ),
      ),
    );

    expect(find.byType(Column).first, findsOneWidget);
    expect(find.byType(Column).last, findsOneWidget);
    expect(find.text('1.Question 1'), findsOneWidget);
    expect(find.text('คำแนะนำ'), findsOneWidget);
    expect(find.text('\u2022'), findsNWidgets(2));
    expect(find.text('Solution 1'), findsOneWidget);
    expect(find.text('ป้องกัน'), findsOneWidget);
    expect(find.text('Prevent 1'), findsOneWidget);
  });
}
