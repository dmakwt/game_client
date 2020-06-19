import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game_client/models/profile.dart';

class StatusAppbarViewModel extends ChangeNotifier {
  double _hp = 0;
  double _energy = 0;
  double _xp = 0;
  double _money = 0;
  int _gems = 0;

  double get hp => _hp;
  double get energy => _energy;
  double get xp => _xp;
  double get money => _money;
  int get gems => _gems;

  bool isLoading = false;

  Future<void> updateData(Profile profile) async {
    print('Updated function');

    _hp = profile.hp;
    _energy = profile.energy;
    _xp = profile.xp;
    _money = profile.money;
    _gems = profile.gems;
    notifyListeners();
  }
}
