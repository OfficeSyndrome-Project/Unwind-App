import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/history-widget/list_score_widget%20copy.dart';
import 'package:unwind_app/Widgets/history-widget/score_chart_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import '../../Widgets/text_withstart_icon.dart';
import '../../data/history-data/keep_score_and_date_model.dart';
import '../../data/history-data/summary_list_obj.dart';

class ResultPerWeekPage extends StatefulWidget {
  final List<SummaryListObj> summaryArr;

  ResultPerWeekPage({super.key, required this.summaryArr});

  @override
  State<ResultPerWeekPage> createState() => _ResultPerWeekPageState();
}

class _ResultPerWeekPageState extends State<ResultPerWeekPage> {
  PageRoutes pageRoutes = PageRoutes();

  late SummaryListObj keepScoreObj;
  late int currentIndex = keepScoreObj.index;
  late int differenceScore =
      keepScoreObj.weeklyChunks[0].map((score) => score.beforeScore).first -
          keepScoreObj.weeklyChunks[currentIndex]
              .map((score) => score.afterScore)
              .last;

  @override
  void initState() {
    super.initState();
    initScore();
  }

  void initScore() {
    if (widget.summaryArr.isNotEmpty) {
      keepScoreObj = widget.summaryArr.first;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                          'สัปดาห์ที่ ${keepScoreObj.index + 1}',
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
                          //first day
                          keepScoreObj.weeklyChunks[currentIndex]
                                  .map((data) => data.dateTime.day)
                                  .first
                                  .toString() +
                              ' - ' + //last day
                              keepScoreObj.weeklyChunks[currentIndex]
                                  .map((data) => data.dateTime.day)
                                  .last
                                  .toString() +
                              ' ' + //month
                              keepScoreObj.weeklyChunks[currentIndex]
                                  .map((data) => DateFormat('MMMM', 'th')
                                      .format(data.dateTime))
                                  .first
                                  .toString() +
                              ' ' + //year
                              keepScoreObj.weeklyChunks[currentIndex]
                                  .map((data) => data.dateTime.year)
                                  .first
                                  .toString(),
                          style: ResponsiveCheckWidget.isSmallMobile(context)
                              ? TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF484D56),
                                )
                              : Theme.of(context).textTheme.titleMedium,
                        ),
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
                        height: 4,
                      ),
                      ScoreChartWidget(
                        height: 150,
                        series: <LineSeries<KeepScoreAndDateModel, int>>[
                          LineSeries<KeepScoreAndDateModel, int>(
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
                                [keepScoreObj.weeklyChunks[currentIndex]].first,
                            xValueMapper: (KeepScoreAndDateModel score, _) =>
                                score.dateTime.day,
                            yValueMapper: (KeepScoreAndDateModel score, _) =>
                                score.beforeScore,
                          ),
                          LineSeries(
                            legendItemText: 'ค่าความเจ็บปวด (หลัง)',
                            legendIconType: LegendIconType.rectangle,
                            color: Theme.of(context).colorScheme.primary,
                            animationDuration: 0,
                            markerSettings: const MarkerSettings(
                                isVisible: true, height: 6, width: 6),
                            dataSource:
                                [keepScoreObj.weeklyChunks[currentIndex]].first,
                            xValueMapper: (KeepScoreAndDateModel score, _) =>
                                score.dateTime.day,
                            yValueMapper: (KeepScoreAndDateModel score, _) =>
                                score.afterScore,
                          ),
                        ],
                      ),
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: keepScoreObj.weeklyChunks[currentIndex]
                              .map((data) {
                            return Row(
                              children: [
                                Text(
                                  'วันที่ ${DateFormat("dd/MM/yy").format(data.dateTime)} : ',
                                  textAlign: TextAlign.center,
                                  style: ResponsiveCheckWidget.isSmallMobile(
                                          context)
                                      ? TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF484D56),
                                        )
                                      : Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${data.beforeScore}/${data.afterScore}',
                                  style: ResponsiveCheckWidget.isSmallMobile(
                                          context)
                                      ? TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF484D56),
                                        )
                                      : Theme.of(context).textTheme.titleMedium,
                                )
                              ],
                            );
                          }).toList()),
                      const SizedBox(
                        height: 4,
                      ),
                      ListScoreWidget(
                        firstNrs: keepScoreObj.weeklyChunks[0]
                            .map((score) => score.beforeScore)
                            .first,
                        lastNrs: keepScoreObj.weeklyChunks[currentIndex]
                            .map((score) => score.afterScore)
                            .last,
                        differenceNrs:
                            differenceScore > 0 ? differenceScore : 0,
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
