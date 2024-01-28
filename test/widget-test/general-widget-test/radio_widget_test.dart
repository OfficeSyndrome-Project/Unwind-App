import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/radio_widget.dart';

void main() {
  testWidgets('test AnimatedCustomRadio widget', (WidgetTester tester) async {
    bool onChangedCalled = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AnimatedCustomRadio(
            value: true,
            groupValue: true,
            onChanged: (value) {
              onChangedCalled = true;
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
          ),
        ),
      ),
    );

    expect(find.byType(InkWell), findsOneWidget);
    expect(find.byType(Container).first, findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(InkWell),
        matching: find.byType(Container).first,
      ),
      findsOneWidget,
    );
    // final BoxDecoration decoration = tester
    //     .widget<Container>(
    //       find.descendant(
    //         of: find.byType(InkWell),
    //         matching: find.byType(Container).first,
    //       ),
    //     )
    //     .decoration as BoxDecoration;
    // expect(decoration.border!.top.color, equals(Colors.blue));
    await tester.tap(find.byType(InkWell));
    await tester.pump();
    expect(onChangedCalled, true);
  });
}
