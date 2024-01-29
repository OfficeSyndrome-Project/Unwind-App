import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/ergonomic-widget/erg_boxquestion_widget.dart';
import 'package:unwind_app/Widgets/ergonomic-widget/erg_btn_widget.dart';
import 'package:unwind_app/Widgets/ergonomic-widget/erg_rowsquestion_widget.dart';
import 'package:unwind_app/data/ergonomic-data/ergonomic_model.dart';

void main() {
  testWidgets('test PageQuestion widget', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PageQuestionWidget(
            idCategory: 1,
            currentPage: 1,
            pageRoutes: PageRoutes(),
            controller: PageController(),
            questions: [
              ErgonomicModel(
                  idCategory: 1,
                  questionOrder: 1,
                  category: "ท่าทาง",
                  question: "หลังของคุณตรงเมื่อนั่งหรือไม่ ?",
                  solution:
                      "คุณควรนั่งตัวตรง ไม่แอ่นหรือค่อมมากจนเกินไป ให้แผ่นหลังแนบชิดกับพนักพิง เพื่อให้น้ำหนักกระจายอย่างเหมาะสม ",
                  prevent: "อาการปวดหลังส่วนล่าง",
                  imagepath: "lib/assets/images/ergonomic-img/w-1.png"),
              ErgonomicModel(
                  idCategory: 1,
                  questionOrder: 2,
                  category: "ท่าทาง",
                  question:
                      "ต้นขาของคุณขนานกับพื้น (ทำมุม 90-110° ที่สะโพก) เมื่อนั่งหรือไม่ ?",
                  solution:
                      "คุณควรนั่งให้ต้นขาของคุณขนานกับพื้น เพื่อให้น้ำหนักกระจายอย่างเหมาะสม",
                  prevent: "อาการปวดบริเวณเชิงกราน",
                  imagepath: "lib/assets/images/ergonomic-img/w-2.png"),
            ],
          ),
        ),
      ),
    );

    expect(find.text('ส่วนที่ 1 ท่าทาง'), findsOneWidget);
    expect(find.byType(QuestionEegonomicWidget), findsWidgets);
    expect(find.byType(DetectorButton), findsOneWidget);
    await tester.tap(find.byType(DetectorButton));
    await tester.pumpAndSettle();
  });
}
