import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/history-widget/list_score_widget%20copy.dart';
import 'package:unwind_app/Widgets/history-widget/score_chart_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:unwind_app/pages/history-feature/summary_page.dart';
import '../../Widgets/text_withstart_icon.dart';
import '../../data/history-data/summary_list_obj.dart';

class ResultPerWeekPage extends StatefulWidget {
  final WeeklySummary weeklySummary;

  ResultPerWeekPage({
    super.key,
    required this.weeklySummary,
  });

  @override
  State<ResultPerWeekPage> createState() => _ResultPerWeekPageState();
}

class _ResultPerWeekPageState extends State<ResultPerWeekPage> {
  PageRoutes pageRoutes = PageRoutes();

  // late SummaryListObj keepScoreObj;
  // late int currentIndex = keepScoreObj.index;
  int get weekNumber => widget.weeklySummary.weekNumber;
  int get differentScore => 1;
  WeeklySummary get weeklySummary => widget.weeklySummary;
  // late int differenceScore =
  //     keepScoreObj.weeklyChunks[0].map((score) => score.beforeScore).first -
  //         keepScoreObj.weeklyChunks[currentIndex]
  //             .map((score) => score.afterScore)
  //             .last;

  @override
  void initState() {
    super.initState();
    initScore();
  }

  void initScore() {
    // if (widget.summaryArr.isNotEmpty) {
    //   keepScoreObj = widget.summaryArr.first;
    // }
  }

  @override
  Widget build(BuildContext context) {
    final lastestNrs = weeklySummary.dailyNrsScores
        .where((element) => element.afterScore != null)
        .lastOrNull
        ?.afterScore;
    final firstNrs = weeklySummary.dailyNrsScores
        .where((element) => element.beforeScore != null)
        .firstOrNull
        ?.beforeScore;
    print('--- x : ${weeklySummary.dailyNrsScores.first.dateTime}');
    initializeDateFormatting('th');
    return AppscreenTheme(
        textBar: "ประวัติ",
        iconButtonStart: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:
                const Icon(Icons.arrow_back_ios_rounded, color: Colors.white)),
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
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
                        child: Text(
                          'สัปดาห์ที่ $weekNumber',
                          style: ResponsiveCheckWidget.isSmallMobile(context)
                              ? TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF484D56),
                                )
                              : Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        alignment: Alignment.center,
                        child: Text(
                          // ' ${weeklySummary.dailyNrsScores.first.dateTime?.day}',
                          '${formatDateTimeRangeToThai(weeklySummary.dailyNrsScores.first.dateTime!, weeklySummary.dailyNrsScores.last.dateTime!)}',
                          //first day
                          // .map((data) => data.dateTime.day)
                          // .first
                          //     .toString() +
                          // ' - ' + //last day
                          // keepScoreObj.weeklyChunks[weekNumber]
                          //     .map((data) => data.dateTime.day)
                          //     .last
                          //     .toString() +
                          // ' ' + //month
                          // keepScoreObj.weeklyChunks[weekNumber]
                          //     .map((data) => DateFormat('MMMM', 'th')
                          //         .format(data.dateTime))
                          //     .first
                          //     .toString() +
                          // ' ' + //year
                          // keepScoreObj.weeklyChunks[weekNumber]
                          //     .map((data) => data.dateTime.year)
                          //     .first
                          //     .toString(),
                          style: ResponsiveCheckWidget.isSmallMobile(context)
                              ? TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF484D56),
                                )
                              : Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      ScoreChartWidget(
                        height: 150,
                        series: <LineSeries<DailyNrsScore, int>>[
                          LineSeries<DailyNrsScore, int>(
                            legendItemText: 'ค่าความเจ็บปวด (ก่อน)',
                            legendIconType: LegendIconType.rectangle,
                            color: Color(0xFFb1c2eb),
                            markerSettings: const MarkerSettings(
                              isVisible: true,
                              height: 6,
                              width: 6,
                            ),
                            animationDuration: 0,
                            dataSource:
                                // [keepScoreObj.weeklyChunks[weekNumber]].first,
                                weeklySummary.dailyNrsScores,
                            xValueMapper: (DailyNrsScore score, _) =>
                                score.dateTime?.day,
                            yValueMapper: (DailyNrsScore score, _) =>
                                score.beforeScore,
                          ),
                          LineSeries(
                            legendItemText: 'ค่าความเจ็บปวด (หลัง)',
                            legendIconType: LegendIconType.rectangle,
                            color: Theme.of(context).colorScheme.primary,
                            animationDuration: 0,
                            markerSettings: const MarkerSettings(
                                isVisible: true, height: 6, width: 6),
                            dataSource: weeklySummary.dailyNrsScores,
                            xValueMapper: (DailyNrsScore score, _) =>
                                score.dateTime?.day,
                            yValueMapper: (DailyNrsScore score, _) =>
                                score.afterScore,
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16, bottom: 8),
                        child: TextWithStartIconWidget(
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
                      ),
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: weeklySummary.dailyNrsScores
                              .where((e) => e.dateTime != null)
                              .map((data) => Row(
                                    children: [
                                      Text(
                                        'วันที่ ${DateFormat("dd/MM/yy").format(data.dateTime!)} : ',
                                        textAlign: TextAlign.center,
                                        style: ResponsiveCheckWidget
                                                .isSmallMobile(context)
                                            ? TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF484D56),
                                              )
                                            : Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '${data.beforeScore ?? ' - '}/${data.afterScore ?? ' - '}',
                                        style: ResponsiveCheckWidget
                                                .isSmallMobile(context)
                                            ? TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF484D56),
                                              )
                                            : Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                      )
                                    ],
                                  ))
                              .toList()),
                      const SizedBox(
                        height: 4,
                      ),
                      ListScoreWidget(
                        firstNrs: weeklySummary.dailyNrsScores
                            .where((element) => element.beforeScore != null)
                            .firstOrNull
                            ?.beforeScore,
                        lastNrs: weeklySummary.dailyNrsScores
                            .where((element) => element.afterScore != null)
                            .lastOrNull
                            ?.afterScore,
                        differenceNrs: (firstNrs != null && lastestNrs != null)
                            ? firstNrs - lastestNrs
                            : null,
                        // differenceScore > 0 ? differenceScore : 0,
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
              ],
            ),
          ))
        ]);
  }
}
