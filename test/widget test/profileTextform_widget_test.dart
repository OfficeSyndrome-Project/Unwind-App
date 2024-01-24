import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/profile-widget/profile_textform_widget.dart';

void main() {
  testWidgets('ProfileTextForm work correctly', (WidgetTester tester) async {
    final TextEditingController controller = TextEditingController();
    String? onChangedValue;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProfileTextForm(
            formName: 'TestForm',
            inputType: TextInputType.text,
            formUnit: 'TestUnit',
            controller: controller,
            onChange: (value) {
              onChangedValue = value;
            },
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'Kridsaya');
    // Test ป้อนข้อมูล
    expect(controller.text, 'Kridsaya');
    // Test ค่า onChanged
    expect(onChangedValue, 'Kridsaya');
    // Assert
    expect(find.text('TestForm'), findsOneWidget);
    print(tester.widget<Text>(find.text('TestForm')).style?.color);

    // ตรวจสอบสีของ Text เมื่อไม่มีการ Focus
    // expect(tester.widget<Text>(find.text('TestForm')).style?.color,
    //     Color(0xFF9BA4B5));

    // แตะที่ TextFormField เพื่อให้เกิดการ Focus
    await tester.tap(find.byType(TextFormField));
    await tester.pump();
    print(tester.widget<Text>(find.text('TestForm')).style?.color);

    // ตรวจสอบสีของ Text เมื่อมีการ Focus
    // expect(tester.widget<Text>(find.text('TestForm')).style?.color,
    //     Color(0xFF484D56));
  });
}
