import 'package:flutter/material.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/frame_animation_widget.dart';

class WorkoutWidget extends StatelessWidget {
  final String name;
  final List<String>? fullPaths;
  final int duration;
  final void Function(ImageSequenceAnimatorState)? onReadyToPlay;
  const WorkoutWidget(
      {super.key,
      required this.name,
      required this.fullPaths,
      required this.duration,
      this.onReadyToPlay});

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
          FrameAnimation(
            fullPaths: fullPaths,
            duration: duration,
            onReadyToPlay: onReadyToPlay,
          ),
        ],
      ),
    );
  }
}
