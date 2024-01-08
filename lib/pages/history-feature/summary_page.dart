import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withicon_widget.dart';
import 'package:unwind_app/Widgets/history-widget/score_average_widget.dart';
import 'package:unwind_app/Widgets/history-widget/score_chart_widget.dart';

import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/data/history-data/week_score_mockup.dart';

import 'package:unwind_app/globals/theme/appscreen_theme.dart';

import '../../data/history-data/keep_score_and_date_model.dart';
import '../../data/history-data/summary_list_obj.dart';

class SummaryPage extends StatelessWidget {
  SummaryPage({super.key});

  final PageRoutes pageRoutes = PageRoutes();

  final List<String> nameWorkout = [
    'ท่าหดคอ กดศีรษะ',
    'ท่ามองรักแร้ กดศีรษะ',
    'ท่าเงยหน้า เอนคอ'
  ];
  //example data line chart
  static List<KeepScoreAndDateModel> keepscores =
      KeepScoreAndDateModel.getData();

  static List<WeekScoreMockup> weekscoremockup = WeekScoreMockup.getData();

  static List<List<KeepScoreAndDateModel>> divideListIntoWeeks(
      List<KeepScoreAndDateModel> data) {
    List<List<KeepScoreAndDateModel>> weeklyChunks = [];
    int chunkSize = 7;

    for (int i = 0; i < data.length; i += chunkSize) {
      int end = (i + chunkSize < data.length) ? i + chunkSize : data.length;
      weeklyChunks.add(data.sublist(i, end));
    }

    return weeklyChunks;
  }

  static final List<List<KeepScoreAndDateModel>> weeklyChunks =
      divideListIntoWeeks(keepscores);

  changeMonthIntToString(List<KeepScoreAndDateModel> Datedata) {
    return Datedata.map(
        (data) => DateFormat('MMMM', 'th').format(data.dateTime)).first;
  }

  static int currentDiffScore =
      keepscores.map((score) => score.beforeScore).first -
          keepscores.map((score) => score.afterScore).last;

  @override
  Widget build(BuildContext context) {
    double? boxHeight = weeklyChunks.length + 0;

    return AppscreenTheme(
        textBar: pageRoutes.history.summarypage().title,
        iconButtonStart: IconButton(
            alignment: Alignment.centerLeft,
            onPressed: () {
              Navigator.pop(context);
            },
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            )),
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    //day - day Month year
                    '${keepscores.map((data) => data.dateTime.day).first.toString()} - ${keepscores.map((data) => data.dateTime.day).last.toString()} ${changeMonthIntToString(keepscores).toString()} ${keepscores.map((data) => data.dateTime.year).first.toString()}',
                    style: ResponsiveCheckWidget.isSmallMobile(context)
                        ? TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF484D56),
                          )
                        : Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextWithStartIconWidget(
                  startIcon: Icon(
                    Icons.directions_run_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  topicName: 'ชื่อชุดท่าบริหาร',
                  style: ResponsiveCheckWidget.isSmallMobile(context)
                      ? TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF3B67CD),
                        )
                      : Theme.of(context).textTheme.bodySmall,
                ),
                Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: nameWorkout.map((data) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            const Text(
                              '\u2022',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xFF484D56)),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              data,
                              style:
                                  ResponsiveCheckWidget.isSmallMobile(context)
                                      ? TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF484D56),
                                        )
                                      : Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        ),
                      );
                    }).toList()),
                const SizedBox(
                  height: 4,
                ),
                TextWithStartIconWidget(
                  startIcon: Icon(
                    Icons.analytics_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  topicName: 'ค่าความเจ็บปวด (ก่อน/หลัง)',
                  style: ResponsiveCheckWidget.isSmallMobile(context)
                      ? TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF3B67CD),
                        )
                      : Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 8,
                ),
                ScoreChartWidget(
                  height: 150,
                  series: <LineSeries<WeekScoreMockup, int>>[
                    LineSeries(
                      legendItemText: 'ค่าความเจ็บปวด (ก่อน)',
                      legendIconType: LegendIconType.rectangle,
                      color: Color(0xFFb1c2eb),
                      markerSettings: const MarkerSettings(
                        isVisible: true,
                        height: 6,
                        width: 6,
                      ),
                      animationDuration: 0,
                      dataSource: weekscoremockup,
                      xValueMapper: (WeekScoreMockup score, _) => score.week,
                      yValueMapper: (WeekScoreMockup score, _) =>
                          score.beforeScore,
                    ),
                    LineSeries(
                      legendItemText: 'ค่าความเจ็บปวด (หลัง)',
                      legendIconType: LegendIconType.rectangle,
                      color: Theme.of(context).colorScheme.primary,
                      animationDuration: 0,
                      markerSettings: const MarkerSettings(
                          isVisible: true, height: 6, width: 6),
                      dataSource: weekscoremockup,
                      xValueMapper: (WeekScoreMockup score, _) => score.week,
                      yValueMapper: (WeekScoreMockup score, _) =>
                          score.afterScore,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 44 * boxHeight,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ButtonWithiconWidget(
                          onTap: () {
                            Navigator.push(
                                context,
                                pageRoutes.history.resultperweekpage([
                                  SummaryListObj(
                                      weeklyChunks: weeklyChunks, index: index)
                                ]).route(context));
                          },
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          text: 'สัปดาห์ที่ ' + (index + 1).toString(),
                          color: Theme.of(context).colorScheme.secondary,
                          colorText: Colors.white,
                          radius: 8,
                          side: BorderSide.none,
                          icon: Icons.arrow_forward_ios_rounded,
                          iconcolor: Colors.white,
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 4,
                              offset: Offset(0, 1),
                              spreadRadius: 0,
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 4,
                          ),
                      itemCount: weeklyChunks.length),
                ),
                ScoreAverageWidget(
                  nrsScoreAverage: currentDiffScore > 0 ? currentDiffScore : 0,
                ),
                ButtonWithiconWidget(
                  onTap: () {},
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  text: 'ผลการประเมินแบบทดสอบ',
                  color: const Color(0xFFC4D1F0),
                  colorText: const Color(0xFF6285D7),
                  radius: 8,
                  side: BorderSide.none,
                  icon: Icons.arrow_forward_ios_rounded,
                  iconcolor: const Color(0xFF6285D7),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ],
            ),
          ),
        ]);
  }
}
