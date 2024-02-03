import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/screening-widget/part_three_question_box_widget.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_three_model.dart';

void main() {
  testWidgets('test PartThreeQuestionBox widget', (WidgetTester tester) async {
    List<ScreeningPartThreeQuestionModel> questions = [
      ScreeningPartThreeQuestionModel(
          title: ["คอ", "บ่า", "หลังส่วนล่าง"],
          question: "คุณมีอาการปวดบริเวณนี้มาก่อนหรือไม่ ?",
          questionId: 1,
          questionPage: 1,
          questionPart: 3,
          questionType: "a"),
      ScreeningPartThreeQuestionModel(
          title: ["คอ", "บ่า", "หลังส่วนล่าง"],
          question:
              "หลังจากทำท่าทางดังกล่าว ท่านมีอาการเจ็บปวดคงอยู่จนถึงตอนนี้หรือไม่ ?",
          questionId: 2,
          questionPage: 1,
          questionPart: 3,
          questionType: "a"),
    ];
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PartThreeQuestionBoxWidget(
            questions: questions,
            currentPage: 1,
            pageRoutes: PageRoutes(),
            controller: PageController(),
            title: 'Test Title',
          ),
        ),
      ),
    );
    expect(find.byType(QuestionAndRadioButton), findsNWidgets(2));
    expect(
        find.text('1. คุณมีอาการปวดบริเวณนี้มาก่อนหรือไม่ ?'), findsOneWidget);
    expect(
        find.text(
            '1. หลังจากทำท่าทางดังกล่าว ท่านมีอาการเจ็บปวดคงอยู่จนถึงตอนนี้หรือไม่ ?'),
        findsNothing);
    await tester.tap(find.text('ใช่').first);
    await tester.pump();

    await tester.tap(find.text('ไม่ใช่').first);
    await tester.pump();

    //NOTE: Answer ทดสอบผ่าน screening diagnose service
  });
}
