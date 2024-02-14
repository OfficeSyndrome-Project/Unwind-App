import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/prepare_workout_widget.dart';

void main() {
  testWidgets('test PrepareWorkout widget', (WidgetTester tester) async {
    const String testAssetName =
        'lib/assets/images/workout/prepare/prepare.png';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PrepareWorkoutWidget(
            assetName: testAssetName,
          ),
        ),
      ),
    );
    expect(find.text('เตรียมพร้อมสำหรับการบริหาร !'), findsOneWidget);
    expect(find.byType(RatioImageoneToOne), findsOneWidget);
  });
}
