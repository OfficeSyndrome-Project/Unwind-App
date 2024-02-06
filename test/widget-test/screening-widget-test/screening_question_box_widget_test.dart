import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/general_radio_widget.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_one_model.dart';
import 'package:unwind_app/Widgets/screening-widget/screening_question_box_widget.dart';
import 'package:unwind_app/Routes/routes_config.dart';

void main() {
  group('Screening Question Box', () {
    testWidgets('test ScreeningQuestionBox widget',
        (WidgetTester tester) async {
      PageController controller = PageController();
      List<ScreeningPartOneModel> questions = [
        ScreeningPartOneModel(
            questionId: 7,
            questionPage: 3,
            question: "7. ท่านมีความเครียดระหว่างการทำงานหรือไม่ ?",
            questionPart: 1),
        ScreeningPartOneModel(
            questionId: 8,
            questionPage: 3,
            question: "8. ท่านรู้สึกกล้ามเนื้อตึงในขณะทำงานหรือไม่ ?",
            questionPart: 1),
      ];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ScreeningQuestionBoxWidget(
              assetPath: 'lib/assets/images/successful_icon.png',
              questions: questions,
              currentPage: 0,
              pageRoutes: PageRoutes(),
              controller: controller,
              onChanged: (int questionId, int value) {
                expect(questionId, equals(8));
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('7. ท่านมีความเครียดระหว่างการทำงานหรือไม่ ?'),
          findsOneWidget);
      expect(find.text('8. ท่านรู้สึกกล้ามเนื้อตึงในขณะทำงานหรือไม่ ?'),
          findsOneWidget);
      expect(
          find.byType(QuestionAndRadioButton), findsNWidgets(questions.length));
    });

    testWidgets('test QuestionAndRadioButton widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QuestionAndRadioButton(
              questionPage: 1,
              questionId: 1,
              questions: 'TestQuestion',
              onChanged: (value) {
                print('Selected option: $value');
              },
            ),
          ),
        ),
      );

      expect(find.text('TestQuestion'), findsOneWidget);
      expect(find.byType(GeneralAnimatedCustomRadio<int>), findsNWidgets(2));
      expect(find.text('ใช่'), findsOneWidget);
      expect(find.text('ไม่ใช่'), findsOneWidget);
      await tester.tap(find.text('ใช่'));
      await tester.pump();
    });
  });
}
