import 'dart:async';

import 'package:flutter/material.dart';

import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/show_dialog_widget.dart';
import 'package:unwind_app/Widgets/soud_widget.dart';

import 'package:unwind_app/Widgets/workoutlist-widget/circular_countdown_timer_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/next_workout_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/prepare_workout_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/workout_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:unwind_app/pages/loading_page.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

// enum TtsState { playing, stopped, paused, continued }

class _WorkoutPageState extends State<WorkoutPage> {
  static bool isVolumn = true;
  static final int _duration = 10;
  static final CountDownController _controller = CountDownController();
  late int duration = _duration;

  static int index = 0;

  final PageRoutes pageRoutes = PageRoutes();
  static bool onPressed = true;

  String? _newVoiceText;
  late TtsManager ttsManager;
  bool isLoding = true;

  // late FlutterTts flutterTts;
  // String language = 'th-TH';
  // String? engine;
  // double volume = 0.5;
  // double pitch = 1.0;
  // double rate = 0.6;

  // TtsState ttsState = TtsState.stopped;

  // get isPlaying => ttsState == TtsState.playing;
  // get isStopped => ttsState == TtsState.stopped;
  // get isPaused => ttsState == TtsState.paused;
  // get isContinued => ttsState == TtsState.continued;

  // bool get isIOS => !kIsWeb && Platform.isIOS;
  // bool get isAndroid => !kIsWeb && Platform.isAndroid;
  // bool get isWindows => !kIsWeb && Platform.isWindows;
  // bool get isWeb => kIsWeb;

  @override
  initState() {
    super.initState();
    init();
  }

  void init() {
    ttsManager = TtsManager();
    setState(() {
      isLoding = false;
    });
  }

  // initTts() {
  //   flutterTts = FlutterTts();

  //   _setAwaitOptions();

  //   if (isAndroid) {
  //     _getDefaultEngine();
  //     _getDefaultVoice();
  //   }

  //   flutterTts.setStartHandler(() {
  //     setState(() {
  //       print("Playing");
  //       ttsState = TtsState.playing;
  //     });
  //   });

  //   if (isAndroid) {
  //     flutterTts.setInitHandler(() {
  //       setState(() {
  //         print("TTS Initialized");
  //       });
  //     });
  //   }

  //   flutterTts.setCompletionHandler(() {
  //     setState(() {
  //       print("Complete");
  //       ttsState = TtsState.stopped;
  //     });
  //   });

  //   flutterTts.setCancelHandler(() {
  //     setState(() {
  //       print("Cancel");
  //       ttsState = TtsState.stopped;
  //     });
  //   });

  //   flutterTts.setPauseHandler(() {
  //     setState(() {
  //       print("Paused");
  //       ttsState = TtsState.paused;
  //     });
  //   });

  //   flutterTts.setContinueHandler(() {
  //     setState(() {
  //       print("Continued");
  //       ttsState = TtsState.continued;
  //     });
  //   });

  //   flutterTts.setErrorHandler((msg) {
  //     setState(() {
  //       print("error: $msg");
  //       ttsState = TtsState.stopped;
  //     });
  //   });
  // }

  // Future _getDefaultEngine() async {
  //   var engine = await flutterTts.getDefaultEngine;
  //   if (engine != null) {
  //     print(engine);
  //   }
  // }

  // Future _getDefaultVoice() async {
  //   var voice = await flutterTts.getDefaultVoice;
  //   if (voice != null) {
  //     print(voice);
  //   }
  // }

  // Future _speak() async {
  //   await flutterTts.setVolume(volume);
  //   await flutterTts.setSpeechRate(rate);
  //   await flutterTts.setPitch(pitch);
  //   await flutterTts.setLanguage(language);

  //   if (_newVoiceText != null) {
  //     if (_newVoiceText!.isNotEmpty) {
  //       await flutterTts.speak(_newVoiceText!);
  //     }
  //   }
  // }

  // Future _setAwaitOptions() async {
  //   await flutterTts.awaitSpeakCompletion(true);
  // }

  // Future _stop() async {
  //   var result = await flutterTts.stop();
  //   if (result == 1) setState(() => ttsState = TtsState.stopped);
  // }

  // Future _pause() async {
  //   var result = await flutterTts.pause();
  //   if (result == 1) setState(() => ttsState = TtsState.paused);
  // }

  @override
  void dispose() {
    super.dispose();
  }

  void btnTime(bool onPressed) {
    if (onPressed) {
      _controller.resume();
    } else if (!onPressed) {
      _controller.pause();
    }
  }

  final List<String>? fullPaths = [
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-1.png',
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-2.png',
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-3.png',
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-4.png',
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-5.png',
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-6.png',
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-7.png',
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-8.png',
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-9.png',
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      PrepareWorkoutWidget(
          assetName: 'lib/assets/images/workout/prepare/prepare.png'),
      WorkoutWidget(
        name: 'ท่าเอนคอ',
        fullPaths: fullPaths,
        duration: _duration,
        onReadyToPlay: (_imageSequenceAnimator) async {
          if (_controller.isRestarted == true) {
            await Future.delayed(Duration(seconds: 2));
            _imageSequenceAnimator.play();
          }
        },
      ),
      NextWorkoutWidget(
        name: 'ท่าดันต้าน',
        time: 20,
        descrip: 'เพิ่มความแข็งแรงบริเวณคอ',
        assetName: 'lib/assets/images/workout/prepare/prepare.png',
      ),
    ];

    return isLoding
        ? LoadingPage()
        : AppscreenTheme(
            colorBar: Colors.transparent,
            iconButtonStart: IconButton(
                highlightColor: Colors.transparent,
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () {
                  setState(() {
                    onPressed = !onPressed;
                    btnTime(onPressed);
                  });
                  alertDialog.getshowDialog(
                      context, 'ยกเลิกการบริหารใช่หรือไม่ ?', null, () {
                    Navigator.of(context).pop();
                    _controller.resume();
                    setState(() {
                      onPressed = !onPressed;
                    });
                  }, () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    _controller.reset();
                    index = 0;
                  });
                  _controller.pause();
                },
                color: Theme.of(context).colorScheme.primary),
            iconButtonEnd: IconButton(
              onPressed: () {
                setState(() {
                  isVolumn = !isVolumn;
                  btnTime(isVolumn);
                });
              },
              icon: isVolumn
                  ? Icon(Icons.volume_up_rounded)
                  : Icon(Icons.volume_off_rounded),
              color: Colors.white,
              iconSize: 20,
              alignment: Alignment.center,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFD7DAE1)),
                  shape: MaterialStateProperty.all(OvalBorder()),
                  minimumSize: MaterialStateProperty.all(Size(30, 30))),
            ),
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                IndexedStack(
                  index: index,
                  children: [..._widgetOptions],
                ),
                CircularCountdownTimerWidget(
                  duration: _duration,
                  controller: _controller,
                  onComplete: () {
                    setState(() {
                      if (index == _widgetOptions.length - 1) {
                        index = 0;
                      } else {
                        index += 1;
                      }
                      _controller.restart(duration: _duration);
                      duration = _duration;
                    });
                  },
                  onChange: (value) {
                    if (_newVoiceText != value) {
                      _newVoiceText = value;
                      ttsManager.speak(_newVoiceText);
                      // _speak();
                    }
                  },
                ),
              ]);
  }
}
