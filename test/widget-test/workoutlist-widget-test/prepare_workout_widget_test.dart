import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/animate_sequence_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/prepare_workout_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';

void main() {
  testWidgets('test PrepareWorkout widget', (WidgetTester tester) async {
    WorkoutData testWorkoutData = WorkoutData(
      title: "คอ-บ่า",
      name: "ท่าหดคอ กดศีรษะ",
      detail: "ยืดกล้ามเนื้อคอ",
      step:
          "นั่งหรือยืนหลังตรง ก้มศีรษะลงจนสุด ร่วมกับเก็บคางชิดคอ ใช้มือทั้ง 2 ข้างออกแรงกดศีรษะลง จนกระทั่งรู้สึกตึงที่หลังคอ ค้างไว้นานเป็นเวลา 10 วินาทีแล้วปล่อย",
      sec: 10,
      time: 5,
      set: 3,
      thumbnailPath: "lib/assets/images/workout-thumbnail-img/neckch01.png",
      frequency: "ทำทุกวัน",
      caution: "ยืดให้รู้สึกตึง ไม่ควรยืดจนรู้สึกเจ็บ",
      animationPaths: null,
      workoutType: "stretch",
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PrepareWorkoutWidget(
            workoutData: testWorkoutData,
          ),
        ),
      ),
    );
    expect(find.byType(PrepareWorkoutWidget), findsOneWidget);
    expect(find.text('เตรียมพร้อมสำหรับการบริหาร !'), findsOneWidget);
    if (testWorkoutData.animationPaths != null) {
      expect(find.byType(AnimateSequenceWidget), findsOneWidget);
      final animateSequenceWidget = tester.widget<AnimateSequenceWidget>(
        find.byType(AnimateSequenceWidget),
      );
      expect(animateSequenceWidget.listPath, testWorkoutData.animationPaths);
    } else {
      expect(find.byType(AnimateSequenceWidget), findsNothing);
    }
  });
}
