import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class BoxResultsWorkout extends StatelessWidget {
  final String? name;
  final String? detail;
  final Duration? time;
  final String? imagePath;
  const BoxResultsWorkout({
    Key? key,
    required this.name,
    required this.detail,
    required this.time,
    required this.imagePath,
  }) : super(key: key);

  String formattedTime(int timeInSecond) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        // borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${name}',
                style: TextStyle(
                  fontFamily: "Noto Sans Thai",
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF484D56),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  detail ?? '',
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 12 : 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF636A75),
                  ),
                ),
              ),
              Text(
                (time == null) ? '' : formattedTime(time!.inSeconds),
                style: TextStyle(
                  fontFamily: "Noto Sans Thai",
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 12 : 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF3B67CD),
                ),
              ),
            ],
          ),
          RatioImageoneToOne(
              assetName: imagePath ?? '',
              smallWidth: 60,
              largeWidth: 80,
              smallHeight: 60,
              largeHeight: 80)
        ],
      ),
    );
  }
}
