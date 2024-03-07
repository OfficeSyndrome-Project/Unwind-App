import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/animate_sequence_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';

class PrepareWorkoutWidget extends StatelessWidget {
  // final String assetName;
  final WorkoutData workoutData;
  const PrepareWorkoutWidget({
    super.key,
    // required this.assetName,
    required this.workoutData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Text(
              'เตรียมพร้อมสำหรับการบริหาร !',
              style: TextStyle(
                fontFamily: "Noto Sans Thai",
                fontSize:
                    ResponsiveCheckWidget.isSmallMobile(context) ? 18 : 20,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF2C3036),
              ),
            ),
          ),
          AnimateSequenceWidget(
            listPath: workoutData.animationPaths ?? [],
            eachSetDuration: workoutData.sec,
            repeat: workoutData.time,
          ),
        ],
      ),
    );
  }
}
