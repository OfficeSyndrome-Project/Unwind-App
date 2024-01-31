import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/time_state_widget.dart';

class TimeWheeltileWidget extends StatefulWidget {
  final int initHour;
  final int initMinute;
  final void Function(int)? onSelectedItemChangedHour;
  final void Function(int)? onSelectedItemChangedMinute;
  const TimeWheeltileWidget(
      {super.key,
      this.onSelectedItemChangedHour,
      this.onSelectedItemChangedMinute,
      required this.initHour,
      required this.initMinute});

  @override
  _TimeWheeltileWidgetState createState() => _TimeWheeltileWidgetState();
}

class _TimeWheeltileWidgetState extends State<TimeWheeltileWidget> {
  late FixedExtentScrollController _controllerHour;
  late FixedExtentScrollController _controllerMinute;

  @override
  void initState() {
    super.initState();
    _controllerHour = FixedExtentScrollController(initialItem: widget.initHour);
    _controllerMinute =
        FixedExtentScrollController(initialItem: widget.initMinute);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: Opacity(
              opacity: 0.65,
              child: Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                    color: const Color(0xFFD7E0F5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
          ),
          Positioned(
            child: Center(
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 1.1,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowIndicator();
                    return true;
                  },
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.001,
                    diameterRatio: 1.6,
                    physics: const FixedExtentScrollPhysics(),
                    squeeze: 1.2,
                    controller: _controllerHour,
                    onSelectedItemChanged: widget.onSelectedItemChangedHour,
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 24,
                      builder: (context, index) {
                        return TimeStateWidget(textState: index);
                      },
                    ),
                  ),
                ),
              ),
              Text(
                ':',
                style: TextStyle(
                  color: Color(0xFF6285D7),
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  fontFamily: 'Noto Sans Thai',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                width: 70,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowIndicator();
                    return true;
                  },
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.001,
                    diameterRatio: 1.6,
                    physics: const FixedExtentScrollPhysics(),
                    squeeze: 1.2,
                    controller: _controllerMinute,
                    onSelectedItemChanged: widget.onSelectedItemChangedMinute,
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 60,
                      builder: (context, index) {
                        return TimeStateWidget(textState: index);
                      },
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
