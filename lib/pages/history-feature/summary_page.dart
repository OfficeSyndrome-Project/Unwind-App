import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withicon_widget.dart';
import 'package:unwind_app/Widgets/history-widget/score_average_widget.dart';

import 'package:unwind_app/Widgets/history-widget/week_chart_widget.dart';

import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/data/history-data/week_score_mockup.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/database/workoutlist_db.dart';

import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/models/workoutlist_model.dart';
import 'package:unwind_app/pages/workoutList-feature/report_workout_utils.dart';

import '../../data/history-data/keep_score_and_date_model.dart';
import '../../data/history-data/summary_list_obj.dart';

class SummaryPage extends StatelessWidget {
  SummaryPage({
    super.key,
    required this.workoutList,
    required this.workoutListModel,
  });

  final PageRoutes pageRoutes = PageRoutes();
  final WorkoutListData workoutList;
  final List<WorkoutListModel> workoutListModel;

  //example data line chart
  static List<KeepScoreAndDateModel> keepscores =
      KeepScoreAndDateModel.getData();

  static List<WeekScore> weekscoremockup = WeekScoreMockup.getData();

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
    final weeklyWorkoutLists = getWeeklyWorkouts(workoutListModel);
    double? boxHeight = weeklyWorkoutLists.length + 0;
    return AppscreenTheme(
        textBar:
            pageRoutes.history.summarypage(workoutList, workoutListModel).title,
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
          Expanded(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Container(
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
                        (workoutListModel.firstOrNull?.date == null ||
                                workoutListModel.firstOrNull?.date == null)
                            ? 'ไม่มีข้อมูลวันที่'
                            : '${formatDateTimeRangeToThai(workoutListModel.first.date!, workoutListModel.last.date!)}',
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
                        children: workoutList.workoutData.map((data) {
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
                                  data.name,
                                  style: ResponsiveCheckWidget.isSmallMobile(
                                          context)
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
                    FutureBuilder(
                      future: () async {
                        final wols = await serviceLocator<WorkoutListDB>()
                            .getWorkoutListByTitle(workoutList.titleCode);
                        final weekScores = getWeekScores(wols);
                        print(weekScores);
                        return weekScores;
                      }(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final List<WeekScoreRealize> weekscoremockup =
                              snapshot.data as List<WeekScoreRealize>;
                          return WeekChartWidget(
                            height: 150,
                            series: <CartesianSeries<WeekScore, int>>[
                              LineSeries<WeekScore, int>(
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
                                xValueMapper: (WeekScore item, _) => item.week,
                                yValueMapper: (WeekScore score, _) =>
                                    score.beforeScore,
                              ),
                              LineSeries<WeekScore, int>(
                                legendItemText: 'ค่าความเจ็บปวด (หลัง)',
                                legendIconType: LegendIconType.rectangle,
                                color: Theme.of(context).colorScheme.primary,
                                animationDuration: 0,
                                markerSettings: const MarkerSettings(
                                    isVisible: true, height: 6, width: 6),
                                dataSource: weekscoremockup,
                                xValueMapper: (WeekScore score, _) =>
                                    score.week,
                                yValueMapper: (WeekScore score, _) =>
                                    score.afterScore,
                              ),
                            ],
                          );
                        }
                        return Text('Loading...');
                      },
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
                                    pageRoutes.history
                                        .resultperweekpage(
                                          WeeklySummary(
                                            dailyNrsScores:
                                                weeklyWorkoutLists[index]
                                                    .map(toDailyNrsScore)
                                                    .toList(),
                                            weekNumber: index + 1,
                                          ),
                                        )
                                        .route(context));
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
                          itemCount: weeklyWorkoutLists.length),
                    ),
                    ScoreAverageWidget(
                      // nrsScoreAverage: currentDiffScore > 0 ? currentDiffScore : 0,
                      nrsScoreAverage:
                          (getNrsBeforeAfter(workoutListModel).before ?? 0) -
                              (getNrsBeforeAfter(workoutListModel).after ?? 0),
                    ),
                    ButtonWithiconWidget(
                      onTap: () {
                        Navigator.push(
                            context,
                            pageRoutes.history
                                .resultscreening(keepscores)
                                .route(context));
                      },
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
            ),
          ),
        ]);
  }
}

String formatDateTimeRangeToThai(DateTime from, DateTime to) {
  if (from.year == to.year && from.month == to.month)
    return '${from.day} - ${to.day} ${from.thaiMonthName()} พ.ศ.${from.yearTH()}';
  if (from.year == to.year)
    return '${from.day} ${from.thaiMonthName()} - ${to.day} ${to.thaiMonthName()} พ.ศ.${from.yearTH()}';
  return '${from.day} ${from.thaiMonthName()} ${from.yearTH()} - ${to.day} ${to.thaiMonthName()} พ.ศ.${to.yearTH()}';
}

