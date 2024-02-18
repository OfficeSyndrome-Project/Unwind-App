import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/models/workoutlist_model.dart';
import 'package:unwind_app/pages/history-feature/summary_page.dart';

class HistoryWorkoutlistWidget extends StatelessWidget {
  final WorkoutListData workoutList;
  final List<WorkoutListModel> workoutListModels;

  HistoryWorkoutlistWidget({
    super.key,
    required this.workoutList,
    required this.workoutListModels,
  });

  // static List<ChartData> chartData = [ChartData(1, 10)];
  // static List<KeepScoreAndDateModel> keepscores =
  //     KeepScoreAndDateModel.getData();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 18),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 4,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // keepscores.map((data) => data.name).first.toString(),
                '${workoutList.titleTH}',
                style: ResponsiveCheckWidget.isSmallMobile(context)
                    ? TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF484D56),
                      )
                    : Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                // "วันที่ ${DateFormat("dd/MM/yy").format(workoutListModels.first.date ?? DateTime.now())} ถึง ${DateFormat("dd/MM/yy").format(workoutListModels.last.date ?? DateTime.now())}",
                (workoutListModels.first.date == null ||
                        workoutListModels.last.date == null)
                    ? ""
                    : "วันที่ ${formatDateTimeRangeToThaiForHistoryPage(workoutListModels.first.date!, workoutListModels.last.date!)}",
                style: ResponsiveCheckWidget.isSmallMobile(context)
                    ? TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF636A75),
                      )
                    : Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
          Icon(Icons.arrow_forward_ios_rounded,
              color: Theme.of(context).colorScheme.primary, size: 24)
        ],
      ),
    );
  }
}

class ChartData {
  final int day;
  final double frequent;
  ChartData(this.day, this.frequent);
}
