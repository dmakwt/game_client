import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:game_client/config/api_key.dart';
import 'package:game_client/models/user.dart';
import 'package:http/http.dart' as http;

class UserApiService {
  // Sign Up
  Future<User> userSignUp({
    @required String username,
    @required String email,
    @required String password,
  }) async {
    Map<String, String> data = {
      'username': username,
      'email': email,
      'password': password,
    };

    final response = await http.post(
      '${APIKeys.urlApi}/users/signup',
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      final token = data['token'];
      final usernameID = data['usernameID'];

      if (token != null && usernameID != null) {
        return User.fromJson(data);
      }
    }

    print(
        '**** Request user Sign Up failed \n Response: ${response.statusCode} ${response.reasonPhrase} ');
    throw response;
  }

  // Sign In
  Future<User> userSignIn({
    @required String email,
    @required String password,
  }) async {
    Map<String, String> data = {
      'email': email,
      'password': password,
    };

    final response = await http.post(
      '${APIKeys.urlApi}/users/login',
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token'];
      final usernameID = data['usernameID'];

      if (token != null && usernameID != null) {
        return User.fromJson(data);
      }
    }

    print(
        '**** Request user SignIn failed \n Response: ${response.statusCode} ${response.reasonPhrase} ');
    throw response;
  }

  // Forget password
  Future<String> resetPassword({@required String email}) async {
    Map<String, String> data = {
      'email': email,
    };

    final response = await http.post(
      '${APIKeys.urlApi}/users/recover',
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final url = data['url'];
      if (url != null) {
        return url as String;
      }
    }

    print(
        '**** Request Reset Password failed \n Response: ${response.statusCode} ${response.reasonPhrase} ');
    throw response;
  }

  Future<bool> checkToken(String token) async {
    final response = await http.get(
      '${APIKeys.urlApi}/users/check',
      headers: {'Authorization': 'Bearer $token'},
    );

    print('Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final isLogin = data['success'];
      if (isLogin != null) {
        return isLogin as bool;
      }
    }

    return false;
  }
}
