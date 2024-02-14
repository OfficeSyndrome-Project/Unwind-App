import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/general_radio_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/question_box_nrs_widget.dart';

void main() {
  testWidgets('test QuestionBoxNrs widget', (WidgetTester tester) async {
    const String testQuestions =
        'จากระยะเวลาที่ผ่านมา 4 สัปดาห์\nคุณมีอาการดีขึ้นจากการทำชุดท่านี้';
    const int testQuestionPage = 1;
    const int testQuestionId = 1;
    const String testAssetName =
        'lib/assets/images/workout/result_nrs_four_week_1.png';
    // int? onChangedValue;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuestionBoxNrsWidget(
            questionPage: testQuestionPage,
            questionId: testQuestionId,
            questions: testQuestions,
            assetName: testAssetName,
            // onChanged: (value) {
            //   onChangedValue = value;
            // },
          ),
        ),
      ),
    );

    expect(find.byType(RatioImageoneToOne), findsOneWidget);
    expect(find.text(testQuestions), findsOneWidget);
    expect(find.byType(GeneralAnimatedCustomRadio<int>), findsNWidgets(2));
    await tester.tap(find.text('ใช่'));
    await tester.pump();
    await tester.tap(find.text('ไม่'));
    await tester.pump();
  });
}
