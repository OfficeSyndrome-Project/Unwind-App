import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/set_box_workout_widget.dart';

void main() {
  testWidgets('test SetBoxWorkout widget', (WidgetTester tester) async {
    WorkoutData? testWorkoutData = WorkoutData(
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
          body: SetBoxWorkoutWidget(
            workoutData: testWorkoutData,
          ),
        ),
      ),
    );

    expect(find.text("ท่าหดคอ กดศีรษะ"), findsOneWidget);
    expect(find.text("ยืดกล้ามเนื้อคอ"), findsOneWidget);
    expect(find.text('${3} เซต/วัน '), findsOneWidget);
    expect(find.byType(RatioImageoneToOne), findsOneWidget);
    final nameTextWidget =
        find.text("ท่าหดคอ กดศีรษะ").evaluate().first.widget as Text;
    expect(nameTextWidget.style!.fontWeight, FontWeight.w500);
    expect(nameTextWidget.style!.color, const Color(0xFF484D56));

    final detailTextWidget =
        find.text("ยืดกล้ามเนื้อคอ").evaluate().first.widget as Text;
    expect(detailTextWidget.style!.fontWeight, FontWeight.w500);
    expect(detailTextWidget.style!.color, const Color(0xFF636A75));

    final setInfoTextWidget =
        find.text('${3} เซต/วัน ').evaluate().first.widget as Text;
    expect(setInfoTextWidget.style!.fontWeight, FontWeight.w500);
    expect(setInfoTextWidget.style!.color, const Color(0xFF3B67CD));
  });
}
