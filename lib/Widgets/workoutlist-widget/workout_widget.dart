import 'package:flutter/material.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class WorkoutWidget extends StatelessWidget {
  final String name;
  final String assetName;
  const WorkoutWidget({super.key, required this.name, required this.assetName});

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
          // RatioImageoneToOne(
          //     assetName: assetName,
          //     smallWidth: 320,
          //     largeWidth: 380,
          //     smallHeight: 320,
          //     largeHeight: 380),
          FrameAnimation(),
        ],
      ),
    );
  }
}

class FrameAnimation extends StatelessWidget {
  const FrameAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 380,
      child: ImageSequenceAnimator(
        'lib/assets/images/workout/neck-shoulder/neckch03/tp-right',
        'TP-',
        1,
        0,
        'png',
        9,
        isAutoPlay: true,
        fps: 9,
        isLooping: true,
        onPlaying: (_imageSequenceAnimator) async {
          await Future.delayed(Duration(seconds: 1));
        },
      ),
    );
  }
}
