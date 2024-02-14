import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/animate_sequence_widget.dart';

void main() {
  testWidgets('test AnimateSequence widget', (WidgetTester tester) async {
    List<String> testListPath = [
      'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-1.png',
      'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-2.png',
      'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-3.png',
      'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-4.png',
      'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-5.png',
      'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-6.png',
      'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-7.png',
      'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-8.png',
      'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-9.png',
    ];
    int testRepeat = 3;
    int testEachSetDuration = 10;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AnimateSequenceWidget(
            listPath: testListPath,
            repeat: testRepeat,
            eachSetDuration: testEachSetDuration,
          ),
        ),
      ),
    );

    expect(find.byType(AnimateSequenceWidget), findsOneWidget);
    final animateSequenceWidget = tester
        .widget<AnimateSequenceWidget>(find.byType(AnimateSequenceWidget));
    expect(animateSequenceWidget.listPath, testListPath);
    expect(animateSequenceWidget.repeat, testRepeat);
    expect(animateSequenceWidget.eachSetDuration, testEachSetDuration);
  });
}
