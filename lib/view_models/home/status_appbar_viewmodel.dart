import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game_client/models/profile.dart';

class StatusAppbarViewModel extends ChangeNotifier {
  Profile _profile = Profile();

  double get hp => _profile.hp;
  double get energy => _profile.energy;
  double get xp => _profile.xp;
  double get money => _profile.money;
  int get gems => _profile.gems;
  int get level => _profile.level;
  String get avatarURL => _profile.avatarURL;

  bool isLoading = false;

  Future<void> updateData(Profile profile) async {
    _profile = profile;

    notifyListeners();
  }
}
