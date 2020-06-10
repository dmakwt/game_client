import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_client/services/service_locator.dart';
import 'package:game_client/services/sounds/sound_service.dart';
import 'package:game_client/ui/shared/game_colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function onPressed;

  const CustomButton({@required this.text, @required this.onPressed});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  final SoundService _soundService = serviceLocator<SoundService>();

  AnimationController _controller;
  double _scale;
  final int speedClick = 110;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: speedClick),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value * 2;
    return GestureDetector(
      onTap: _onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onPanCancel: _onTapCancel,
      child: Transform.scale(
        scale: _scale,
        child: _animatedButtonUi,
      ),
    );
  }

  Widget get _animatedButtonUi => Container(
        padding: EdgeInsets.symmetric(vertical: 2),
        height: 95,
        width: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/frames/button.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: GameColors.textColor,
              fontSize: 14,
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _soundService.playSound(
        soundName: 'clickButton2', soundFormat: SoundFormat.WAV);
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _onTap() {
    _controller.forward();
    widget.onPressed();
    Timer(Duration(milliseconds: speedClick), () {
      _controller.reverse();
    });
  }

  void _onTapCancel() {
    Timer(Duration(milliseconds: speedClick), () {
      _controller.reverse();
    });
  }
}
