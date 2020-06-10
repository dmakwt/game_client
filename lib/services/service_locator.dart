import 'package:game_client/services/sounds/sound_service.dart';
import 'package:game_client/services/sounds/sound_service_implementation.dart';
import 'package:game_client/view_models/login/manage_login_screen_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<SoundService>(() => SoundServiceImpl());
  // serviceLocator.registerLazySingleton<StorageService>(() => StorageServiceImpl());
  // serviceLocator.registerLazySingleton<WebApi>(() => WebApiImpl());

  serviceLocator.registerFactory<ManageLoginScreenViewModel>(() => ManageLoginScreenViewModel());
  // serviceLocator.registerFactory<ChooseFavoritesViewModel>(() => ChooseFavoritesViewModel());
}
