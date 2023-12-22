import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/data/history-data/keep_score_and_date_model.dart';

class HistoryWorkoutlistWidget extends StatelessWidget {
  HistoryWorkoutlistWidget({super.key});

  static List<ChartData> chartData = [ChartData(1, 10)];
  static List<KeepScoreAndDateModel> keepscores =
      KeepScoreAndDateModel.getData();

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
                keepscores.map((data) => data.name).first.toString(),
                style: ResponsiveCheckWidget.isSmallMobile(context)
                    ? TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF484D56),
                      )
                    : Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "วันที่ ${DateFormat("dd/MM/yy").format(keepscores.map((data) => data.dateTime).first)} ถึง ${DateFormat("dd/MM/yy").format(keepscores.map((data) => data.dateTime).last)}",
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
          SizedBox(
            width: 48,
            height: 48,
            child: CircularPercentIndicator(
              radius: 24,
              lineWidth: 9.5,
              circularStrokeCap: CircularStrokeCap.round,
              percent: 0.5,
              animation: false,
              backgroundColor: const Color(0xFFD9D9D9),
              progressColor: const Color(0xFF6285D7),
            ),
          ),
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
