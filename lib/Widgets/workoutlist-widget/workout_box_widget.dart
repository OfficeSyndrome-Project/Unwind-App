import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';

class WorkoutBoxWidget extends StatelessWidget {
  final String workoutName;
  final String numberWorkout;
  final String time;
  final String assetName;
  final void Function()? onTap;
  const WorkoutBoxWidget(
      {super.key,
      required this.workoutName,
      required this.numberWorkout,
      required this.time,
      required this.assetName,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 120,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 4,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    workoutName,
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF484D56),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWithStartIconWidget(
                            startIcon: Icon(
                              Icons.directions_run_rounded,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            topicName: numberWorkout + " ชุดท่า",
                            style: TextStyle(
                              fontFamily: "Noto Sans Thai",
                              fontSize:
                                  ResponsiveCheckWidget.isSmallMobile(context)
                                      ? 12
                                      : 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF636A75),
                            )),
                        SizedBox(
                          width: 24,
                        ),
                        TextWithStartIconWidget(
                            startIcon: Icon(
                              Icons.access_time_rounded,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            topicName: time,
                            style: TextStyle(
                              fontFamily: "Noto Sans Thai",
                              fontSize:
                                  ResponsiveCheckWidget.isSmallMobile(context)
                                      ? 12
                                      : 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF636A75),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            RatioImageoneToOne(
              assetName: assetName,
              smallWidth: 56,
              largeWidth: 56,
              smallHeight: 56,
              largeHeight: 56,
            ),
          ],
        ),
      ),
    );
  }
}
