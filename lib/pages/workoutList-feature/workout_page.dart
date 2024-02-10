import 'package:flutter/material.dart';

import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/show_dialog_widget.dart';
import 'package:unwind_app/Widgets/soud_widget.dart';

import 'package:unwind_app/Widgets/workoutlist-widget/circular_countdown_timer_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/next_workout_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/workout_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:unwind_app/pages/loading_page.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  static bool isVolumn = true;
  static final int _duration = 10;
  static final CountDownController _controller = CountDownController();
  late int duration = _duration;

  static int index = 0;

  final PageRoutes pageRoutes = PageRoutes();
  static bool onPressed = true;

  String? _newVoiceText;
  bool isLoding = true;

  @override
  initState() {
    super.initState();
    init();
    TtsManager.initTts();
  }

  void init() {
    setState(() {
      isLoding = false;
    });
  }

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

  final List<String> fullPaths = [
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
      // PrepareWorkoutWidget(
      //     assetName: 'lib/assets/images/workout/prepare/prepare.png'),
      WorkoutWidget(
        name: 'ท่าเอนคอ',
        fullPaths: fullPaths,
        eachSetDuration: _duration,
        repeat: 3,
      ),
      NextWorkoutWidget(
        name: 'ท่าดันต้าน',
        time: 20,
        descrip: 'เพิ่มความแข็งแรงบริเวณคอ',
        assetName: 'lib/assets/images/workout/prepare/prepare.png',
      ),
    ];

    return isLoding
        ? LoadingPage(
            isShowNavbar: false,
          )
        : AppscreenTheme(
            colorBar: Colors.transparent,
            iconButtonStart: IconButton(
                highlightColor: Colors.transparent,
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () async {
                  setState(() {
                    onPressed = !onPressed;
                    btnTime(onPressed);
                  });
                  final result = await alertDialog.getshowDialog(
                      context, 'ยกเลิกการบริหารใช่หรือไม่ ?', null, () {
                    Navigator.pop(context, false);
                    _controller.resume();
                    setState(() {
                      onPressed = !onPressed;
                    });
                  }, () {
                    Navigator.pop(context, true);
                    _controller.reset();
                    index = 0;
                  });
                  _controller.pause();
                  if (result == true) {
                    Navigator.pop(context);
                  }
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
                      // ttsManager.speak(_newVoiceText);
                      // _speak();
                    }
                  },
                ),
              ]);
  }
}
