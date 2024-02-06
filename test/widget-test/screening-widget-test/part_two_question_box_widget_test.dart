import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/general_radio_widget.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';
import 'package:unwind_app/widgets/screening-widget/part_two_question_box_widget.dart';

void main() {
  group('Part Two Question Box', () {
    testWidgets('test PartTwoQuestionBoxWidget widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PartTwoQuestionBoxWidget(
              assetPath: 'lib/assets/images/screeningPart/scr_part_two_1.png',
              questions: [
                ScreeningPartTwoQuestionModel(
                    topic: "ความบ่อย",
                    question:
                        "1. ท่านมีอาการปวดบริเวณดังกล่าวมากกว่า 1 ครั้งใน 1 วัน ?",
                    questionPage: 0,
                    questionType: "a",
                    questionPart: 2,
                    questionId: 1),
                // ScreeningPartTwoQuestionModel(
                //     topic: null,
                //     question:
                //         "2. อาการปวดของท่านเปลี่ยนแปลงระดับความรุนแรงตามช่วงเวลาของวันหรือท่าทางการเคลื่อนไหว ใช่หรือไม่ ?",
                //     questionPage: 0,
                //     questionType: "a",
                //     questionPart: 2,
                //     questionId: 2),
              ],
              currentPage: 1,
              pageRoutes: PageRoutes(),
              controller: PageController(),
              title: 'TestTitle',
              questionID: [1],
              onChanged: (Answer answer) {},
            ),
          ),
        ),
      );
      expect(find.text('TestTitle'), findsOneWidget);
      expect(find.text('ความบ่อย'), findsOneWidget);
      expect(
          find.text('1. ท่านมีอาการปวดบริเวณดังกล่าวมากกว่า 1 ครั้งใน 1 วัน ?'),
          findsOneWidget);
      expect(find.byType(QuestionAndRadioButton), findsWidgets);
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
              topic: 'TestTopic',
              onChanged: (value) {},
              is_four_choices: true,
            ),
          ),
        ),
      );

      expect(find.text('TestQuestion'), findsOneWidget);
      expect(find.text('TestTopic'), findsOneWidget);
      expect(find.byType(GeneralAnimatedCustomRadio<int>), findsNWidgets(4));
      await tester.tap(find.byType(GeneralAnimatedCustomRadio<int>).first);
      await tester.pump();
    });
  });
}
