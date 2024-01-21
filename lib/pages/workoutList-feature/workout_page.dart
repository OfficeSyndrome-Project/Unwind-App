import 'package:flutter/material.dart';

import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/show_dialog_widget.dart';

import 'package:unwind_app/Widgets/workoutlist-widget/circular_countdown_timer_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/next_workout_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/prepare_workout_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/workout_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  static bool isVolumn = true;
  static final int _duration = 10;
  static final CountDownController _controller = CountDownController();

  static int index = 0;

  final PageRoutes pageRoutes = PageRoutes();

  static bool onPressed = true;

  void btnTime(bool onPressed) {
    if (onPressed) {
      _controller.start();
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

    return AppscreenTheme(
        colorBar: Colors.transparent,
        iconButtonStart: IconButton(
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              setState(() {
                onPressed = !onPressed;
                btnTime(onPressed);
              });
              alertDialog.getshowDialog(context, 'ยกเลิกการบริหารใช่หรือไม่ ?',
                  () {
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
              });
            },
            onChange: (String value) {
              // speak(value);

              debugPrint('Countdown Changed $value');
            },
          ),
        ]);
  }
}
