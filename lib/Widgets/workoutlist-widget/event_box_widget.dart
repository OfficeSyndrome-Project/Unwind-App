import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class EventBoxWidget extends StatelessWidget {
  final String eventName;
  final String time;
  final void Function()? onTap;
  const EventBoxWidget(
      {super.key, required this.eventName, required this.time, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 4,
                height: 26,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    color: Color(0xFF3BB3E3)),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                eventName,
                style: TextStyle(
                  color: Color(0xFF484D56),
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  fontFamily: 'Noto Sans Thai',
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              time,
              style: TextStyle(
                color: Color(0xFF484D56),
                fontSize:
                    ResponsiveCheckWidget.isSmallMobile(context) ? 12 : 14,
                fontFamily: 'Noto Sans Thai',
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
