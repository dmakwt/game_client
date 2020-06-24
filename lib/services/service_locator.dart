import 'package:flutter/material.dart';
import 'package:game_client/view_models/home/status_appbar_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:game_client/services/api/user_api_service.dart';
import 'package:game_client/services/socketio/socket_service.dart';
import 'package:game_client/services/sounds/sound_service.dart';
import 'package:game_client/services/sounds/sound_service_implementation.dart';
import 'package:game_client/services/storage/storage_service.dart';
import 'package:game_client/services/storage/storage_service_implementation.dart';
import 'package:game_client/view_models/login/manage_login_screen_viewmodel.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> setupServiceLocator(
    {@required SharedPreferences sharedPreferences}) async {
  // Services
  serviceLocator.registerLazySingleton<SoundService>(() => SoundServiceImpl());
  serviceLocator.registerLazySingleton<StorageService>(
    () => StorageServiceImpl(sharedPreferences: sharedPreferences),
  );
  serviceLocator.registerLazySingleton<UserApiService>(() => UserApiService());
  serviceLocator.registerLazySingleton<SocketService>(() => SocketService());

  // View Models
  serviceLocator.registerLazySingleton<StatusAppbarViewModel>(
      () => StatusAppbarViewModel());

  serviceLocator.registerFactory<ManageLoginScreenViewModel>(
      () => ManageLoginScreenViewModel());
}
