import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/workout_widget.dart';
import 'package:unwind_app/Widgets/animate_sequence_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/services/tts_manager_service.dart';

void main() {
  testWidgets('test Workout widget', (WidgetTester tester) async {
    const String testName = 'Test Workout';
    final WorkoutData testWorkoutData = WorkoutData(
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
      animationPaths: [
        "lib/assets/images/workout/neck-shoulder/neckch01/TP-1.png",
        "lib/assets/images/workout/neck-shoulder/neckch01/TP-2.png",
        "lib/assets/images/workout/neck-shoulder/neckch01/TP-3.png",
        "lib/assets/images/workout/neck-shoulder/neckch01/TP-4.png",
        "lib/assets/images/workout/neck-shoulder/neckch01/TP-5.png",
        "lib/assets/images/workout/neck-shoulder/neckch01/TP-6.png",
        "lib/assets/images/workout/neck-shoulder/neckch01/TP-7.png"
      ],
      workoutType: "stretch",
    );
    const int testTimeth = 5;
    final TtsManager ttsManager = TtsManager();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WorkoutWidget(
            name: testName,
            timeth: testTimeth,
            workoutData: testWorkoutData,
            ttsManager: ttsManager,
          ),
        ),
      ),
    );

    expect(find.byType(WorkoutWidget), findsOneWidget);
    expect(find.text(testName), findsOneWidget);
    expect(find.byType(AnimateSequenceWidget), findsOneWidget);
    final animateSequenceWidget = tester
        .widget<AnimateSequenceWidget>(find.byType(AnimateSequenceWidget));
    expect(find.text('$testTimeth/5'), findsOneWidget); //time: 5
    expect(animateSequenceWidget.listPath, testWorkoutData.animationPaths);
  });
}
