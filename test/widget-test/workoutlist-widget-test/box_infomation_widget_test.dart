import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/box_infomation_widget.dart';

void main() {
  testWidgets('test BoxInfomation widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BoxInfomationWidget(
            title: 'TestTitle',
            assetName:
                'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-1.png',
            infomation: 'TestInformation',
          ),
        ),
      ),
    );
    expect(find.text('TestTitle'), findsOneWidget);
    expect(find.byType(RatioImageoneToOne), findsOneWidget);
    expect(find.text('TestInformation'), findsOneWidget);
  });
}
