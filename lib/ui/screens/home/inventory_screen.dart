import 'package:flutter/material.dart';
import 'package:game_client/ui/screens/home/widgets/profile_frame.dart';

import 'package:game_client/ui/shared/game_colors.dart';

class InventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColors.backgroundColor3,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProfileFrame(),
          ],
        ),
      ),
    );
  }
}
