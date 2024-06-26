import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withicon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/date_circle_pick_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/models/workoutlist_model.dart';
import 'package:unwind_app/pages/loading_page.dart';
import 'package:unwind_app/pages/workoutList-feature/report_workout_utils.dart';
import 'package:unwind_app/pages/workoutList-feature/result_nrs_four_week_page.dart';

class ReportWorkoutPage extends StatefulWidget {
  final WorkoutListData? workoutList;
  final WorkoutListDB workoutListDB;
  const ReportWorkoutPage(
      {Key? key, this.workoutList, required this.workoutListDB})
      : super(key: key);

  @override
  State<ReportWorkoutPage> createState() => _ReportWorkoutPageState();
}

class _ReportWorkoutPageState extends State<ReportWorkoutPage> {
  PageRoutes pageRoutes = PageRoutes();

  DateTime currentSelectingDate = DateTime.now();
  int currentSelectionIndex = DateTime.now().weekday; // default browse today
  int currentCircularDisplayIndex = 0;

  @override
  void initState() {
    super.initState();
    currentCircularDisplayIndex = indexOfWeek(currentSelectingDate);
  }

  WorkoutListDB get workoutListDb => widget.workoutListDB;

  List<WorkoutListModel>? getWorkoutListModelsCache;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: serviceLocator<WorkoutListDB>()
          .getWorkoutListByTitle(widget.workoutList!.titleCode),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final workouts = snapshot.data as List<WorkoutListModel>;
          workouts.sort((a, b) => (a.date == null || b.date == null)
              ? 0
              : b.date!.compareTo(a.date!));
          final now = DateTime.now();
          // final now = DateTime(2024, 4, 1);
          if (workouts.isNotEmpty) {
            final lastWorkoutDate = workouts.first.date;
            if (lastWorkoutDate != null) {
              final isWorkoutExpired = now.isAfter(DateTime(
                  lastWorkoutDate.year,
                  lastWorkoutDate.month,
                  lastWorkoutDate.day + 1));
              if (isWorkoutExpired) {
                return FutureBuilder(
                    future: serviceLocator<WorkoutListDB>()
                        .getLatestNrsByTitle(widget.workoutList!.titleCode),
                    builder: (context, snapshot) {
                      if (snapshot.hasData || snapshot.data == null) {
                        final latestNrs = snapshot.data as int?;
                        return ResultNrsFourWeekPage(
                            latestNrs: latestNrs,
                            workoutList: widget.workoutList!);
                      }
                      return LoadingPage();
                      // return Text('This workout is not available');
                    });
              }
            }
          }
        }
        return AppscreenTheme(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            iconButtonStart: IconButton(
                highlightColor: Colors.transparent,
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () {
                  Navigator.pop(context);
                  currentSelectionIndex = DateTime.now().weekday - 1;
                },
                color: Colors.white),
            textBar: widget.workoutList?.titleTH,
            children: [
              FutureBuilder(
                future: getCircle(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        DateFormat(
                              'd MMMM พ.ศ. ',
                              'th',
                            ).format(currentSelectingDate)
                            // Fix this fall back
                            +
                            DateFormat('yyyy').format(
                                DateTime.utc(currentSelectingDate.year + 543)),
                        style: TextStyle(
                          fontFamily: "Noto Sans Thai",
                          fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                              ? 14
                              : 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF484D56),
                        ),
                      ),
                    );
                  }
                  return Text('unhandled');
                },
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 24),
                  // height: 80,
                  child: FutureBuilder(
                    future: getCircle(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final circleData =
                            snapshot.data as Map<int?, WorkoutListModel?>;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: createWeekDateList(currentSelectingDate)
                              .asMap()
                              .entries
                              .map((entry) {
                            final wol = circleData[entry.key];
                            final date = entry.value;
                            return DateCirclePickWidget(
                              date: DateFormat('E', 'th').format(date),
                              // percent: entry.value?.percent ?? 0.0,
                              percent: percentageDone(wol),
                              // percent: 1,
                              onSelect:
                                  currentSelectingDate.weekday == date.weekday,
                              isDone: wol?.remaining_times == 0,
                              onTap: () {
                                handleSelectDate(date);
                              },
                            );
                          }).toList(),
                        );
                      }
                      return Text('Error');
                    },
                  )),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'คุณบริหารร่างกายสำเร็จไปแล้ว',
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF636A75),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        handleSelectDate(
                            currentSelectingDate.subtract(Duration(days: 1)));
                      },
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            Text(
                              'ก่อนหน้า',
                              style: TextStyle(
                                fontSize:
                                    ResponsiveCheckWidget.isSmallMobile(context)
                                        ? 12
                                        : 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF484D56),
                              ),
                            )
                          ],
                        ),
                      ),
                    ), //previous
                    FutureBuilder(
                      future: getCircle(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final circleData =
                              snapshot.data as Map<int?, WorkoutListModel?>;
                          final wol = circleData[currentCircularDisplayIndex];
                          return Container(
                            width: 212,
                            height: 212,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 4),
                            child: CircularPercentIndicator(
                                radius: 106,
                                lineWidth: 46,
                                circularStrokeCap: CircularStrokeCap.round,
                                percent: percentageDone(wol),
                                center: Container(
                                  child: Text(
                                    '${(100 * percentageDone(wol)).toStringAsFixed(0)}%',
                                    style: TextStyle(
                                      fontFamily: "Noto Sans Thai",
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF636A75),
                                    ),
                                  ),
                                ),
                                animation: false,
                                backgroundColor: Color(0xFFebedf0),
                                progressColor: Color(0xff6285d7)),
                          );
                        }
                        return Text('loading...');
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        handleSelectDate(
                            currentSelectingDate.add(Duration(days: 1)));
                      },
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            Text(
                              'ถัดไป',
                              style: TextStyle(
                                fontSize:
                                    ResponsiveCheckWidget.isSmallMobile(context)
                                        ? 12
                                        : 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF484D56),
                              ),
                            )
                          ],
                        ),
                      ),
                    ), //next
                  ],
                ),
              ),
              FutureBuilder(
                future: getCircle(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final circleData =
                        snapshot.data as Map<int?, WorkoutListModel?>;
                    final wol = circleData[currentCircularDisplayIndex];
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 16),
                      child: (wol == null)
                          ? Text(
                              WorkoutReportRemainingTimesMessage.noWorkout,
                              style: TextStyle(
                                fontFamily: "Noto Sans Thai",
                                fontSize:
                                    ResponsiveCheckWidget.isSmallMobile(context)
                                        ? 14
                                        : 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF9BA4B5),
                              ),
                            )
                          : (wol.remaining_times == 0)
                              ? Text(
                                  WorkoutReportRemainingTimesMessage.congrads,
                                  style: TextStyle(
                                    fontFamily: "Noto Sans Thai",
                                    fontSize:
                                        ResponsiveCheckWidget.isSmallMobile(
                                                context)
                                            ? 14
                                            : 16,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF9BA4B5),
                                  ),
                                )
                              : isBeforeToday(wol.date)
                                  ? Text(
                                      "ในวันนี้คุณทำไป ${(wol.total_times ?? 0) - (wol.remaining_times ?? 0)} ครั้ง",
                                      style: TextStyle(
                                        fontFamily: "Noto Sans Thai",
                                        fontSize:
                                            ResponsiveCheckWidget.isSmallMobile(
                                                    context)
                                                ? 14
                                                : 16,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF9BA4B5),
                                      ),
                                    )
                                  : Text(
                                      'วันนี้คุณเหลือบริหารอีก ${wol.remaining_times} ครั้ง',
                                      style: TextStyle(
                                        fontFamily: "Noto Sans Thai",
                                        fontSize:
                                            ResponsiveCheckWidget.isSmallMobile(
                                                    context)
                                                ? 14
                                                : 16,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF9BA4B5),
                                      ),
                                    ),
                    );
                  }
                  return Text('loading...');
                },
              ),
              TextWithStartIconWidget(
                  startIcon: Icon(
                    Icons.directions_run_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  topicName: 'ชุดท่าบริหาร',
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF484D56),
                  )),
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 16),
                child: ButtonWithiconWidget(
                    onTap: () async {
                      await Navigator.push(
                          context,
                          pageRoutes.workout
                              .infooflistworkout(widget.workoutList)
                              .route(context));
                      await refreshWorkoutListModel();
                      setState(() {});
                    },
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    color: Color(0xFFD7E0F5),
                    icon: Icons.arrow_right_rounded,
                    colorText: Color(0xFF6285D7),
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 12),
                    text: 'บริหารทั้งหมด ${widget.workoutList?.totalTime}',
                    radius: 16,
                    shadows: [
                      BoxShadow(
                        color: Color.fromARGB(24, 141, 52, 52),
                        blurRadius: 4,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      )
                    ],
                    iconcolor: Color(0xff6285D7),
                    sizeIcon: 48,
                    side: BorderSide.none),
              ),
              TextWithStartIconWidget(
                  startIcon: Icon(
                    Icons.calendar_month_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  topicName: 'ตั้งแจ้งเตือนสำหรับบริหาร',
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF484D56),
                  )),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: ButtonWithiconWidget(
                  onTap: () {
                    Navigator.push(context,
                        pageRoutes.workout.schdulepage().route(context));
                  },
                  mainAxisAlignment: MainAxisAlignment.center,
                  text: 'ตั้งแจ้งเตือน',
                  radius: 8,
                  side: BorderSide(
                      width: 1, color: Theme.of(context).colorScheme.primary),
                  icon: Icons.access_time_rounded,
                  iconcolor: Theme.of(context).colorScheme.primary,
                  colorText: Theme.of(context).colorScheme.primary,
                ),
              )
            ]);
      },
    );
  }

  double percentageDone(WorkoutListModel? wol) {
    final result = (wol == null ||
            wol.total_times == 0 ||
            wol.total_times == null)
        ? 0.0
        : (wol.total_times! - (wol.remaining_times ?? 0.0)) / wol.total_times!;
    if (result > 1) {
      return 1;
    }
    return result;
  }

  handleSelectDate(DateTime date) {
    setState(() {
      currentSelectingDate = date;
      currentCircularDisplayIndex = indexOfWeek(date);
    });
  }

  int indexOfWeek(DateTime? date) {
    final week = createWeekDateList(date ?? DateTime.now());
    return week
            .where((element) => isSameDay(element, date ?? DateTime.now()))
            .toList()
            .first
            .weekday -
        1;
  }

  Future<Map<int?, WorkoutListModel?>> getCircle() async {
    if (getWorkoutListModelsCache == null) {
      getWorkoutListModelsCache = await workoutListDb
          .getWorkoutListByTitle(widget.workoutList?.titleCode ?? '');
    }

    final Map<int?, WorkoutListModel?> circle = mapWorkoutListForBrowsingWeek(
        getWorkoutListModelsCache!)(currentSelectingDate);
    return circle;
  }

  Future<Map<int?, WorkoutListModel?>> refreshWorkoutListModel() async {
    getWorkoutListModelsCache = await workoutListDb
        .getWorkoutListByTitle(widget.workoutList?.titleCode ?? '');
    final Map<int?, WorkoutListModel?> circle = mapWorkoutListForBrowsingWeek(
        getWorkoutListModelsCache!)(currentSelectingDate);
    return circle;
  }

  isBeforeToday(DateTime? date) {
    if (date == null) return false;
    final today = DateTime.now();
    return date.isBefore(DateTime(today.year, today.month, today.day));
  }
}

abstract class WorkoutReportRemainingTimesMessage {
  static const String congrads = 'ยินดีด้วยคุณบริหารร่างกายเสร็จสิ้น';
  static const String noWorkout = 'คุณไม่มีชุดท่าบริหารในวันนี้';
}
