import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/profile-widget/profile_dropdown.dart';

void main() {
  testWidgets('test ProfileDropdown widget', (WidgetTester tester) async {
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

    expect(find.text(dropdownName), findsOneWidget);
    expect(find.text(defaultValue), findsOneWidget);

//แตกอยู่
    // await tester.tap(find.byType(DropdownButtonFormField));
    // await tester.pump();

    // for (final option in listSelection) {
    //   expect(find.text(option), findsOneWidget);
    // }

    // await tester.tap(find.text('Option 3'));
    // await tester.pump();

    // expect(selectedValue, 'Option 3');
  });
}
