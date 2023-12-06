// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HistoryWorkoutlistWidget extends StatelessWidget {
  HistoryWorkoutlistWidget({super.key});

  List<ChartData> chartData = [ChartData(1, 10)];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 86,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "name workout list",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "date start and date end",
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
          SizedBox(
            width: 48,
            height: 48,
            child: CircularPercentIndicator(
              radius: 24,
              lineWidth: 8,
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
