import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScoreChartWidget extends StatelessWidget {
  final double height;
  final dynamic series;
  const ScoreChartWidget({super.key, required this.height, this.series});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(bottom: 4, top: 4),
      child: SfCartesianChart(
        legend: Legend(
            isVisible: true,
            toggleSeriesVisibility: false,
            position: LegendPosition.bottom,
            iconWidth: 8,
            iconHeight: 8,
            textStyle: TextStyle(fontWeight: FontWeight.w500)),
        margin: EdgeInsets.zero,
        plotAreaBorderWidth: 0,
        primaryYAxis: NumericAxis(
            labelStyle: const TextStyle(
              color: Color(0xFF233D7B),
              fontSize: 14,
              fontFamily: 'Noto Sans Thai',
              fontWeight: FontWeight.w500,
            ),
            majorTickLines:
                const MajorTickLines(width: 2, color: Color(0xff233E7B)),
            majorGridLines: const MajorGridLines(
              width: 0,
            ),
            interval: 2,
            axisLine: const AxisLine(color: Color(0xff233E7B), width: 2)),
        primaryXAxis: NumericAxis(
            labelStyle: const TextStyle(
              color: Color(0xFF233D7B),
              fontSize: 14,
              fontFamily: 'Noto Sans Thai',
              fontWeight: FontWeight.w500,
            ),
            majorTickLines:
                const MajorTickLines(width: 2, color: Color(0xff233E7B)),
            majorGridLines: const MajorGridLines(
              width: 0,
            ),
            interval: 1,
            axisLine: const AxisLine(color: Color(0xff233E7B), width: 2)),
        tooltipBehavior: TooltipBehavior(enable: false),
        series: series,
      ),
    );
  }
}
