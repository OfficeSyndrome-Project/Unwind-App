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
  });
}
