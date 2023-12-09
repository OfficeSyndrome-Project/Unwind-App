// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

import '../../Widgets/topic_widget.dart';

class ResultPerWeekPage extends StatelessWidget {
  ResultPerWeekPage({super.key});

  PageRoutes pageRoutes = PageRoutes();

  //example data line chart
  List<KeepScoreAndDate> keepScoreAndDateData = [
    KeepScoreAndDate(1, DateTime.utc(2023, 8, 8), 6, 4),
    KeepScoreAndDate(2, DateTime.utc(2023, 8, 9), 5, 4),
    KeepScoreAndDate(3, DateTime.utc(2023, 8, 10), 5, 4),
    KeepScoreAndDate(4, DateTime.utc(2023, 8, 11), 5, 3),
    KeepScoreAndDate(5, DateTime.utc(2023, 8, 12), 4, 3),
  ];

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        textBar: pageRoutes.history.resultperweekpage().title,
        iconButtonStart: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
            icon:
                const Icon(Icons.arrow_back_ios_rounded, color: Colors.white)),
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 4,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: AutoSizeText(
                    'สัปดาห์ที่ num',
                    style: Theme.of(context).textTheme.titleLarge,
                    maxFontSize: 18,
                    minFontSize: 16,
                  ),
                ),
                Center(
                  child: AutoSizeText(
                    'Date - Date Month Year',
                    style: Theme.of(context).textTheme.titleMedium,
                    maxFontSize: 16,
                    minFontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TopicWidget(
                    startIcon: Icon(
                      Icons.analytics_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    topicName: 'ค่าความเจ็บปวด (ก่อน/หลัง)'),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  height: 120,
                  margin: const EdgeInsets.only(bottom: 4, top: 4),
                  child: SfCartesianChart(
                    margin: EdgeInsets.zero,
                    plotAreaBorderWidth: 0,
                    primaryYAxis: NumericAxis(
                        labelStyle: const TextStyle(
                          color: Color(0xFF233D7B),
                          fontSize: 14,
                          fontFamily: 'Noto Sans Thai',
                          fontWeight: FontWeight.w500,
                        ),
                        majorTickLines: const MajorTickLines(
                            width: 2, color: Color(0xff233E7B)),
                        majorGridLines: const MajorGridLines(
                          width: 0,
                        ),
                        interval: 2,
                        axisLine:
                            const AxisLine(color: Color(0xff233E7B), width: 2)),
                    primaryXAxis: NumericAxis(
                        labelStyle: const TextStyle(
                          color: Color(0xFF233D7B),
                          fontSize: 14,
                          fontFamily: 'Noto Sans Thai',
                          fontWeight: FontWeight.w500,
                        ),
                        majorTickLines: const MajorTickLines(
                            width: 2, color: Color(0xff233E7B)),
                        majorGridLines: const MajorGridLines(
                          width: 0,
                        ),
                        interval: 1,
                        axisLine:
                            const AxisLine(color: Color(0xff233E7B), width: 2)),
                    tooltipBehavior: TooltipBehavior(enable: false),
                    series: <ChartSeries<KeepScoreAndDate, int>>[
                      LineSeries(
                        color: Theme.of(context).colorScheme.primary,
                        animationDuration: 0,
                        markerSettings: const MarkerSettings(
                            isVisible: true, height: 6, width: 6),
                        dataSource: keepScoreAndDateData,
                        xValueMapper: (KeepScoreAndDate score, _) => score.day,
                        yValueMapper: (KeepScoreAndDate score, _) =>
                            score.afterScore,
                      )
                    ],
                  ),
                ),
                Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: keepScoreAndDateData.map((data) {
                      return Row(
                        children: [
                          AutoSizeText(
                            'วันที่ ${DateFormat("dd/MM/yy").format(data.dateTime)} : ',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                            maxFontSize: 16,
                            minFontSize: 14,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          AutoSizeText(
                            '${data.beforeScore}/${data.afterScore}',
                            style: Theme.of(context).textTheme.titleMedium,
                            maxFontSize: 16,
                            minFontSize: 14,
                          )
                        ],
                      );
                    }).toList()),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: AutoSizeText.rich(
                    maxFontSize: 16,
                    minFontSize: 14,
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'ค่าความเจ็บปวดเฉลี่ย : ',
                            style: TextStyle(
                              fontFamily: "Noto Sans Thai",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF484D56),
                            )),
                        TextSpan(
                            text: 'num',
                            style: TextStyle(
                              fontFamily: "Noto Sans Thai",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3B67CD),
                            )),
                      ],
                    ),
                  ),
                ),
                AutoSizeText.rich(
                  textAlign: TextAlign.center,
                  maxFontSize: 16,
                  minFontSize: 14,
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'ความสม่ำเสมอ : ',
                          style: TextStyle(
                            fontFamily: "Noto Sans Thai",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF484D56),
                          )),
                      TextSpan(
                          text: 'num',
                          style: TextStyle(
                            fontFamily: "Noto Sans Thai",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3B67CD),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.ios_share_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ]);
  }
}

class KeepScoreAndDate {
  final int day;
  final DateTime dateTime;
  final int beforeScore;
  final int afterScore;
  KeepScoreAndDate(this.day, this.dateTime, this.beforeScore, this.afterScore);
}
