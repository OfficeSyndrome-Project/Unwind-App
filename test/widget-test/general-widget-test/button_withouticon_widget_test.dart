import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';

void main() {
  testWidgets('test ButtonWithoutIconWidget widget',
      (WidgetTester tester) async {
    bool onTapCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ButtonWithoutIconWidget(
            onTap: () {
              onTapCalled = true;
            },
            text: 'Click Me',
            radius: 4,
            width: double.infinity,
            height: 10,
            color: Colors.blue,
            borderSide: BorderSide(color: Colors.black),
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

    expect(find.text('Click Me'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsNothing);
    await tester.tap(find.byType(ButtonWithoutIconWidget));
    await tester.pump();
    expect(onTapCalled, isTrue);
  });
}
