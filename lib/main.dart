import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_client/ui/screens/home/main_screen.dart';
import 'package:logger/logger.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:game_client/services/sounds/sound_service.dart';
import 'package:game_client/ui/screens/login/manage_login_screen.dart';
import 'package:game_client/ui/shared/game_colors.dart';
import 'package:game_client/ui/splash/splash_screen.dart';

import 'services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  setupServiceLocator(sharedPreferences: sharedPreferences);

  // Logger.level = Level.info;

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SoundService _soundService = serviceLocator<SoundService>();

  @override
  void initState() {
    super.initState();
    // playSound();
  }

  void playSound() async {
    await _soundService.playBackgroundMusic();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final botToastBuilder = BotToastInit();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game',
      theme: ThemeData(
        textSelectionColor: GameColors.canvesColor.withOpacity(0.8),
        textSelectionHandleColor: GameColors.canvesColor.withOpacity(1),
        primarySwatch: GameColors.customPrimaryColor,
        canvasColor: Colors.white,
        fontFamily: 'PTSerif',
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) {
        child = ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.autoScale(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
          ],
          background: Container(
            color: Color(0xFFF5F5F5),
          ),
        );

        child = botToastBuilder(context, child);
        return child;
      },
      navigatorObservers: [BotToastNavigatorObserver()],
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => ManageLoginScreen(),
        '/home': (context) => MainScreen(),
      },
    );
  }
}

// class MyBehavior extends ScrollBehavior {
//   @override
//   Widget buildViewportChrome(
//       BuildContext context, Widget child, AxisDirection axisDirection) {
//     return child;
//   }
// }
