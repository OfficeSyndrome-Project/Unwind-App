import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:unwind_app/Widgets/history-widget/history_boxworkoutlist_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/models/workoutlist_model.dart';
import 'package:unwind_app/pages/history-feature/summary_page.dart';

void main() {
  // Arrange
  final now = DateTime.now();
  WorkoutListData workoutListData =
      WorkoutListData.workoutListFromTitleCode['neckbaa_ch']!;
  List<WorkoutListModel> workoutListModels = [
    WorkoutListModel(date: now),
    WorkoutListModel(date: now.add(Duration(days: 1))),
  ];

  // Act
  testWidgets('test HistoryWorkoutlist widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HistoryWorkoutlistWidget(
            workoutList: workoutListData,
            workoutListModels: workoutListModels,
          ),
        ),
      ),
    );

    // Assert
    expect(find.text(workoutListData.titleTH), findsOneWidget);
    expect(
      find.text(
        "วันที่ ${formatDateTimeRangeToThaiForHistoryPage(workoutListModels.first.date!, workoutListModels.last.date!)}",
      ),
      findsOneWidget,
    );
    expect(find.byType(Icon), findsOneWidget);
  });
}
