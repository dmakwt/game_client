import 'package:flutter/material.dart';
import 'package:game_client/ui/screens/home/widgets/status_appbar.dart';
import 'package:game_client/ui/shared/game_colors.dart';

class InventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColors.backgroundColor3,
      body: Stack(
        children: <Widget>[
          Center(
            child: Text('Inventory'),
          ),
        ],
      ),
    );
  }
}
