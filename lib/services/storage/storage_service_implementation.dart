import 'package:flutter/material.dart';
import 'package:game_client/services/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServiceImpl implements StorageService {
  final SharedPreferences sharedPreferences;

  StorageServiceImpl({@required this.sharedPreferences});

  Future<void> setData(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  String getData(String key) {
    return sharedPreferences.getString(key);
  }

  Future<void> setToken(String token) async {
    await sharedPreferences.setString('token', token);
  }

  String getToken() {
    return sharedPreferences.getString('token');
  }
}
