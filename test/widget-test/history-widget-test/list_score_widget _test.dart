import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/history-widget/list_score_widget.dart';

void main() {
  testWidgets('test ListScore widget', (WidgetTester tester) async {
    const firstNrs = 5;
    const lastNrs = 3;
    const differenceNrs = firstNrs - lastNrs;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListScoreWidget(
            firstNrs: firstNrs,
            lastNrs: lastNrs,
            differenceNrs: differenceNrs,
          ),
        ),
      ),
    );

    expect(find.text('ความเจ็บปวดครั้งแรก : $firstNrs'), findsOneWidget);
    expect(find.text('ความเจ็บปวดครั้งแรก : 5'), findsOneWidget);
    expect(find.text('ความเจ็บปวดครั้งล่าสุด : $lastNrs'), findsOneWidget);
    expect(find.text('ความเจ็บปวดครั้งล่าสุด : 3'), findsOneWidget);
    expect(find.text('ความเจ็บปวดลดลง $differenceNrs ระดับ'), findsOneWidget);
    expect(find.text('ความเจ็บปวดลดลง 2 ระดับ'), findsOneWidget);
  });
}
