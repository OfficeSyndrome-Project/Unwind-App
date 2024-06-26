import 'package:flutter/material.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';
import 'package:unwind_app/Widgets/animate_sequence_widget.dart';
import 'package:unwind_app/Widgets/animated_sequence_engine.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/services/tts_manager_service.dart';

class WorkoutWidget extends StatelessWidget {
  final TtsManager ttsManager;
  final String name;
  final WorkoutData workoutData;
  final int timeth; // timeth is the current time of WorkoutData.time
  final void Function(ImageSequenceAnimatorState)? onReadyToPlay;
  final AnimatedSequenceController animationController =
      AnimatedSequenceController();
  WorkoutWidget({
    super.key,
    required this.name,
    required this.timeth,
    required this.workoutData,
    required this.ttsManager,
    this.onReadyToPlay,
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
              name,
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
            ttsManager: ttsManager,
          ),
          Text('$timeth/${workoutData.time}',
              style: TextStyle(
                fontFamily: "Noto Sans Thai",
                fontSize:
                    ResponsiveCheckWidget.isSmallMobile(context) ? 18 : 20,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF2C3036),
              ))
        ],
      ),
    );
  }
}
