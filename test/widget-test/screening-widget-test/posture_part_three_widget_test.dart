import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/screening-widget/posture_part_three_widget.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_three_model.dart';

void main() {
  group('Posture Part Three', () {
    testWidgets('test PosturePartThree widget', (WidgetTester tester) async {
      final List<ScreeningPartThreePostureModel> TestQuestions = [
        ScreeningPartThreePostureModel(
            title: "คอ",
            postureName: "ท่าก้ม-เงยคอ",
            assetPath: "lib/assets/images/screeningPart/neck_bend_tilt.png",
            question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
            questionId: 7,
            questionPage: 0,
            questionPart: 3,
            questionType: "a"),
      ];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PosturePartThreeWidget(
              questions: TestQuestions,
              currentPage: 0,
              pageRoutes: PageRoutes(),
              controller: PageController(),
            ),
          ),
        ),
      );
      expect(find.text('ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?'),
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
              posture: 'TestPosture',
              assetName: 'lib/assets/images/screeningPart/neck_bend_tilt.png',
              onChanged: (value) {},
            ),
          ),
        ),
      );

      expect(find.text('TestPosture'), findsOneWidget);
      expect(find.byType(RatioImageoneToOne), findsOneWidget);
      expect(find.text('TestQuestion'), findsOneWidget);
      await tester.tap(find.text('ใช่'));
      await tester.pump();
      await tester.tap(find.text('ไม่'));
      await tester.pump();
    });
  });
}
