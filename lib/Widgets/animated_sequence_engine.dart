import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/stack_image_widget.dart';
import 'package:unwind_app/services/tts_manager_service.dart';

class AnimatedSequenceEngine extends StatefulWidget {
  AnimatedSequenceEngine({
    super.key,
    required this.times,
    required this.durationPerTimeInSeconds,
    required this.animationPaths,
    required this.animationController,
    required this.repetition,
    this.holdLastFrame = false,
    this.ttsManager,
  }) : assert(animationPaths.isNotEmpty);
  final int times;
  final int durationPerTimeInSeconds;
  final List<String> animationPaths;
  final AnimatedSequenceController animationController;
  final int repetition;
  final bool holdLastFrame;
  final TtsManager? ttsManager;

  @override
  State<AnimatedSequenceEngine> createState() => _AnimatedSequenceEngineState();
}

class _AnimatedSequenceEngineState extends State<AnimatedSequenceEngine> {
  List<String> get listPath => widget.animationPaths;
  bool get holdLastFrame => widget.holdLastFrame;
  AnimatedSequenceController get animationController =>
      widget.animationController;
  @override
  void initState() {
    super.initState();
    if (animationController.status == AnimatedSequenceStatus.started) {
      startAnimation();
    }
  }

  void setFrame(int frameIndex) {
    setState(() {
      animationController.currentAnimationFrame = frameIndex;
    });
  }

  void nextFrame() {
    if (holdLastFrame &&
        animationController.currentAnimationFrame == listPath.length - 1) {
      return;
    }
    setFrame((animationController.currentAnimationFrame + 1) % listPath.length);
  }

  void resetFrame() {
    setState(() {
      animationController.currentAnimationFrame = 0;
    });
  }

  Future<void> startAnimation() async {
    if (animationController.currentAnimationFrame >= listPath.length - 1) {
      animationController.repitition += 1;
    }
    if (animationController.repitition >= widget.repetition) {
      // Animation ends here
      animationController.status = AnimatedSequenceStatus.stopped;
      return;
    }
    await Future.delayed(
      Duration(
        milliseconds: 1000 *
            (widget.durationPerTimeInSeconds) ~/
            widget.animationPaths.length,
      ),
    );
    if (animationController.status == AnimatedSequenceStatus.stopped) return;
    if (animationController.status == AnimatedSequenceStatus.paused) return;
    // print(
    //     '--- requesting for next frame: frame ${animationController.currentAnimationFrame + 1 % listPath.length}');
    if (!mounted) return;
    nextFrame();
    return await startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return StackImageWidget(
        listPath: listPath,
        currentIndex: animationController.currentAnimationFrame);
  }
}

enum AnimatedSequenceStatus {
  started,
  paused,
  stopped,
}

class AnimatedSequenceController {
  int currentAnimationFrame;
  int repitition = 0;
  AnimatedSequenceStatus status = AnimatedSequenceStatus.started;
  AnimatedSequenceController({
    this.currentAnimationFrame = 0,
  });

  void setFrame(int frameIndex) {
    currentAnimationFrame = frameIndex;
  }

  void nextFrame() {
    currentAnimationFrame = (currentAnimationFrame + 1);
  }

  void resetFrame() {
    currentAnimationFrame = 0;
  }
}
