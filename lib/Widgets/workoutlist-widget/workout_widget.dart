import 'package:flutter/material.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';
import 'package:unwind_app/Widgets/animate_sequence_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class WorkoutWidget extends StatelessWidget {
  final String name;
  final List<String> fullPaths;
  final int repeat;
  final int eachSetDuration;
  final void Function(ImageSequenceAnimatorState)? onReadyToPlay;
  const WorkoutWidget(
      {super.key,
      required this.name,
      required this.fullPaths,
      required this.eachSetDuration,
      this.onReadyToPlay,
      required this.repeat});

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
            listPath: fullPaths,
            eachSetDuration: eachSetDuration,
            repeat: repeat,
          )
        ],
      ),
    );
  }
}
