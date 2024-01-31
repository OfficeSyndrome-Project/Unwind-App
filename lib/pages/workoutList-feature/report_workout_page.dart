import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withicon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/date_circle_pick_widget.dart';
import 'package:unwind_app/data/workout-list-data/date_workout_mockup.dart';
import 'package:unwind_app/data/workout-list-data/workout_mockup.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class ReportWorkoutPage extends StatefulWidget {
  const ReportWorkoutPage({Key? key}) : super(key: key);

  @override
  State<ReportWorkoutPage> createState() => _ReportWorkoutPageState();
}

class _ReportWorkoutPageState extends State<ReportWorkoutPage> {
  static PageRoutes pageRoutes = PageRoutes();
  static List<DateWorkoutMockup> dateMockup = DateWorkoutMockup.getData();
  static List<WorkoutMockup> dataWorkout = WorkoutMockup.getData();
  // final  matchIndex = weekdays.indexOf(dateMockup.map((e) => e.day));

  static int defaultSelect = 0; // default on that day

  // static int lengthOfpercentNotEqualToZero =
  //     dateMockup.where((element) => element.percent != 0.0).length;
  static List<int> weekdays =
      dataWorkout.map((e) => e.workoutDate.weekday).toList();
  late int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    // double doubleToPercent = dateMockup[defaultSelect].percent * 100;
    // print('defaultSelect ${defaultSelect}');
    double doubleToPercent = dataWorkout[currIndex].percent * 100;
    int percentToIntCeli = doubleToPercent.ceil();
    // defaultSelect = currIndex;

    return AppscreenTheme(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        iconButtonStart: IconButton(
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
            // defaultSelect = currIndex;
            // defaultSelect = DateTime.now().weekday - 1;
          },
          color: Colors.white,
        ),
        textBar: pageRoutes.workout.reportworkoutpage().title,
        children: [
          Expanded(
              child: ListView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 16),
                child: Text(
                  DateFormat(
                        'd MMMM พ.ศ. ',
                        'th',
                      ).format(dataWorkout[currIndex].workoutDate) +
                      DateFormat('yyyy').format(DateTime.utc(
                          dataWorkout[currIndex].workoutDate.year + 543)),
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF484D56),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 24),
                // height: 80,
                child:
                    // CircleWithDate(percent, onSelect, isDone, () { })
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: dateMockup.asMap().entries.map((entry) {
                          final index = entry.key;
                          final data = entry.value;
                          final matchIndex = weekdays.indexOf(data.day);

                          return DateCirclePickWidget(
                            date: DateFormat('E', 'th').format(data.dateTime),
                            percent: dataWorkout[matchIndex].percent,
                            onSelect: dataWorkout[matchIndex].percent == 0.0
                                ? false
                                : index == defaultSelect,
                            isDone: dataWorkout[matchIndex].isDone,
                            onTap: () {
                              setState(() {
                                if (index != defaultSelect &&
                                    dataWorkout[matchIndex].percent != 0.0) {
                                  defaultSelect = index;
                                  currIndex = matchIndex;
                                }
                                // currIndex = matchIndex;
                              });
                            },
                          );
                        }).toList()),
              ),
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
                        setState(() {});
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
                    Container(
                      width: 212,
                      height: 212,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 4),
                      child: CircularPercentIndicator(
                          radius: 106,
                          lineWidth: 46,
                          circularStrokeCap: CircularStrokeCap.round,
                          percent: dataWorkout[currIndex].percent,
                          center: Container(
                            child: Text(
                              '${percentToIntCeli}%',
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
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {});
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
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 16),
                child: Text(
                  'วันนี้คุณเหลือบริหารคออีก 2 ครั้ง',
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF9BA4B5),
                  ),
                ),
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
                    onTap: () {
                      Navigator.push(
                          context,
                          pageRoutes.workout
                              .infooflistworkout()
                              .route(context));
                    },
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    color: Color(0xFFD7E0F5),
                    icon: Icons.arrow_right_rounded,
                    colorText: Color(0xFF6285D7),
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 12),
                    text: 'ชุดท่าที่ 1 บริหารคอ',
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
            ],
          ))
        ]);
  }
}
