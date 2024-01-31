import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/alarm-widget/alarm_wheeltile_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

void main() {
  testWidgets('test WheelTile widget', (WidgetTester tester) async {
    late BuildContext testContext;
    // final TextStyle testColor = TextStyle(color: Color(0xFF6285D7));
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              testContext = context;
              return WheelTile('10');
            },
          ),
        ),
      ),
    );

    expect(find.text('10 นาที'), findsOneWidget);
    expect(find.text('10'), findsNothing);
    expect(find.text('25 วินาที'), findsNothing);
    expect(
      tester
          .widget<Text>(
            find.byType(Text),
          )
          .style
          ?.fontSize,
      ResponsiveCheckWidget.isSmallMobile(testContext) ? 14 : 16,
    );
    expect(
      tester
          .widget<Text>(
            find.byType(Text),
          )
          .style
          ?.fontWeight,
      FontWeight.w600,
    );
    expect(
      tester
          .widget<Text>(
            find.byType(Text),
          )
          .style
          ?.color,
      // testColor,
      Color(0xFF6285D7),
    );
  });
}
