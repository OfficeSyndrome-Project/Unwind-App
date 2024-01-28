import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/button_withicon_widget.dart';

void main() {
  testWidgets('test ButtonWithiconWidget widget', (WidgetTester tester) async {
    bool onTapCalled = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ButtonWithiconWidget(
            onTap: () {
              onTapCalled = true;
            },
            mainAxisAlignment: MainAxisAlignment.center,
            text: 'Test Button',
            icon: Icons.add,
            iconcolor: Colors.blue,
            sizeIcon: 24.0,
            radius: 8.0,
            side: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
    expect(find.text('Test Button'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    // expect(find.byIcon(Icons.add).widget.color, equals(Colors.blue));
    await tester.tap(find.byType(ButtonWithiconWidget));
    await tester.pump();
    expect(onTapCalled, isTrue);
  });
}
