import 'package:flutter/material.dart';
import 'package:game_client/services/api/user_api_service.dart';
import 'package:game_client/services/service_locator.dart';
import 'package:game_client/services/storage/storage_service.dart';
import 'package:game_client/ui/shared/game_colors.dart';
import 'package:loading_overlay/loading_overlay.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // bool isLoading = false;

  Future<void> checkAuth() async {
    bool isLogin = await checkUserLoginOrNot();
    print('checkAuth function $isLogin');

    if (isLogin) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  Future<bool> checkUserLoginOrNot() async {
    final StorageService _storageService = serviceLocator<StorageService>();
    final UserApiService _userApiService = serviceLocator<UserApiService>();

    final token = _storageService.getToken();

    if (token == null || token == '') {
      return false;
    } else {
      bool isLogin = false;
      try {
        isLogin = await _userApiService.checkToken(token);
      } catch (e) {
        isLogin = false;
      }

      return isLogin;
    }
  }

  @override
  Widget build(BuildContext context) {
    checkAuth();

    return Scaffold(
      backgroundColor: GameColors.backgroundColor,
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          child: CircularProgressIndicator(
            backgroundColor: GameColors.darkOrange,
          ),
        ),
      ),
    );
  }
}
