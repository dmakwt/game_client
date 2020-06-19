import 'package:flutter/material.dart';
import 'package:game_client/ui/screens/home/widgets/status_appbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: StatusAppbar(),
          )
        ],
      ),
    );
  }
}
