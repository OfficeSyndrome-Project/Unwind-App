import 'package:flutter/material.dart';

import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withicon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/event_box_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:unwind_app/globals/theme/table_calender_theme.dart';

import '../../Widgets/utils.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({Key? key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final PageRoutes pageRoutes = PageRoutes();
  late ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        TableCalendar(
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: _calendarFormat,
          calendarBuilders: CalendarBuilders(),
          eventLoader: _getEventsForDay,
          startingDayOfWeek: StartingDayOfWeek.monday,
          availableGestures: AvailableGestures.horizontalSwipe,
          locale: 'th_TH',
          headerStyle: TableCalendarTheme().headerStyle(),
          daysOfWeekStyle: TableCalendarTheme().daysOfWeekStyle(),
          calendarStyle: TableCalendarTheme().calendarStyle(context),
          onDaySelected: _onDaySelected,
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
            _selectedEvents.value = _getEventsForDay(_selectedDay!);
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
                    time: value[index].times.hour.toString().padLeft(2, '0') +
                        ':' +
                        value[index].times.minute.toString().padLeft(2, '0'),
                    onTap: () {
                      Navigator.push(context,
                          pageRoutes.workout.infoschedulepage().route(context));
                      print('${value[index]}');
                    },
                  );
                },
              );
            },
          ),
        ),
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
            onTap: () {
              Navigator.push(
                  context, pageRoutes.workout.setschedulepage().route(context));
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
