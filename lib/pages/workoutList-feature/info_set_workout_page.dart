import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class InfoSetWorkoutPage extends StatelessWidget {
  InfoSetWorkoutPage({super.key, this.workoutData});

  final WorkoutData? workoutData;
  final PageRoutes pageRoutes = PageRoutes();

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        vertical: ResponsiveCheckWidget.isSmallMobile(context) ? 0 : null,
        colorBar: Colors.transparent,
        iconButtonStart: IconButton(
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Theme.of(context).colorScheme.primary),
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RatioImageoneToOne(
                  assetName: '${workoutData?.thumbnailPath}',
                  smallWidth: 240,
                  largeWidth: 280,
                  smallHeight: 240,
                  largeHeight: 280),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    '${workoutData?.name}',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 16
                          : 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF636A75),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWithStartIconWidget(
                    startIcon: Icon(
                      Icons.calendar_month_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    topicName:
                        '${workoutData?.frequency} ${workoutData?.time} ครั้ง/เซต',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF636A75),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  TextWithStartIconWidget(
                    startIcon: Icon(
                      Icons.access_time_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    topicName: '${workoutData?.sec} วินาทีต่อเซต',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF636A75),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      '${workoutData?.step}',
                      style: TextStyle(
                        fontFamily: "Noto Sans Thai",
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF636A75),
                      ),
                    ),
                  ),
                  (workoutData?.caution != null)
                      ? Column(
                          children: [
                            SizedBox(height: 8),
                            Divider(color: Color(0xFFD7DAE1), thickness: 1),
                            SizedBox(height: 8),
                          ],
                        )
                      : Container(),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: (workoutData?.caution != null)
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.warning_rounded,
                                    color: const Color(0xFFFFCC00),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'ข้อควรระวัง',
                                    style: TextStyle(
                                      fontFamily: "Noto Sans Thai",
                                      fontSize:
                                          ResponsiveCheckWidget.isSmallMobile(
                                                  context)
                                              ? 14
                                              : 16,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF7F8795),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                '${workoutData?.caution}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                  fontFamily: "Noto Sans Thai",
                                  fontSize: ResponsiveCheckWidget.isSmallMobile(
                                          context)
                                      ? 14
                                      : 16,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xFF7F8795),
                                ),
                              )
                            ],
                          )
                        // ? TextWithStartIconWidget(
                        //     startIcon: Icon(
                        //       Icons.warning_rounded,
                        //       color: Theme.of(context).colorScheme.primary,
                        //     ),
                        //     topicName: '${workoutData?.caution}',
                        //     style: TextStyle(
                        //       fontFamily: "Noto Sans Thai",
                        //       fontSize: ResponsiveCheckWidget.isSmallMobile(
                        //               context)
                        //           ? 14
                        //           : 16,
                        //       fontWeight: FontWeight.w300,
                        //       color: const Color(0xFF636A75),
                        //     ),
                        //   )
                        : Container(),
                  ),
                ],
              ),
            ],
          )),
          ButtonWithoutIconWidget(
              onTap: () {
                Navigator.push(
                    context,
                    pageRoutes.workout
                        .nrsafterandbeforeworkout()
                        .route(context));
              },
              text: "เริ่มกายบริหาร",
              radius: 32,
              width: double.infinity,
              height: ResponsiveCheckWidget.isSmallMobile(context) ? 48 : 52,
              color: Theme.of(context).colorScheme.primary,
              borderSide: BorderSide.none,
              style: ResponsiveCheckWidget.isSmallMobile(context)
                  ? TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF),
                    )
                  : Theme.of(context).textTheme.headlineSmall),
        ]);
  }
}
