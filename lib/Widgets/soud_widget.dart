import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

enum TtsState { playing, stopped, paused, continued }

class TtsManager {
  static final FlutterTts flutterTts = FlutterTts();
  static String language = 'th-TH';
  static double volume = 0.5;
  static double pitch = 1.0;
  static double rate = 0.6;

  static TtsState ttsState = TtsState.stopped;

  static get isPlaying => ttsState == TtsState.playing;
  static get isStopped => ttsState == TtsState.stopped;
  static get isPaused => ttsState == TtsState.paused;
  static get isContinued => ttsState == TtsState.continued;

  static bool get isIOS => !kIsWeb && Platform.isIOS;
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
  static bool get isWindows => !kIsWeb && Platform.isWindows;
  static bool get isWeb => kIsWeb;

  static Future<void> initTts() async {
    await _setAwaitOptions();

    if (isAndroid) {
      await _getDefaultEngine();
      await _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
      print("Playing");
      ttsState = TtsState.playing;
    });

    if (isAndroid) {
      flutterTts.setInitHandler(() {
        print("TTS Initialized");
      });
    }

    flutterTts.setCompletionHandler(() {
      print("Complete");
      ttsState = TtsState.stopped;
    });

    flutterTts.setCancelHandler(() {
      print("Cancel");
      ttsState = TtsState.stopped;
    });

    flutterTts.setPauseHandler(() {
      print("Paused");
      ttsState = TtsState.paused;
    });

    flutterTts.setContinueHandler(() {
      print("Continued");
      ttsState = TtsState.continued;
    });

    flutterTts.setErrorHandler((msg) {
      print("error: $msg");
      ttsState = TtsState.stopped;
    });
  }

  static Future<void> _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  static Future<void> _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }

  static Future<void> speak(String? text) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    await flutterTts.setLanguage(language);

    if (text!.isNotEmpty) {
      await flutterTts.speak(text);
    }
  }

  static Future<void> _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  static Future<void> stop() async {
    var result = await flutterTts.stop();
    if (result == 1) ttsState = TtsState.stopped;
  }

  static Future<void> pause() async {
    var result = await flutterTts.pause();
    if (result == 1) ttsState = TtsState.paused;
  }

  void dispose() {
    flutterTts.stop();
  }
}
