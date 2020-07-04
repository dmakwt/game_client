import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:game_client/services/api/user_api_service.dart';
import 'package:game_client/services/logger.dart';
import 'package:game_client/services/service_locator.dart';
import 'package:game_client/services/socketio/socket_service.dart';
import 'package:game_client/services/sounds/sound_service.dart';
import 'package:game_client/services/storage/storage_service.dart';
import 'package:game_client/ui/shared/game_colors.dart';
import 'package:game_client/ui/shared/loader.dart';
import 'package:game_client/view_models/home/status_appbar_viewmodel.dart';
import 'package:print_color/print_color.dart';

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

  Future<void> signUpUser(context,
      {String username, String email, String password}) async {
    try {
      Loader.showLoading();
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
      BotToast.closeAllLoading();
    } catch (e) {
      BotToast.showText(
        text: e.body,
        duration: Duration(seconds: 3),
        clickClose: true,
        align: Alignment.topCenter,
      );

      BotToast.closeAllLoading();
    }
  }

  Future<void> signInUser(context, {String email, String password}) async {
    try {
      Loader.showLoading();
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
      BotToast.closeAllLoading();
    } catch (e) {
      logger.e(e);
      BotToast.closeAllLoading();
    }
  }

  void printToken() {
    logger.i(_storageService.getToken());
  }

  Future<void> logout(BuildContext context) async {
    final token = _storageService.getToken();
    final usernameID = _storageService.getUsernameID();

    if (token != null || usernameID != null) {
      Loader.showLoading();

      await _storageService.setToken('');
      await _storageService.setUsernameID('');

      await Navigator.of(context).pushReplacementNamed('/');
      BotToast.closeAllLoading();
    } else {
      Loader.showLoading();
      await Navigator.of(context).pushReplacementNamed('/');
      BotToast.closeAllLoading();
    }
  }

  Future<void> resetPassword(BuildContext context,
      {@required String email}) async {
    try {
      Navigator.of(context).pop();
      Loader.showLoading();
      final url = await _userApiService.resetPassword(email: email);

      logger.i(url);

      //TODO: Need to show dialog that to tell the use to check his email

      BotToast.closeAllLoading();
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
