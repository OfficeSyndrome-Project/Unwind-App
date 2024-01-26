import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class BoxResultsWorkout extends StatelessWidget {
  final String? name;
  final String? detail;
  final Duration? time;
  const BoxResultsWorkout({
    Key? key,
    required this.name,
    required this.detail,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8)),
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
                  detail??'',
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
                '00 : ${time?.inSeconds.toString().padLeft(2, '0')}',
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
              assetName: 'lib/assets/images/screeningPart/self_slumper.png',
              smallWidth: 60,
              largeWidth: 80,
              smallHeight: 60,
              largeHeight: 80)
        ],
      ),
    );
  }
}
