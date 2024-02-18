import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:unwind_app/Routes/routes_config.dart';

import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/services/schedule-service/utils.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/list_dropdown_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/select_box_widget.dart';

import 'package:unwind_app/Widgets/workoutlist-widget/time_wheeltile_widget.dart';

import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/Widgets/show_dialog_widget.dart';
import 'package:unwind_app/globals/theme/table_calender_theme.dart';
import 'package:unwind_app/services/schedule-service/schedule_service.dart';

class SetSchedulePage extends StatefulWidget {
  const SetSchedulePage({
    super.key,
  });

  @override
  _SetSchedulePageState createState() => _SetSchedulePageState();
}

class _SetSchedulePageState extends State<SetSchedulePage> {
  final PageRoutes pageRoutes = PageRoutes();

  WorkoutListData? selectWorkoutList;
  bool isTapCalender = false;
  bool isTapTime = false;

  DateTime _focusedDay = getDateTimeToday();
  DateTime? _selectedDay;
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  late Map<DateTime, List<Event>> events = {};

  bool isEdited = false;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  int currentHour = 0;
  int currentMinute = 0;

  void toggleCalender() {
    setState(() {
      isTapCalender = !isTapCalender;
      isTapTime = false;
      isEdited = true;
    });
  }

  void toggleTime() {
    setState(() {
      isTapTime = !isTapTime;
      isTapCalender = false;
      isEdited = true;
    });
  }

  String parseHoure() {
    final parseH = currentHour.toString().padLeft(2, '0');
    return parseH;
  }

