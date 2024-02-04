import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/alarm-widget/alarm_btncircle_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

void main() {
  testWidgets('test btnCircle widget', (WidgetTester tester) async {
    late BuildContext testContext;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              testContext = context;
              return btnCircle(
                context,
                'Click Me',
                Colors.blue,
              );
            },
          ),
        ),
      ),
    );

    expect(find.text('Click Me'), findsOneWidget);
    expect(find.text('Do Not Click'), findsNothing);
    expect(
      tester
          .widget<SizedBox>(
            find.byType(SizedBox),
          )
          .width,
      ResponsiveCheckWidget.isSmallMobile(testContext) ? 88 : 98,
    );
    expect(
      tester
          .widget<SizedBox>(
            find.byType(SizedBox),
          )
          .height,
      ResponsiveCheckWidget.isSmallMobile(testContext) ? 88 : 98,
    );
    // NOTE: Container ตัวที่ 1 (.first)
    final ShapeDecoration testCircleDecoration = tester
        .widget<Container>(
          find.descendant(
            of: find.byType(Stack),
            matching: find.byType(Container).first,
          ),
        )
        .decoration as ShapeDecoration;
    expect(testCircleDecoration.color, Colors.blue);
    // NOTE: Container ตัวที่ 2 (.last)
    expect(
      tester.getSize(find.byType(Container).last).width,
      ResponsiveCheckWidget.isSmallMobile(testContext) ? 78.57 : 88.57,
    );
    expect(
      tester.getSize(find.byType(Container).last).height,
      ResponsiveCheckWidget.isSmallMobile(testContext) ? 78.57 : 88.57,
    );
    expect(
      tester
          .widget<Text>(
            find.byType(Text),
          )
          .style!
          .fontSize,
      ResponsiveCheckWidget.isSmallMobile(testContext) ? 16.0 : 18.0,
    );
  });
}
