import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/profile-widget/profile_dropdown.dart';

void main() {
  testWidgets('ProfileDropdown should work correctly',
      (WidgetTester tester) async {
    // Arrange
    const List<String> listSelection = ['Option 1', 'Option 2', 'Option 3'];
    const String dropdownName = 'Select Option';
    const String defaultValue = 'Option 2';
    // String? selectedValue;

/////////////////////////////////////////////////////////
/////////////////not finish/////////////////////////////
///////////////////////////////////////////////////////
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProfileDropdown(
            listSelection: listSelection,
            dropdownName: dropdownName,
            defaultValue: defaultValue,
            // onSelect: (value) {
            //   selectedValue = value;
            // },
          ),
        ),
      ),
    );

    // Assert
    expect(find.text(dropdownName), findsOneWidget);

    // ตรวจสอบว่า DropdownButtonFormField มี default value ที่ถูกต้อง
    expect(find.text(defaultValue), findsOneWidget);

    // เปิด DropdownButtonFormField
    await tester.tap(find.byType(DropdownButtonFormField));
    await tester.pump();

    // for (final option in listSelection) {
    //   expect(find.text(option), findsOneWidget);
    // }

    // await tester.tap(find.text('Option 3'));
    // await tester.pump();

    // expect(selectedValue, 'Option 3');
  });
}
