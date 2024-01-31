import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:core';
import 'package:unwind_app/Widgets/profile-widget/profile_textform_widget.dart';

void main() {
  testWidgets('test ProfileTextForm widget', (WidgetTester tester) async {
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
    await tester.pump();

    expect(controller.text, 'Kridsaya');
    expect(onChangedValue, 'Kridsaya');
    expect(find.text('TestForm'), findsOneWidget);
    expect(find.text('TestUnit'), findsOneWidget);

    /////////////////NOTE//////////////////
    /////////////Text Style has error///////////////

    // final TextStyle unfocusedTextStyle = TextStyle(
    //   color: Color(0xFF9BA4B5),
    //   fontSize: 16,
    //   fontWeight: FontWeight.w500,
    // );

    // expect(
    //   (tester.widget(find.byType(TextFormField)) as TextFormField)
    //       .decoration
    //       ?.labelStyle,
    //   equals(unfocusedTextStyle),
    // );

    // สี Text เมื่อไม่ Focus
    // expect(tester.widget<Text>(find.text('TestForm')).style?.color,
    //     Color(0xFF9BA4B5));

    // await tester.tap(find.byType(TextFormField));
    // await tester.pump();
    // print(tester.widget<Text>(find.text('TestForm')).style?.color);

    // สี Text เมื่อมีการ Focus
    // expect(tester.widget<Text>(find.text('TestForm')).style?.color,
    //     Color(0xFF484D56));
  });
}
