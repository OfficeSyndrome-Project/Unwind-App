import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/screening-widget/slider_nrs.dart';
// import 'package:unwind_app/Widgets/screening-widget/textwithemoticon_label_slider.dart';

void main() {
  testWidgets('test SliderNrs widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SliderNrs(onChanged: (double value) {}),
        ),
      ),
    );

    // expect(find.text(oncurrentNRS.toStringAsFixed(0)), findsOneWidget);
    expect(find.byType(Slider), findsOneWidget);
    await tester.tap(find.byType(Slider));
    await tester.pump();
    // expect(find.byType(TextWithEmoticonLabel), findsOneWidget);
    //   await tester.drag(find.byType(Slider), Offset(newValue, 0));
    // expect(oncurrentNRS, equals(newValue));
    expect(find.byType(Container), findsWidgets);
    expect(find.byType(Row), findsWidgets);
  });
}
