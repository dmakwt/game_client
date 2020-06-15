import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game_client/services/api/user_api_service.dart';
import 'package:game_client/services/service_locator.dart';
import 'package:game_client/services/sounds/sound_service.dart';
import 'package:game_client/services/storage/storage_service.dart';
import 'package:game_client/ui/shared/game_colors.dart';

class ManageLoginScreenViewModel extends ChangeNotifier {
  final SoundService _soundService = serviceLocator<SoundService>();
  final UserApiService _userApiService = serviceLocator<UserApiService>();
  final StorageService _storageService = serviceLocator<StorageService>();

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

  Future<void> signUpUser(context,
      {String username, String email, String password}) async {
    try {
      turnLoading();
      final token = await _userApiService.userSignUp(
        username: username,
        email: email,
        password: password,
      );

      if (token.isNotEmpty) {
        await _storageService.setToken(token);

        Navigator.of(context).pushReplacementNamed('/home');
      } else {}
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(e.body.toString()),
        ),
      );
      turnLoading();
    }
  }

  Future<void> signInUser(context, {String email, String password}) async {
    try {
      turnLoading();
      final token = await _userApiService.userSignIn(
        email: email,
        password: password,
      );

      if (token.isNotEmpty) {
        await _storageService.setToken(token);

        Navigator.of(context).pushReplacementNamed('/home');
      } else {}
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(e.body.toString()),
        ),
      );
      turnLoading();
    }
  }

  void printToken() {
    print(_storageService.getToken());
  }

  Future<void> logout(BuildContext context) async {
    final token = _storageService.getToken();

    if (token != null) {
      turnLoading();
      print('Token: before: $token');
      await _storageService.setToken('');
      print('Token: after: ${_storageService.getToken()}');
      await Navigator.of(context).pushReplacementNamed('/');
      turnLoading();
    } else {
      turnLoading();
      await Navigator.of(context).pushReplacementNamed('/');
      turnLoading();
    }
  }

  Future<void> resetPassword(context, {@required String email}) async {
    try {
      Navigator.of(context).pop();
      turnLoading();
      final url = await _userApiService.resetPassword(email: email);
      print(url);
      turnLoading();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Please check your Email'),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Ok',
                style: TextStyle(
                  color: GameColors.textColor,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(e.body.toString()),
        ),
      );
      turnLoading();
    }
  }
}
