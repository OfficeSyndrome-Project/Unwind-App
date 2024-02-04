import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/history-widget/score_average_widget.dart';

void main() {
  testWidgets('test ScoreAverage widget', (WidgetTester tester) async {
    const nrsScoreAverage = 3;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScoreAverageWidget(nrsScoreAverage: nrsScoreAverage),
        ),
      ),
    );
    expect(find.text('ความเจ็บปวดลดลง $nrsScoreAverage ระดับ'), findsOneWidget);
  });
}
