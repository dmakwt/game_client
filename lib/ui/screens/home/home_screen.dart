import 'package:flutter/material.dart';
import 'package:game_client/ui/screens/home/map_screen.dart';
import 'package:game_client/ui/screens/home/widgets/status_appbar.dart';
import 'package:game_client/ui/shared/game_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            MapScreen(),
            Align(
              alignment: Alignment.topCenter,
              child: StatusAppbar(),
            ),
          ],
        ),
      ),
    );
  }
}
