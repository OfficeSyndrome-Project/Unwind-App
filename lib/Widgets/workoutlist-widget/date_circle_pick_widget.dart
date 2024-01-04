import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class DateCirclePickWidget extends StatelessWidget {
  final String date;
  final double percent;
  final void Function()? onTap;
  final bool onSelect;
  final bool isDone;
  const DateCirclePickWidget(
      {super.key,
      required this.date,
      required this.percent,
      this.onTap,
      required this.onSelect,
      required this.isDone});

  stateProgressColor(bool isDone) {
    if (isDone == true && !onSelect) {
      return Color(0xff9ba4b5);
    } else if (isDone == false && !onSelect) {
      return Color(0xff9ba4b5);
    } else if (isDone == true && onSelect) {
      return Color(0xFF6285D7);
    } else if (isDone == false && onSelect) {
      return Color(0xFF6285D7);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final bool onSelect = stateSelect;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: onSelect
                ? ShapeDecoration(color: Color(0xFFD7E0F5), shape: OvalBorder())
                : null,
            child: Text(
              date,
              style: TextStyle(
                fontFamily: "Noto Sans Thai",
                fontSize:
                    ResponsiveCheckWidget.isSmallMobile(context) ? 12 : 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF484D56),
              ),
            ),
          ),
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 4),
            child: CircularPercentIndicator(
                radius: 22,
                lineWidth: 9.5,
                circularStrokeCap: CircularStrokeCap.round,
                percent: percent,
                animation: false,
                backgroundColor: Color(0xFFebedf0),
                progressColor: stateProgressColor(isDone)),
          ),
        ],
      ),
    );
  }
}
