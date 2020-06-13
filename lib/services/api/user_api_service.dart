import 'dart:convert';

import 'package:game_client/config/api_key.dart';
import 'package:http/http.dart' as http;

class UserApiService {

   // Sign Up
  Future<String> userSignUp({
    String username,
    String email,
    String password,
  }) async {
    Map<String, String> data = {
      'username': username,
      'email': email,
      'password': password,
    };

    print(json.encode(data));

    final response = await http.post(
      '${APIKeys.urlApi}/users/signup',
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      final token = data['token'];
      if (token != null) {
        return token as String;
      }
    }

    print(
        '**** Request user Sign Up failed \n Response: ${response.statusCode} ${response.reasonPhrase} ');
    throw response;
  }

  // Sign In

  Future<String> userSignIn({
    String email,
    String password,
  }) async {
    Map<String, String> data = {
      'email': email,
      'password': password,
    };

    print(json.encode(data));

    final response = await http.post(
      '${APIKeys.urlApi}/users/login',
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token'];
      if (token != null) {
        return token as String;
      }
    }

    print(
        '**** Request user SignIn failed \n Response: ${response.statusCode} ${response.reasonPhrase} ');
    throw response;
  }
}
