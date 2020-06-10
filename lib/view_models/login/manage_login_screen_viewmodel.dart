import 'package:flutter/foundation.dart';
import 'package:game_client/services/service_locator.dart';
import 'package:game_client/services/sounds/sound_service.dart';

class ManageLoginScreenViewModel extends ChangeNotifier {
  final SoundService _soundService = serviceLocator<SoundService>();
  bool isLoading = false;
  bool isPlay = true;

  void playBackgroundMusic() async {
    await _soundService.playBackgroundMusic();
    isPlay = true;
    notifyListeners();
  }

  void stopBackgroundMusic() async {
    await _soundService.stopBackgroundMusic();
    isPlay = false;
    notifyListeners();
  }

  void turnLoading() {
    if (isLoading) {
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = true;
      notifyListeners();
    }
  }
}
