import 'package:flutter/material.dart';
import 'package:game_client/ui/screens/home/main_screen.dart';
import 'package:game_client/ui/screens/login/manage_login_screen.dart';
import 'package:game_client/ui/splash/splash_screen.dart';

String initialRoute = '/';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case '/login':
      return MaterialPageRoute(builder: (context) => ManageLoginScreen());
    case '/home':
      return MaterialPageRoute(builder: (context) => MainScreen());

    default:
      return MaterialPageRoute(
        builder: (context) => UndefinedView(name: settings.name),
      );
  }
}

class UndefinedView extends StatelessWidget {
  final String name;
  const UndefinedView({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Route for $name not defined'),
      ),
    );
  }
}
