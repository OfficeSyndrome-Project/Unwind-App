import 'dart:async';
import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/stack_image_widget.dart';
import 'package:unwind_app/services/tts_manager_service.dart';

class AnimateSequenceWidget extends StatefulWidget {
  final List<String> listPath;
  final int repeat;
  final int eachSetDuration;
  final TtsManager? ttsManager;

  const AnimateSequenceWidget({
    super.key,
    required this.listPath,
    required this.repeat,
    required this.eachSetDuration,
    this.ttsManager,
  });

  @override
  State<AnimateSequenceWidget> createState() => _AnimateSequenceWidgetState();
}

class _AnimateSequenceWidgetState extends State<AnimateSequenceWidget>
    with SingleTickerProviderStateMixin {
  final int duration = 1000;

  late int currentIndex;
  late int currentRepeat;
  late Timer timer;
  late Timer setTimer;
  late bool isDone;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    currentRepeat = 0;
    isDone = false;
    startTimer();
    startSetTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    setTimer.cancel();
  }

  void onNext() {
    if (!mounted) return; // Fix for: setState() called after dispose()
    setState(() {
      if (currentIndex < widget.listPath.length - 1)
        currentIndex += 1;
      else {
        currentIndex = widget.listPath.length - 1;
        isDone = true;
      }
    });
  }

  void startTimer() {
    if (currentIndex < widget.listPath.length && !isDone) {
      timer = Timer(Duration(milliseconds: duration), () {
        onNext();
        startTimer();
      });
    } else {
      print("All timers completed!");
    }
  }

  void startSetTimer() {
    setState(() {
      currentIndex = 0;
    });
    if (currentRepeat < widget.repeat) {
      setTimer = Timer(Duration(seconds: widget.eachSetDuration), () {
        print("New set Begined!");
        setState(() {
          isDone = false;
          currentRepeat += 1;
        });
        startTimer();
        startSetTimer();
      });
    } else {
      print("All setTimers completed!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return StackImageWidget(
      listPath: widget.listPath,
      currentIndex: currentIndex,
    );
  }
}
