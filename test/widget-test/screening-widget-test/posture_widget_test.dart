import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/general_radio_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';

import 'package:unwind_app/Widgets/screening-widget/posture_widget.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';

void main() {
  group('Posture widget', () {
    testWidgets('test PostuerWidget widget', (WidgetTester tester) async {
      List<ScreeningPartTwoPostureModel> mockQuestions = [
        ScreeningPartTwoPostureModel(
            title: "คอ",
            postureName: "ท่าเส้นประสาทคอที่ 1 ULNT 1",
            assetPath: "lib/assets/images/screeningPart/ulnt1.png",
            question:
                "เมื่อท่านทำท่าทางดังกล่าว\nท่านมีอาการปวดเพิ่มขึ้น หรือปวดแสบร้อน หรือไม่ ?",
            questionPage: 0,
            questionType: "a",
            questionPart: 2,
            questionId: 3),
      ];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostuerWidget(
              questions: mockQuestions,
              currentPage: 1,
              pageRoutes: PageRoutes(),
              controller: PageController(),
              onChanged: (answer) {},
              onCompleted: (isCompleted) {},
            ),
          ),
        ),
      );
      expect(find.byType(QuestionAndRadioButton), findsWidgets);
      expect(find.text('ท่าเส้นประสาทคอที่ 1 ULNT 1'), findsOneWidget);
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
              assetName: "lib/assets/images/screeningPart/ulnt1.png",
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

      expect(find.byType(GeneralAnimatedCustomRadio<int>), findsNWidgets(2));
      // expect(find.byType(GeneralAnimatedCustomRadio<int>), findsOneWidget);
      expect(find.text('ใช่'), findsOneWidget);
      expect(find.text('ไม่'), findsOneWidget);
    });
  });
}