String formatDateTimeRangeToThaiForHistoryPage(DateTime from, DateTime to) {
  return '${from.day.toString().padLeft(2, '0')}/${from.month.toString().padLeft(2, '0')}/${from.yearTH() % 100} ถึง ${to.day.toString().padLeft(2, '0')}/${to.month.toString().padLeft(2, '0')}/${to.yearTH() % 100}';
}

extension ThaiDateTime on DateTime {
  String thaiMonthName() {
    return DateFormat('MMMM', 'th').format(this);
  }

  int yearTH() {
    return this.year + 543;
  }
}

class NrsBeforeAfter {
  final int? before;
  final int? after;
  const NrsBeforeAfter({this.before, this.after});
  @override
  String toString() => 'NrsBeforeAfter $before $after';
}

NrsBeforeAfter getNrsBeforeAfter(List<WorkoutListModel> wols) {
  final sortedWols = wols.where((e) => e.date != null).toList()
    ..sort((a, b) => a.date!.compareTo(b.date!));

  final x = NrsBeforeAfter(
    before: sortedWols
        .where((element) => element.NRS_before != null)
        .firstOrNull
        ?.NRS_before,
    after: sortedWols
        .where((element) => element.NRS_after != null)
        .lastOrNull
        ?.NRS_after,
  );
  return x;
}

//get workout list into a week (7 days)
List<List<WorkoutListModel>> getWeeklyWorkouts(List<WorkoutListModel> wols) {
  final sortedWols = wols.where((workout) => workout.date != null).toList()
    ..sort((a, b) => a.date!.compareTo(b.date!));
  final result = getWeekly(sortedWols)((workout) => workout.date);
  return result;
}

/// Calculates the weekly scores based on the provided list of workout models.
List<WeekScoreRealize> getWeekScores(List<WorkoutListModel> wols) {
  if (wols.isEmpty) return [];
  return getWeeklyWorkouts(wols)
      .map(getNrsBeforeAfter)
      .toList()
      .asMap() // to get the index for the week number, use in WeekScore
      .entries
      .map((entry) => WeekScoreRealize(
          week: entry.key + 1,
          weekName: 'week ${entry.key + 1}',
          beforeScore: entry.value.before,
          afterScore: entry.value.after))
      .toList();
}

extension IterableFirstOrNull<T> on Iterable<T> {
  T? get firstOrNull {
    var iterator = this.iterator;
    if (iterator.moveNext()) return iterator.current;
    return null;
  }

  T? get lastOrNull {
    // if (this is EfficientLengthIterable) {
    //   if (isEmpty) return null;
    //   return last;
    // }
    var iterator = this.iterator;
    if (!iterator.moveNext()) return null;
    T result;
    do {
      result = iterator.current;
    } while (iterator.moveNext());
    return result;
  }
}

/// Returns a function that takes a DateTime and returns a bool indicating
/// whether the date is within the range (inclusive, exclusive).
/// withinDate :: DateTime -> DateTime -> DateTime? -> bool
bool Function(DateTime?) Function(DateTime) withinDateOrSameFirstDay(
        DateTime from) =>
    (DateTime to) => (DateTime? date) => (date == null)
        ? false
        : isSameDay(date, from) || date.isAfter(from) && date.isBefore(to);

/// Returns a list of lists of elements of type T, where each inner list contains
/// elements that fall within a week.
/// The input list of elements must be sorted by date.
/// The function takes a function that extracts the date from the element.
/// getWeekly :: [T] -> (T -> DateTime?) -> [[T]]
List<List<T>> Function(DateTime? Function(T) getDate) getWeekly<T>(
    List<T> elements) {
  return (getDate) {
    if (elements.isEmpty) return [];

    // Extracting first and last dates from the sorted list
    final firstDate = getDate(elements.first);
    final lastDate = getDate(elements.last);

    // If any of the dates is null, return an empty list
    if (firstDate == null || lastDate == null) return [];

    // Calculating the number of weeks between the first and last dates
    final weeksCount = (lastDate.difference(firstDate).inDays ~/ 7) + 1;

    // Generating a list of first dates of each week
    final firstDatesOfWeeks = List.generate(
      weeksCount,
      (index) => firstDate.add(Duration(days: index * 7)),
    );

    // Grouping elements into weekly lists
    final weeklyLists = firstDatesOfWeeks.map((startDate) {
      // Defining a function to check if the element's date falls within the current week
      // bool Function(DateTime?) withinCurrentWeek = (date) =>
      //     date != null &&
      //     date.isAfter(startDate) &&
      //     date.isBefore(startDate.add(Duration(days: 7)));
      final withinCurrentWeek =
          withinDateOrSameFirstDay(startDate)(startDate.add(Duration(days: 7)));

      // Filtering elements that fall within the current week
      return elements
          .where((element) => withinCurrentWeek(getDate(element)))
          .toList();
    }).toList();

    return weeklyLists.where((week) => week.isNotEmpty).toList();
  };
}
