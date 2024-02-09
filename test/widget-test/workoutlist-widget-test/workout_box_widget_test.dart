import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/workout_box_widget.dart';

void main() {
  testWidgets('test WorkoutBox widget', (WidgetTester tester) async {
    String testWorkoutName = 'Test Workout';
    String testNumberWorkout = '5';
    String testTime = '30 mins';
    String testAssetName =
        'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-1.png';
    // bool onTapCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WorkoutBoxWidget(
            workoutName: testWorkoutName,
            numberWorkout: testNumberWorkout,
            time: testTime,
            assetName: testAssetName,
            onTap: () {
              // onTapCalled = true;
            },
          ),
        ),
      ),
    );

    expect(find.byType(WorkoutBoxWidget), findsOneWidget);
    expect(find.text(testWorkoutName), findsOneWidget);
    expect(find.text(testNumberWorkout + " ชุดท่า"), findsOneWidget);
    expect(find.text(testTime), findsOneWidget);
    // await tester.tap(find.byType(WorkoutBoxWidget));
    // await tester.pump();
    // expect(onTapCalled, true);
  });
}
