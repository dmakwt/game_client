import 'package:flutter/material.dart';

class GameLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/frames/logo.png',
        scale: 2,
      ),
    );
  }
}
