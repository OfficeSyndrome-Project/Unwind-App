import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/list_dropdown_widget.dart'; // ต้องแก้ตามที่เห็นสมควร

void main() {
  testWidgets('test ListDropdown widget', (WidgetTester tester) async {
    const List<String> testNameList = [
      'ชุดท่าบริหารคอ',
      'ชุดท่าบริหารไหล่',
      'ชุดท่าบริหารหลังส่วนบน'
    ];
    String? selectedValue;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListDropdownWidget(
            onChanged: (value) {
              selectedValue = value;
            },
            nameList: testNameList,
            value: selectedValue,
          ),
        ),
      ),
    );

    expect(find.text('กรุณาเลือกชุดท่าบริหาร'), findsOneWidget);
    await tester.tap(find.byWidgetPredicate(
        (widget) => widget is DropdownButtonFormField<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('ชุดท่าบริหารคอ'));
    await tester.pumpAndSettle();
    expect(selectedValue, 'ชุดท่าบริหารคอ');
  });
}
