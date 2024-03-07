import 'package:flutter/material.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class FrameAnimation extends StatefulWidget {
  final List<String>? fullPaths;
  final int duration;
  final void Function(ImageSequenceAnimatorState)? onReadyToPlay;
  FrameAnimation(
      {super.key,
      required this.fullPaths,
      required this.duration,
      this.onReadyToPlay});

  @override
  State<FrameAnimation> createState() => _FrameAnimationState();
}

class _FrameAnimationState extends State<FrameAnimation> {
  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveCheckWidget.isSmallMobile(context) ? 320 : 380,
      height: ResponsiveCheckWidget.isSmallMobile(context) ? 320 : 380,
      child: ImageSequenceAnimator('', '', 0, 0, '', 0,
          fullPaths: widget.fullPaths,
          isAutoPlay: false,
          fps: 2, //frame in one sec
          isLooping: false,
          onReadyToPlay: widget.onReadyToPlay),
    );
  }
}
