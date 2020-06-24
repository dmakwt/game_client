import 'package:flutter/material.dart';
import 'package:game_client/ui/screens/home/home_screen.dart';
import 'package:game_client/ui/screens/home/widgets/status_appbar.dart';
import 'package:game_client/ui/shared/game_colors.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  BottomNavigationBarItem _buildBottomNavigationBar(
      {String image, String text}) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        'assets/bottombar/$image.png',
        width: 45,
        height: 45,
      ),
      title: Text(
        text,
      ),
    );
  }

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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: GameColors.goldColor.withOpacity(0.65),
              width: 3.5,
            ),
          ),
        ),
        child: Stack(
          children: <Widget>[
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white30,
              items: <BottomNavigationBarItem>[
                _buildBottomNavigationBar(
                  image: 'home',
                  text: 'Home',
                ),
                _buildBottomNavigationBar(
                  image: 'inventory',
                  text: 'Inventory',
                ),
                _buildBottomNavigationBar(
                  image: 'menu',
                  text: 'Messages',
                ),
                _buildBottomNavigationBar(
                  image: 'trade',
                  text: 'Clan',
                ),
                _buildBottomNavigationBar(
                  image: 'options',
                  text: 'Settings',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
