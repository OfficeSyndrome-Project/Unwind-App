import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/list_dropdown_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart'; // ต้องแก้ตามที่เห็นสมควร

void main() {
  testWidgets('test ListDropdown widget', (WidgetTester tester) async {
    final List<WorkoutList> testWorkoutLists = [
      WorkoutList(
          title: "คอ-บ่า",
          titleTH: "ชุดท่าบริหารคอเพิ่มความยืดหยุ่น",
          workoutType: "stretch",
          titlePath: "lib/assets/images/screeningPart/select_pain_1.png",
          titleCode: "neckbaa_ch",
          workoutData: WorkoutData.getWorkoutData()
              .where((element) =>
                  element.title == "คอ-บ่า" && element.workoutType == "stretch")
              .toList(),
          totalTime: "4 นาที 10 วินาที"),
      WorkoutList(
          title: "คอ-บ่า",
          titleTH: "ชุดท่าบริหารคอเพิ่มความแข็งแรง",
          workoutType: "strength",
          titlePath: "lib/assets/images/screeningPart/select_pain_1.png",
          titleCode: "neckbaa_th",
          workoutData: WorkoutData.getWorkoutData()
              .where((element) =>
                  element.title == "คอ-บ่า" &&
                  element.workoutType == "strength")
              .toList(),
          totalTime: "5 นาที 50 วินาที"),
    ];
    WorkoutList? selectedValue;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListDropdownWidget(
            nameList: testWorkoutLists,
            value: selectedValue,
            onChanged: (value) {
              selectedValue = value;
            },
          ),
        ),
      ),
    );
    expect(find.text('กรุณาเลือกชุดท่าบริหาร'), findsOneWidget);
    expect(find.byType(ListDropdownWidget), findsOneWidget);
    await tester.tap(find.byType(DropdownButtonFormField<WorkoutList>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('ชุดท่าบริหารคอเพิ่มความยืดหยุ่น').last);
    expect(selectedValue, testWorkoutLists[0]);
  });
}
