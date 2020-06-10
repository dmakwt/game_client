import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:game_client/services/sounds/sound_service.dart';

class SoundServiceImpl implements SoundService {
  final backgroundPlayer = AssetsAudioPlayer();

  static checkSoundFormat(soundFormat) =>
      soundFormat == SoundFormat.WAV ? 'wav' : 'mp3';

  @override
  void playSound({
    @required soundName,
    @required SoundFormat soundFormat,
    double volume = 1,
  }) {
    final format = checkSoundFormat(soundFormat);

    AssetsAudioPlayer.playAndForget(
      Audio('assets/sounds/$soundName.$format'),
      volume: volume,
    );
    // await player.open(
    //   Audio('assets/sounds/$soundName.$format'),
    //   playInBackground: PlayInBackground.disabledPause,
    //   volume: volume,
    //   autoStart: true,
    // );
  }

  @override
  Future<void> playBackgroundMusic() async {
    return await backgroundPlayer.open(
      Audio('assets/sounds/backgroundMusic.wav'),
      playInBackground: PlayInBackground.disabledRestoreOnForeground,
      volume: 0.10,
      autoStart: true,
      loop: true,
    );
  }

  @override
  Future<void> stopBackgroundMusic(
      {String soundName, SoundFormat soundFormat}) async {
    return await backgroundPlayer.stop();
  }
}
