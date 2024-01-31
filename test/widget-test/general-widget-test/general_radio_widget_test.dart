import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/general_radio_widget.dart';

void main() {
  testWidgets('test GeneralAnimatedCustomRadio widget',
      (WidgetTester tester) async {
    bool onChangedCalled = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GeneralAnimatedCustomRadio<String>(
            value: 'A',
            groupValue: 'B',
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
    expect(find.byType(Container), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(InkWell),
        matching: find.byType(Container),
      ),
      findsOneWidget,
    );
    expect(
      tester
          .widget<Container>(
            find.descendant(
              of: find.byType(InkWell),
              matching: find.byType(Container),
            ),
          )
          .margin,
      EdgeInsets.only(right: 4),
    );
    // final BoxDecoration decoration = tester
    //     .widget<Container>(
    //       find.descendant(
    //         of: find.byType(InkWell),
    //         matching: find.byType(Container),
    //       ),
    //     )
    //     .decoration as BoxDecoration;
    // expect(decoration.border!.top.color, equals(Colors.grey));
    await tester.tap(find.byType(InkWell));
    await tester.pump();
    expect(onChangedCalled, true);
  });
}
