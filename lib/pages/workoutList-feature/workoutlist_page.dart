import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withicon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/workout_box_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class WorkoutListPage extends StatelessWidget {
  WorkoutListPage({super.key});

  static PageRoutes pageRoute = PageRoutes();

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        textBar: "ชุดท่าบริหาร",
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WorkoutBoxWidget(
                  onTap: () {
                    Navigator.push(context,
                        pageRoute.workout.reportworkoutpage().route(context));
                  },
                  workoutName: 'ชุดท่าบริหารคอ',
                  numberWorkout: '4 ชุดท่า',
                  time: '2 นาที',
                  assetName: 'lib/assets/images/screeningPart/neck.png')
            ],
          )),
          TextWithStartIconWidget(
              startIcon: Icon(
                Icons.help_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              topicName: 'มีอาการปวดที่จุดอื่น',
              style: TextStyle(
                fontFamily: "Noto Sans Thai",
                fontSize:
                    ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF484D56),
              )),
          SizedBox(
            height: 16,
          ),
          ButtonWithiconWidget(
            onTap: () {},
            mainAxisAlignment: MainAxisAlignment.center,
            text: 'ตรวจอีกครั้ง',
            radius: 8,
            side: BorderSide(
                width: 1, color: Theme.of(context).colorScheme.primary),
            icon: Icons.refresh,
            iconcolor: Theme.of(context).colorScheme.primary,
            colorText: Theme.of(context).colorScheme.primary,
          )
        ]);
  }
}
