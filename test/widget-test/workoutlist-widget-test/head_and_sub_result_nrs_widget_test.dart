import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/head_and_sub_result_nrs_widget.dart'; // ต้องแก้ตามที่เห็นสมควร

void main() {
  testWidgets('test HeadAndSubResultNrs widget', (WidgetTester tester) async {
    const String testTitle = 'ทางเราต้องขออภัย';
    const String testSubtitle =
        'หากท่านอาการไม่ดีขึ้นภายในระยะเวลา 4 สัปดาห์\nควรพบแพทย์เพื่อตรวจสอบสาเหตุของอาการ';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HeadAndSubResultNrsWidget(
            title: testTitle,
            subtitle: testSubtitle,
          ),
        ),
      ),
    );
    expect(find.text('ทางเราต้องขออภัย'), findsOneWidget);
    expect(
        find.text(
            'หากท่านอาการไม่ดีขึ้นภายในระยะเวลา 4 สัปดาห์\nควรพบแพทย์เพื่อตรวจสอบสาเหตุของอาการ'),
        findsOneWidget);
  });
}
