import 'package:flutter/material.dart';
import 'package:game_client/ui/screens/home/home_screen.dart';
import 'package:game_client/ui/screens/home/inventory_screen.dart';
import 'package:game_client/ui/screens/home/widgets/status_appbar.dart';
import 'package:game_client/ui/shared/game_colors.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

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

  final tabs = [
    HomeScreen(),
    InventoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColors.backgroundColor3,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            tabs[_currentIndex],
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
              color: GameColors.goldColor,
              width: 3.5,
            ),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentIndex,
                onTap: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
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
            ),
          ],
        ),
      ),
    );
  }
}