  String parseMinute() {
    final parseM = currentMinute.toString().padLeft(2, '0');

    return parseM;
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return ScheduleService.kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  DateTime setSchedule() {
    final _setSchedule = DateTime(_selectedDay!.year, _selectedDay!.month,
        _selectedDay!.day, currentHour, currentMinute);

    return _setSchedule;
  }

  void onConfirm() {
    if (selectWorkoutList == null) {
      print('no selectWorkoutList');
      return;
    }

    List<Event> oldEvents = _getEventsForDay(_selectedDay!);

    ScheduleService.kEvents.addAll({
      _selectedDay!: [...oldEvents, Event(selectWorkoutList, setSchedule())]
    });
    // NotificationService.scheduleNotification(
    //   selectedDay: setSchedule(),
    //   title: 'Test title',
    //   body: 'hey!',
    //   id:
    // );

    ScheduleService.savekEvents();

    Navigator.pop(context, _selectedDay);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        isShowNavbar: false,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () async {
                  if (!isEdited) {
                    Navigator.pop(context);
                    return;
                  }
                  final result = await alertDialog.getshowDialog(
                      context, 'ยกเลิกการตั้ง Schedule ใช่หรือไม่ ?', null, () {
                    Navigator.pop(context, false);
                  }, () {
                    Navigator.pop(context, true);
                  });
                  if (result == true) {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: 72,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(
                      color: Color(0xFFC9635F),
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontFamily: 'Noto Sans Thai',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ButtonWithoutIconWidget(
                  onTap: () async {
                    if (!isEdited) {
                      return;
                    }
                    onConfirm();
                  },
                  text: 'ยืนยัน',
                  radius: 4,
                  width: 72,
                  height: 30,
                  color: Theme.of(context).colorScheme.primary,
                  borderSide: BorderSide.none,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontFamily: 'Noto Sans Thai',
                    fontWeight: FontWeight.w600,
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: TextWithStartIconWidget(
                startIcon: Icon(
                  Icons.directions_run_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                topicName: 'ชุดท่าบริหาร',
                style: TextStyle(
                  color: Color(0xFF484D56),
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  fontFamily: 'Noto Sans Thai',
                  fontWeight: FontWeight.w600,
                )),
          ),
          FutureBuilder(
            future:
                serviceLocator<WorkoutListDB>().getAvailableWorkoutListTitles(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.hasData) {
                final availableTitleCodes = snapshot.data as List<String>;
                final nameList = availableTitleCodes
                    .map((code) =>
                        WorkoutListData.workoutListFromTitleCode[code])
                    .where((element) => element != null)
                    .map((wol) => wol!)
                    .toList();
                return ListDropdownWidget(
                  nameList: nameList,
                  value: selectWorkoutList,
                  onChanged: (WorkoutListData? value) {
                    setState(() {
                      isEdited = true;
                      selectWorkoutList = value!;
                    });
                  },
                );
              }
              return Text("Loading...");
            },
          ),
          ResponsiveCheckWidget.isSmallMobile(context)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWithStartIconWidget(
                        startIcon: Icon(
                          Icons.calendar_month_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        topicName: 'วันที่',
                        style: TextStyle(
                          color: Color(0xFF484D56),
                          fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                              ? 14
                              : 16,
                          fontFamily: 'Noto Sans Thai',
                          fontWeight: FontWeight.w600,
                        )),
                    SelectBoxWidget(
                      name: DateFormat('dd MMMM ', 'th').format(_selectedDay!) +
                          DateFormat('yyyy', 'th')
                              .format(DateTime.utc(_selectedDay!.year + 543)),
                      width: double.infinity,
                      isTap: isTapCalender,
                      onTap: () {
                        toggleCalender();
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextWithStartIconWidget(
                        startIcon: Icon(
                          Icons.alarm_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        topicName: 'เวลา',
                        style: TextStyle(
                          color: Color(0xFF484D56),
                          fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                              ? 14
                              : 16,
                          fontFamily: 'Noto Sans Thai',
                          fontWeight: FontWeight.w600,
                        )),
                    SelectBoxWidget(
                      name: parseHoure() + ':' + parseMinute(),
                      width: double.infinity,
                      isTap: isTapTime,
                      onTap: () {
                        toggleTime();
                      },
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWithStartIconWidget(
                                startIcon: Icon(
                                  Icons.calendar_month_rounded,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                topicName: 'วันที่',
                                style: TextStyle(
                                  color: Color(0xFF484D56),
                                  fontSize: ResponsiveCheckWidget.isSmallMobile(
                                          context)
                                      ? 14
                                      : 16,
                                  fontFamily: 'Noto Sans Thai',
                                  fontWeight: FontWeight.w600,
                                )),
                            SelectBoxWidget(
                              name: DateFormat('dd MMMM ', 'th')
                                      .format(_selectedDay!) +
                                  DateFormat('yyyy', 'th').format(
                                      DateTime.utc(_selectedDay!.year + 543)),
                              width: double.infinity,
                              isTap: isTapCalender,
                              onTap: () {
                                toggleCalender();
                              },
                            ),
                          ],
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWithStartIconWidget(
                                startIcon: Icon(
                                  Icons.alarm_rounded,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                topicName: 'เวลา',
                                style: TextStyle(
                                  color: Color(0xFF484D56),
                                  fontSize: ResponsiveCheckWidget.isSmallMobile(
                                          context)
                                      ? 14
                                      : 16,
                                  fontFamily: 'Noto Sans Thai',
                                  fontWeight: FontWeight.w600,
                                )),
                            SelectBoxWidget(
                              name: parseHoure() + ':' + parseMinute(),
                              width: double.infinity,
                              isTap: isTapTime,
                              onTap: () {
                                toggleTime();
                              },
                            )
                          ],
                        ))
                  ],
                ),
          SizedBox(
            height: 16,
          ),
          isTapCalender == true
              ? Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 4,
                          offset: Offset(0, 1),
                          spreadRadius: 0,
                        )
                      ]),
                  child: TableCalendar(
                    focusedDay: _focusedDay,
                    firstDay: ScheduleService.kFirstDay,
                    lastDay: ScheduleService.kLastDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    calendarFormat: _calendarFormat,
                    locale: 'th_TH',
                    rowHeight: 40,
                    headerStyle: TableCalendarTheme().headerStyle(),
                    daysOfWeekStyle: TableCalendarTheme().daysOfWeekStyle(),
                    calendarStyle: TableCalendarTheme().calendarStyle(context),
                    onDaySelected: _onDaySelected,
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                )
              : SizedBox(),
          isTapTime == true
              ? TimeWheeltileWidget(
                  initHour: currentHour,
                  initMinute: currentMinute,
                  onSelectedItemChangedHour: (index) {
                    setState(() {
                      currentHour = index;
                    });
                  },
                  onSelectedItemChangedMinute: (index) {
                    setState(() {
                      currentMinute = index;
                    });
                  },
                )
              : SizedBox()
        ]);
  }
}
