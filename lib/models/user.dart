import 'package:flutter/foundation.dart';

class User {
  String token;
  String usernameID;

  User({@required this.token, @required this.usernameID});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'],
      usernameID: json['usernameID'],
    );
  }
}
