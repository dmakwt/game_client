import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_client/services/service_locator.dart';
import 'package:game_client/services/sounds/sound_service.dart';

class ClickyButtonAnimation extends StatefulWidget {
  final Widget child;
  final Function onPressed;
  final String sound;

  const ClickyButtonAnimation({
    @required this.child,
    @required this.onPressed,
    this.sound = 'clickButton2',
  });

  @override
  _ClickyButtonAnimationState createState() => _ClickyButtonAnimationState();
}

class _ClickyButtonAnimationState extends State<ClickyButtonAnimation>
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

  Widget get _animatedButtonUi => widget.child;

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
