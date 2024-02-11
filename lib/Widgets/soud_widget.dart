import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

enum TtsState { playing, stopped, paused, continued }

class TtsManager {
  static final FlutterTts flutterTts = FlutterTts();
  static String language = 'th-TH';
  // static double volume = 1.0;
  static double pitch = 1.0;
  static double rate = 0.5;

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
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.awaitSynthCompletion(true);

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

  static Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  static Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }

  static Future<void> setVolume(double _volume, {bool isVolume = true}) async {
    // volume = _volume;
    if (isVolume == false) {
      await flutterTts.setVolume(0.0);
    } else
      await flutterTts.setVolume(_volume);
  }

  static Future speak(String? text) async {
    // await flutterTts.setVolume(volume);
    // await setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    await flutterTts.setLanguage(language);

    if (text!.isNotEmpty) {
      await flutterTts.speak(text);
    }
  }

  static Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);

    // await flutterTts.setSharedInstance(true);
    await flutterTts.setIosAudioCategory(
        IosTextToSpeechAudioCategory.playback,
        [
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
          IosTextToSpeechAudioCategoryOptions.mixWithOthers,
          IosTextToSpeechAudioCategoryOptions.defaultToSpeaker
        ],
        IosTextToSpeechAudioMode.defaultMode);
  }

  static Future stop() async {
    var result = await flutterTts.stop();
    if (result == 1) ttsState = TtsState.stopped;
  }

  static Future pause() async {
    var result = await flutterTts.pause();
    if (result == 1) ttsState = TtsState.paused;
  }

  static Future<void> dispose() async {
    await flutterTts.stop();
  }
}
