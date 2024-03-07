import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/ergonomic-widget/erg_boxcategory_widget.dart';
// import 'package:unwind_app/Widgets/ergonomic-widget/erg_boxresult_widget.dart';
import 'package:unwind_app/data/ergonomic-data/ergonomic_model.dart';
// import 'package:unwind_app/Widgets/responsive_check_widget.dart';

void main() {
  testWidgets('test CategoryErgBox widget', (WidgetTester tester) async {
    // Create a list of ErgonomicModel for testing
    List<ErgonomicModel> questions = [
      ErgonomicModel(
          idCategory: 1,
          questionOrder: 1,
          category: "ท่าทาง",
          solution: 'Solution 1',
          question: 'Question 1',
          prevent: 'Prevent 1',
          imagepath: 'Path 1'),
      ErgonomicModel(
          idCategory: 2,
          questionOrder: 2,
          category: "ท่าทาง",
          solution: 'Solution 2',
          question: 'Question 2',
          prevent: 'Prevent 2',
          imagepath: 'Path 2'),
      ErgonomicModel(
          idCategory: 3,
          questionOrder: 3,
          category: "ท่าทาง",
          solution: 'Solution 3',
          question: 'Question 3',
          prevent: 'Prevent 3',
          imagepath: 'Path 3'),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CategoryErgBoxWidget(
            idCategory: 1,
            type: 'Type',
            questions: questions,
          ),
        ),
      ),
    );

    expect(find.text('ส่วนที่ 1 Type'), findsOneWidget);
    expect(find.text('1'), findsNothing);
    expect(find.text('ส่วนที่ 2'), findsNothing);
  });
}
