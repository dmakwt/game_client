import 'package:flutter/material.dart';
import 'package:game_client/ui/shared/animations/clicky_button_animation.dart';
import 'package:game_client/ui/shared/game_colors.dart';

class CustomLongButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomLongButton({@required this.text, @required this.onPressed});

  @override
  Widget build(Object context) {
    return ClickyButtonAnimation(
      sound: 'clickButton2',
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2),
        height: 95,
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/frames/long_button.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: GameColors.textColor,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
