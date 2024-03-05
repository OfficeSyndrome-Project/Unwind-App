import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class TableCalendarTheme {
  CalendarStyle calendarStyle(BuildContext context) {
    CalendarStyle _calendarStyle = CalendarStyle(
        defaultTextStyle: TextStyle(
          color: Color(0xFF2F52A4),
          fontSize: 16,
          fontFamily: 'Noto Sans Thai',
          fontWeight: FontWeight.w500,
        ),
        weekendTextStyle: TextStyle(
          color: Color(0xFF2F52A4),
          fontSize: 16,
          fontFamily: 'Noto Sans Thai',
          fontWeight: FontWeight.w500,
        ),
        // Use `CalendarStyle` to customize the UI

        outsideDaysVisible: true,
        outsideTextStyle: TextStyle(
          color: Color(0xFF9BA4B5),
          fontSize: 16,
          fontFamily: 'Noto Sans Thai',
          fontWeight: FontWeight.w500,
        ),
        cellAlignment: Alignment.center,
        selectedDecoration: ShapeDecoration(
          shape: CircleBorder(),
          color: Color(0xFFD7E0F5),
        ),
        selectedTextStyle: TextStyle(
          color: Color(0xFF2F52A4),
          fontSize: 16,
          fontFamily: 'Noto Sans Thai',
          fontWeight: FontWeight.w500,
        ),
        todayTextStyle: TextStyle(
          color: Colors.white,
          fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
          fontFamily: 'Noto Sans Thai',
          fontWeight: FontWeight.w500,
        ),
        todayDecoration: ShapeDecoration(
          shape: CircleBorder(),
          color: Color(0xFF6285d7),
        ),
        tablePadding: EdgeInsets.symmetric(horizontal: 16),
        canMarkersOverflow: false,
        markerDecoration: ShapeDecoration(
          shape: CircleBorder(),
          color: Color(0xFF3BB3E3),
        ),
        markersAlignment: Alignment.center,
        markersMaxCount: 4);

    return _calendarStyle;
  }

  DaysOfWeekStyle daysOfWeekStyle() {
    DaysOfWeekStyle _daysOfWeekStyle = DaysOfWeekStyle(
        weekendStyle: TextStyle(
          color: Color(0xFF484D56),
          fontSize: 14,
          fontFamily: 'Noto Sans Thai',
          fontWeight: FontWeight.w500,
        ),
        weekdayStyle: TextStyle(
          color: Color(0xFF484D56),
          fontSize: 14,
          fontFamily: 'Noto Sans Thai',
          fontWeight: FontWeight.w500,
        ));
    return _daysOfWeekStyle;
  }

  HeaderStyle headerStyle(BuildContext context) {
    HeaderStyle _headerStyle = HeaderStyle(
      headerPadding: EdgeInsets.only(bottom: 16),
      leftChevronMargin: ResponsiveCheckWidget.isSmallMobile(context)
          ? EdgeInsets.zero
          : EdgeInsets.only(left: 48),
      rightChevronMargin: ResponsiveCheckWidget.isSmallMobile(context)
          ? EdgeInsets.zero
          : EdgeInsets.only(right: 48),
      leftChevronPadding: EdgeInsets.all(4),
      rightChevronPadding: EdgeInsets.all(4),
      leftChevronIcon: Icon(
        Icons.arrow_back_ios_rounded,
        color: Color(0xff3b67cd),
      ),
      rightChevronIcon: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Color(0xff3b67cd),
      ),
      formatButtonVisible: false,
      titleCentered: true,
      titleTextStyle: TextStyle(
        color: Color(0xFF484D56),
        fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 16 : 18,
        fontFamily: 'Noto Sans Thai',
        fontWeight: FontWeight.w500,
      ),
      titleTextFormatter: (date, locale) {
        return DateFormat('MMMM พ.ศ. ', locale).format(date) +
            DateFormat('yyyy', locale).format(DateTime.utc(date.year + 543));
      },
    );
    return _headerStyle;
  }
}
