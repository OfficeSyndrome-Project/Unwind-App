import 'dart:async';
import 'package:flutter/material.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class TestAnimate extends StatefulWidget {
  const TestAnimate({super.key});

  @override
  State<TestAnimate> createState() => _TestAnimateState();
}

class _TestAnimateState extends State<TestAnimate>
    with SingleTickerProviderStateMixin {
  final List<String> images = [
    "https://media.discordapp.net/attachments/1085750012690055258/1197958847860572210/IMG_8389.png?ex=65bd291e&is=65aab41e&hm=a44cbe645788fc42af5b63235a46876caebba024294ad7d80f6cb9d1ed20bcac&=&format=webp&quality=lossless&width=662&height=662",
    "https://media.discordapp.net/attachments/1085750012690055258/1197958848246452275/IMG_8390.png?ex=65bd291e&is=65aab41e&hm=d957bf0248c71a342d057918b34dae64c39f0ef1fad58768b1f9c9bb750e1be4&=&format=webp&quality=lossless&width=662&height=662",
    "https://media.discordapp.net/attachments/1085750012690055258/1197958848670093332/IMG_8391.png?ex=65bd291e&is=65aab41e&hm=dfa07a03f4124d0ac9213668621c7e099e2e4bf0db0a90f1f65ed60927937460&=&format=webp&quality=lossless&width=662&height=662",
    "https://media.discordapp.net/attachments/1085750012690055258/1197958849001422979/IMG_8392.png?ex=65bd291e&is=65aab41e&hm=2ec0751a64efa9c2e57cea3b7315cf439098fe054ac344abf6c7278169ee0deb&=&format=webp&quality=lossless&width=662&height=662",
    "https://media.discordapp.net/attachments/1085750012690055258/1197958849341182074/IMG_8393.png?ex=65bd291e&is=65aab41e&hm=b6af0d0d594f2888b84113e36fafdf04bcea568b73d6e1a87493b9f6ea6dbb83&=&format=webp&quality=lossless&width=662&height=662",
    "https://media.discordapp.net/attachments/1085750012690055258/1197958849680900207/IMG_8394.png?ex=65bd291e&is=65aab41e&hm=d8617ecaf6976ee6424e3c552ba2ab27bb112cef275aa50ce6c0cc1d21c99972&=&format=webp&quality=lossless&width=662&height=662",
    "https://media.discordapp.net/attachments/1085750012690055258/1197958850070974495/IMG_8395.png?ex=65bd291e&is=65aab41e&hm=045b3c11055ce4d5399b063bec069dbdbb895072d42b259b1d91020905c34f3e&=&format=webp&quality=lossless&width=662&height=662",
  ];

  final int duration = 500;
  final int repeat = 3;
  final int eachSetDuration = 10;

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
    setState(() {
      if (currentIndex < images.length - 1)
        currentIndex += 1;
      else {
        currentIndex = 0;
        isDone = true;
      }
    });
  }

  void startTimer() {
    if (currentIndex < images.length && !isDone) {
      timer = Timer(Duration(milliseconds: duration), () {
        onNext();
        startTimer();
      });
    } else {
      print("All timers completed!");
    }
  }

  void startSetTimer() {
    if (currentRepeat < repeat) {
      setTimer = Timer(Duration(seconds: eachSetDuration), () {
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
    return AppscreenTheme(
        textBar: "Test Animate",
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: NetworkImage(images[currentIndex]),
            width: 500,
            height: 500,
          ),
        ]);
  }
}
