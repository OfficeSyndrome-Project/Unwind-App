import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

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
            overflowMode: LegendItemOverflowMode.wrap,
            width: '100%',
            height: '100%',
            padding: 5,
            isResponsive: true,
            isVisible: true,
            toggleSeriesVisibility: false,
            position: LegendPosition.bottom,
            alignment: ChartAlignment.near,
            iconWidth: 8,
            iconHeight: 8,
            textStyle: TextStyle(fontWeight: FontWeight.w500)),
        margin: EdgeInsets.zero,
        plotAreaBorderWidth: 0,
        primaryYAxis: NumericAxis(
            labelStyle: TextStyle(
              color: Color(0xFF233D7B),
              fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 12 : 14,
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
            labelStyle: TextStyle(
              color: Color(0xFF233D7B),
              fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 12 : 14,
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
