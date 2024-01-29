import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/ergonomic-widget/erg_boxquestion_widget.dart';
import 'package:unwind_app/Widgets/radio_widget.dart';

void main() {
  testWidgets('test QuestionEegonomic widget ', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuestionEegonomicWidget(
            question: 'Your Question',
            imagePath: 'lib/assets/images/blank_profile.png',
            //imagePath ใช้เพื่อทดสอบ
            onCurrentOptionsChanged: (value) {},
            currentOptions: {},
            index: 0,
          ),
        ),
      ),
    );

    expect(find.text('Your Question'), findsOneWidget);
    //NOTE: AnimatedCustomRadio ใช่/ไม่ใช่ มี 2 ตัว
    expect(find.byType(AnimatedCustomRadio), findsNWidgets(2));
    expect(
      find.text('ใช่'),
      findsOneWidget,
    );
    expect(
      find.text('ไม่ใช่'),
      findsOneWidget,
    );
    expect(
      tester
          .widget<Container>(
            find.byType(Container).first,
          )
          .decoration,
      ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
    );
  });
}
