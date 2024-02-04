import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/textlabel_slider_widget.dart';

void main() {
  testWidgets('test getText widget', (WidgetTester tester) async {
    late BuildContext testContext;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(builder: (BuildContext context) {
            testContext = context;
            return getTextWidgets(context);
          }),
        ),
      ),
    );
    await tester.pump();
    expect(find.byType(Text), findsNWidgets(11));
    for (var i = 0; i < 11; i++) {
      expect(find.text(i.toString()), findsOneWidget);
    }
    for (var i = 0; i < 11; i++) {
      TextStyle expectedTextStyle = TextStyle(
        color: Color(0xFFC3C8D2),
        fontSize: ResponsiveCheckWidget.isSmallMobile(testContext) ? 12 : 14,
        fontFamily: 'Noto Sans Thai',
        fontWeight: FontWeight.w500,
      );
      expect(
        tester.widget<Text>(find.text(i.toString())).style,
        equals(expectedTextStyle),
      );
    }
    expect(
      tester.widget<Row>(find.byType(Row)).mainAxisAlignment,
      equals(MainAxisAlignment.spaceEvenly),
    );
  });
}
