import 'package:flutter/material.dart';

enum SoundFormat {
  WAV,
  MP3,
}

abstract class SoundService {
  void playSound({
    @required String soundName,
    @required SoundFormat soundFormat,
    double volume,
  });
  Future<void> playBackgroundMusic();
  Future<void> stopBackgroundMusic();
}
