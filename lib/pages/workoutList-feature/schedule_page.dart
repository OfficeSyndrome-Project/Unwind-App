import 'package:flutter/material.dart';

import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withicon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/event_box_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:unwind_app/globals/theme/table_calender_theme.dart';
import 'package:unwind_app/pages/loading_page.dart';

import 'package:unwind_app/services/schedule-service/schedule_service.dart';

import '../../services/schedule-service/utils.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({Key? key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final PageRoutes pageRoutes = PageRoutes();
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = getDateTimeToday();
  DateTime? _selectedDay;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay; //เปลี่ยนตรงนี้เป็น selectday จากวันที่เลือกมา
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    initKEvent();

    // ScheduleService.removeEvent(0, DateTime.parse('2024-02-07 00:00:00.000'));
  }

  void initKEvent() async {
    await ScheduleService.loadkEvents();

    setState(() {
      isLoading = false;
    });
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return ScheduleService.kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
    updateSelectedEvents(selectedDay);
  }

  void updateSelectedEvents(DateTime selectedDay) {
    _selectedEvents.value = _getEventsForDay(selectedDay);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading)
      return LoadingPage(
        isShowNavbar: false,
      );
    return AppscreenTheme(
      iconButtonStart: IconButton(
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white),
      textBar: pageRoutes.workout.schdulepage().title,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TableCalendar<Event>(
          firstDay: ScheduleService.kFirstDay,
          lastDay: ScheduleService.kLastDay,
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: _calendarFormat,
          calendarBuilders: CalendarBuilders(),
          eventLoader: _getEventsForDay,
          startingDayOfWeek: StartingDayOfWeek.monday,
          availableGestures: AvailableGestures.horizontalSwipe,
          locale: 'th_TH',
          rowHeight: ResponsiveCheckWidget.isMediumMobile(context) ? 40 : 52,
          headerStyle: TableCalendarTheme().headerStyle(),
          daysOfWeekStyle: TableCalendarTheme().daysOfWeekStyle(),
          calendarStyle: TableCalendarTheme().calendarStyle(context),
          onDaySelected: _onDaySelected,
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        const SizedBox(height: 16.0),
        TextWithStartIconWidget(
          startIcon: Icon(
            Icons.directions_run,
            color: Theme.of(context).colorScheme.primary,
          ),
          topicName: 'ชุดท่าบริหาร',
          style: TextStyle(
            color: Color(0xFF484D56),
            fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
            fontFamily: 'Noto Sans Thai',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 8,
                ),
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return EventBoxWidget(
                    eventName: '${value[index]}',
                    time: value[index].times,
                    onTap: () async {
                      await Navigator.push(
                          context,
                          pageRoutes.workout
                              .infoschedulepage(index, value, _selectedDay!)
                              .route(context));
                      _onDaySelected(_selectedDay!, _focusedDay);
                    },
                  );
                },
              );
            },
          ),
        ),
        SizedBox(height: 16.0),
        TextWithStartIconWidget(
          startIcon: Icon(
            Icons.access_alarm_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
          topicName: 'ตั้งแจ้งเตือน',
          style: TextStyle(
            color: Color(0xFF484D56),
            fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
            fontFamily: 'Noto Sans Thai',
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: ButtonWithiconWidget(
            onTap: () async {
              final result = await Navigator.push(
                  context, pageRoutes.workout.setschedulepage().route(context));
              if (result != null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline_rounded,
                        color: Color(0xff40ad97),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'ตั้งแจ้งเตือนเสร็จสิ้น',
                        style: TextStyle(
                          fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                              ? 14
                              : 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff484d56),
                        ),
                      )
                    ],
                  ),
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height - 150,
                      left: 24,
                      right: 24),
                  duration: Duration(milliseconds: 1000),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  behavior: SnackBarBehavior.floating,
                ));
                _onDaySelected(result, result);
              }
            },
            mainAxisAlignment: MainAxisAlignment.center,
            text: 'ตั้งเวลา',
            radius: 8,
            side: BorderSide(
                width: 1, color: Theme.of(context).colorScheme.primary),
            icon: Icons.access_time_rounded,
            iconcolor: Theme.of(context).colorScheme.primary,
            colorText: Theme.of(context).colorScheme.primary,
          ),
        )
      ],
    );
  }
}
