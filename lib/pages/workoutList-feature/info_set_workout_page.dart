import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/box_help_what_point_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class InfoSetWorkoutPage extends StatelessWidget {
  InfoSetWorkoutPage({super.key});

  final PageRoutes pageRoutes = PageRoutes();
  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
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
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RatioImageoneToOne(
                  assetName: 'lib/assets/images/screeningPart/self_slumper.png',
                  smallWidth: 240,
                  largeWidth: 280,
                  smallHeight: 240,
                  largeHeight: 280),
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 8),
                child: Text(
                  'ชื่อท่า',
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 16 : 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF636A75),
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
                    topicName: 'ทำวันเว้นวัน',
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
                    topicName: '20 วินาทีต่อวัน',
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
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'รายละเอียดการทำ (ขั้นตอนการทำเช่น เงยคอค้างไว้ 20 วินาที)',
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF636A75),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BoxHelpWhatPointWidget(helpPoint: 'ช่วยส่วนหลัง');
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 8,
                        ),
                    itemCount: 3),
              )
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
