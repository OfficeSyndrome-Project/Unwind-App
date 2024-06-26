import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

enum TtsState { playing, stopped, paused, continued }

class TtsManager {
  TtsManager() {
    initTts();
  }
  final FlutterTts flutterTts = FlutterTts();
  String language = 'th-TH';
  double volume = 1.0;
  double pitch = 1.0;
  double rate = 0.5;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;

  Future<void> initTts() async {
    await _setAwaitOptions();
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.awaitSynthCompletion(true);

    if (isAndroid) {
      await _getDefaultEngine();
      await _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
      ttsState = TtsState.playing;
    });

    if (isAndroid) {
      flutterTts.setInitHandler(() {});
    }

    flutterTts.setCompletionHandler(() {
      ttsState = TtsState.stopped;
    });

    flutterTts.setCancelHandler(() {
      ttsState = TtsState.stopped;
    });

    flutterTts.setPauseHandler(() {
      ttsState = TtsState.paused;
    });

    flutterTts.setContinueHandler(() {
      ttsState = TtsState.continued;
    });

    flutterTts.setErrorHandler((msg) {
      ttsState = TtsState.stopped;
    });
  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {}
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {}
  }

  Future<void> setVolume(double _volume) async {
    await flutterTts.setVolume(_volume);
  }

  Future speak(String? text) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    await flutterTts.setLanguage(language);

    if (text!.isNotEmpty) {
      await flutterTts.speak(text);
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);

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

  Future stop() async {
    var result = await flutterTts.stop();
    if (result == 1) ttsState = TtsState.stopped;
  }

  Future pause() async {
    var result = await flutterTts.pause();
    if (result == 1) ttsState = TtsState.paused;
  }

  Future resume() async {
    ttsState = TtsState.continued;
  }

  Future<void> dispose() async {
    await flutterTts.stop();
  }
}
