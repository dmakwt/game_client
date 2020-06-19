import 'package:flutter/foundation.dart';
import 'package:game_client/models/profile.dart';

class User {
  String token;
  String usernameID;
  Profile profile;

  User(
      {@required this.token,
      @required this.usernameID,
      @required this.profile});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'],
      usernameID: json['usernameID'],
      profile: Profile.fromMap(json['profile']),
    );
  }
}
