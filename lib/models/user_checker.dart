import 'package:flutter/foundation.dart';
import 'package:game_client/models/profile.dart';

class UserChecker {
  bool isLogin;
  Profile profile;

  UserChecker({
    @required this.isLogin,
    @required this.profile,
  });

  factory UserChecker.fromJson(Map<String, dynamic> json) {
    return UserChecker(
      isLogin: json['success'],
      profile: Profile.fromMap(json['profile']),
    );
  }
}
