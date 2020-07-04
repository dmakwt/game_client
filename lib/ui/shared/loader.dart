import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:game_client/ui/shared/game_colors.dart';

class Loader {
  static showLoading() {
    BotToast.showCustomLoading(
      toastBuilder: (_) => CircularProgressIndicator(
        backgroundColor: GameColors.darkOrange,
      ),
    );
  }
}
