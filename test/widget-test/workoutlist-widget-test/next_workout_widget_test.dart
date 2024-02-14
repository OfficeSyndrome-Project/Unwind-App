import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/next_workout_widget.dart';

void main() {
  testWidgets('test NextWorkout widget', (WidgetTester tester) async {
    const String testName = 'ท่าดันต้าน';
    const int testTime = 20;
    const String testDescrip = 'เพิ่มความแข็งแรงบริเวณคอ';
    const String testAssetName =
        'lib/assets/images/workout/prepare/prepare.png';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NextWorkoutWidget(
            name: testName,
            time: testTime,
            descrip: testDescrip,
            assetName: testAssetName,
          ),
        ),
      ),
    );

    expect(find.text('ท่าต่อไป'), findsOneWidget);
    expect(find.byType(RatioImageoneToOne), findsOneWidget);
    expect(find.text('$testName\n${testTime} วินาที'), findsOneWidget);
    expect(find.text(testDescrip), findsOneWidget);
    expect(find.text('* หากท่านมีอาการปวดขณะบริหาร ให้หยุดและพักทันที'),
        findsOneWidget);
  });
}
