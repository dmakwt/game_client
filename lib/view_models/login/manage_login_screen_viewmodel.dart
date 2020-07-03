import 'dart:io';

import 'package:flutter/material.dart';
import 'package:game_client/services/api/user_api_service.dart';
import 'package:game_client/services/logger.dart';
import 'package:game_client/services/service_locator.dart';
import 'package:game_client/services/socketio/socket_service.dart';
import 'package:game_client/services/sounds/sound_service.dart';
import 'package:game_client/services/storage/storage_service.dart';
import 'package:game_client/ui/shared/game_colors.dart';
import 'package:game_client/view_models/home/status_appbar_viewmodel.dart';

class ManageLoginScreenViewModel extends ChangeNotifier {
  final SoundService _soundService = serviceLocator<SoundService>();
  final UserApiService _userApiService = serviceLocator<UserApiService>();
  final StorageService _storageService = serviceLocator<StorageService>();
  final SocketService _socketService = serviceLocator<SocketService>();
  final StatusAppbarViewModel model = serviceLocator<StatusAppbarViewModel>();

  final logger = getLogger('ManageLoginScreenViewModel');

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

        await model.updateData(data.profile);

        Navigator.of(context).pushReplacementNamed('/home');
      } else {}
    } on SocketException catch (_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Connection Error'),
        ),
      );
      turnLoading();
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(
            e.body.toString() ?? '',
          ),
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

        await model.updateData(data.profile);

        Navigator.of(context).pushReplacementNamed('/home');
      } else {}
    } on SocketException catch (_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Connection Error'),
        ),
      );
      turnLoading();
    } catch (e) {
      print(e);
      // showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     content: Text(
      //       e.body.toString() ?? '',
      //     ),
      //   ),
      // );
      turnLoading();
    }
  }

  void printToken() {
    logger.i(_storageService.getToken());
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

  Future<void> resetPassword(BuildContext context,
      {@required String email}) async {
    try {
      Navigator.of(context).pop();
      turnLoading();
      final url = await _userApiService.resetPassword(email: email);

      logger.i(url);

      //TODO: Need to show dialog that to tell the use to check his email

      turnLoading();
    } on SocketException catch (_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Connection Error'),
        ),
      );
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }
}
