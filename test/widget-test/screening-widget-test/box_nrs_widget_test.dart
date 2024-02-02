import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/screening-widget/box_nrs_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/slider_nrs.dart';

void main() {
  testWidgets('test BoxNrs widget', (WidgetTester tester) async {
    double? sliderValue;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BoxNrsWidget(
            onChanged: (value) {
              sliderValue = value;
            },
          ),
        ),
      ),
    );
    expect(find.text('ความรุนแรงของอาการ'), findsOneWidget);
    expect(
      find.text(
          'หลังจากทำท่าทางดังกล่าว หากวัดความปวดเป็นตัวเลข ท่านมีความปวด ระดับใด\n(0-10 ปวดน้อยไปปวดมาก)'),
      findsOneWidget,
    );
    expect(find.byType(SliderNrs), findsOneWidget);
    await tester.tap(find.byType(Slider));
    await tester.pump();
    expect(sliderValue, isNotNull);
  });
}
