import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/profile-widget/show_infomation.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

void main() {
  testWidgets('test ShowInfomation widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ShowInfomation(
            headDetails: 'หัวข้อโปรไฟล์',
            detail: 'เนื้อหาโปรไฟล์',
          ),
        ),
      ),
    );

    expect(find.text('หัวข้อโปรไฟล์'), findsOneWidget);
    expect(find.text('headDetails'), findsNothing);
    expect(find.text('เนื้อหาโปรไฟล์'), findsOneWidget);
    expect(find.text('detail'), findsNothing);

    if (ResponsiveCheckWidget.isSmallMobile(
        tester.element(find.byType(ShowInfomation)))) {
      expect(
        tester.widget<Text>(find.byType(Text).at(0)).style?.fontSize,
        14,
      );
      expect(
        tester.widget<Text>(find.byType(Text).at(1)).style?.fontSize,
        14,
      );
    }
  });
}
