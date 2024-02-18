import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/pages/workoutList-feature/nrs_after_and_before_page.dart';

class StartWorkoutButton extends StatelessWidget {
  final WorkoutListData workoutList;
  final bool disabled;
  final String text;
  const StartWorkoutButton({
    super.key,
    required this.pageRoutes,
    required this.workoutList,
    this.text = 'เริ่มกายบริหาร',
    this.disabled = false,
  });

  final PageRoutes pageRoutes;

  @override
  Widget build(BuildContext context) {
    return ButtonWithoutIconWidget(
      onTap: () {
        if (disabled) return;
        Navigator.push(
            context,
            pageRoutes.workout
                .nrsafterandbeforeworkout(workoutList, NrsType.before)
                .route(context));
      },
      text: text,
      radius: 32,
      width: double.infinity,
      height: ResponsiveCheckWidget.isSmallMobile(context) ? 48 : 52,
      color:
          disabled ? Color(0xFFD7DBE1) : Theme.of(context).colorScheme.primary,
      borderSide: BorderSide.none,
      style: ResponsiveCheckWidget.isSmallMobile(context)
          ? TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: disabled
                  ? Color(0xFF9BA4B5)
                  : Theme.of(context).colorScheme.onPrimary,
            )
          : TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: disabled
                  ? Color(0xFF9BA4B5)
                  : Theme.of(context).colorScheme.onPrimary,
            ),
    );
  }
}
