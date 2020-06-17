import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game_client/services/api/user_api_service.dart';
import 'package:game_client/services/service_locator.dart';
import 'package:game_client/services/socketio/socket_service.dart';
import 'package:game_client/services/sounds/sound_service.dart';
import 'package:game_client/services/storage/storage_service.dart';
import 'package:game_client/ui/shared/game_colors.dart';

class ManageLoginScreenViewModel extends ChangeNotifier {
  final SoundService _soundService = serviceLocator<SoundService>();
  final UserApiService _userApiService = serviceLocator<UserApiService>();
  final StorageService _storageService = serviceLocator<StorageService>();
  final SocketService _socketService = serviceLocator<SocketService>();

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
      final data = await _userApiService.userSignUp(
        username: username,
        email: email,
        password: password,
      );

      if (data != null) {
        await _storageService.setToken(data.token);
        await _storageService.setUsernameID(data.usernameID);

        // Socket IO
        _socketService.createSocketConnection(
          usernameID: _storageService.getUsernameID(),
        );

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
      final data = await _userApiService.userSignIn(
        email: email,
        password: password,
      );

      if (data != null) {
        await _storageService.setToken(data.token);
        await _storageService.setUsernameID(data.usernameID);

        // Socket IO
        _socketService.createSocketConnection(
          usernameID: _storageService.getUsernameID(),
        );

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
    final usernameID = _storageService.getUsernameID();

    if (token != null || usernameID != null) {
      turnLoading();

      await _storageService.setToken('');
      await _storageService.setUsernameID('');

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
