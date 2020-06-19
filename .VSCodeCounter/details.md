# Details

Date : 2020-06-18 21:25:09

Directory /Users/dmakwt/development/game_client

Total : 49 files,  2195 codes, 149 comments, 314 blanks, all 2658 lines

[summary](results.md)

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [README.md](/README.md) | Markdown | 10 | 0 | 7 | 17 |
| [android/app/build.gradle](/android/app/build.gradle) | Groovy | 49 | 3 | 12 | 64 |
| [android/app/src/debug/AndroidManifest.xml](/android/app/src/debug/AndroidManifest.xml) | XML | 4 | 3 | 1 | 8 |
| [android/app/src/main/AndroidManifest.xml](/android/app/src/main/AndroidManifest.xml) | XML | 31 | 16 | 1 | 48 |
| [android/app/src/main/res/drawable/launch_background.xml](/android/app/src/main/res/drawable/launch_background.xml) | XML | 4 | 7 | 2 | 13 |
| [android/app/src/main/res/values/styles.xml](/android/app/src/main/res/values/styles.xml) | XML | 9 | 9 | 1 | 19 |
| [android/app/src/profile/AndroidManifest.xml](/android/app/src/profile/AndroidManifest.xml) | XML | 4 | 3 | 1 | 8 |
| [android/build.gradle](/android/build.gradle) | Groovy | 27 | 0 | 5 | 32 |
| [android/gradle.properties](/android/gradle.properties) | Properties | 4 | 0 | 1 | 5 |
| [android/gradle/wrapper/gradle-wrapper.properties](/android/gradle/wrapper/gradle-wrapper.properties) | Properties | 5 | 1 | 1 | 7 |
| [android/settings.gradle](/android/settings.gradle) | Groovy | 8 | 3 | 5 | 16 |
| [ios/Runner/AppDelegate.swift](/ios/Runner/AppDelegate.swift) | Swift | 12 | 0 | 2 | 14 |
| [ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json](/ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json) | JSON | 122 | 0 | 1 | 123 |
| [ios/Runner/Assets.xcassets/LaunchImage.imageset/Contents.json](/ios/Runner/Assets.xcassets/LaunchImage.imageset/Contents.json) | JSON | 23 | 0 | 1 | 24 |
| [ios/Runner/Assets.xcassets/LaunchImage.imageset/README.md](/ios/Runner/Assets.xcassets/LaunchImage.imageset/README.md) | Markdown | 3 | 0 | 2 | 5 |
| [ios/Runner/Base.lproj/LaunchScreen.storyboard](/ios/Runner/Base.lproj/LaunchScreen.storyboard) | XML | 36 | 1 | 1 | 38 |
| [ios/Runner/Base.lproj/Main.storyboard](/ios/Runner/Base.lproj/Main.storyboard) | XML | 25 | 1 | 1 | 27 |
| [ios/Runner/Runner-Bridging-Header.h](/ios/Runner/Runner-Bridging-Header.h) | C++ | 1 | 0 | 1 | 2 |
| [lib/main.dart](/lib/main.dart) | Dart | 66 | 11 | 13 | 90 |
| [lib/models/profile.dart](/lib/models/profile.dart) | Dart | 187 | 0 | 12 | 199 |
| [lib/models/used_items.dart](/lib/models/used_items.dart) | Dart | 97 | 0 | 11 | 108 |
| [lib/models/user.dart](/lib/models/user.dart) | Dart | 18 | 0 | 4 | 22 |
| [lib/models/user_checker.dart](/lib/models/user_checker.dart) | Dart | 16 | 0 | 4 | 20 |
| [lib/models/user_skills.dart](/lib/models/user_skills.dart) | Dart | 81 | 0 | 11 | 92 |
| [lib/services/api/user_api_service.dart](/lib/services/api/user_api_service.dart) | Dart | 109 | 3 | 23 | 135 |
| [lib/services/service_locator.dart](/lib/services/service_locator.dart) | Dart | 25 | 1 | 6 | 32 |
| [lib/services/socketio/socket_service.dart](/lib/services/socketio/socket_service.dart) | Dart | 24 | 1 | 8 | 33 |
| [lib/services/sounds/sound_service.dart](/lib/services/sounds/sound_service.dart) | Dart | 14 | 0 | 3 | 17 |
| [lib/services/sounds/sound_service_implementation.dart](/lib/services/sounds/sound_service_implementation.dart) | Dart | 35 | 6 | 7 | 48 |
| [lib/services/storage/storage_service.dart](/lib/services/storage/storage_service.dart) | Dart | 9 | 0 | 10 | 19 |
| [lib/services/storage/storage_service_implementation.dart](/lib/services/storage/storage_service_implementation.dart) | Dart | 25 | 0 | 10 | 35 |
| [lib/ui/screens/home/home_screen.dart](/lib/ui/screens/home/home_screen.dart) | Dart | 18 | 0 | 2 | 20 |
| [lib/ui/screens/home/widgets/map_screen.dart](/lib/ui/screens/home/widgets/map_screen.dart) | Dart | 73 | 1 | 8 | 82 |
| [lib/ui/screens/home/widgets/status_appbar.dart](/lib/ui/screens/home/widgets/status_appbar.dart) | Dart | 37 | 10 | 4 | 51 |
| [lib/ui/screens/login/login_screen.dart](/lib/ui/screens/login/login_screen.dart) | Dart | 148 | 0 | 10 | 158 |
| [lib/ui/screens/login/manage_login_screen.dart](/lib/ui/screens/login/manage_login_screen.dart) | Dart | 72 | 5 | 5 | 82 |
| [lib/ui/screens/login/register_screen.dart](/lib/ui/screens/login/register_screen.dart) | Dart | 139 | 1 | 10 | 150 |
| [lib/ui/screens/login/widgets/forget_password_dialog.dart](/lib/ui/screens/login/widgets/forget_password_dialog.dart) | Dart | 56 | 0 | 5 | 61 |
| [lib/ui/screens/login/widgets/game_logo.dart](/lib/ui/screens/login/widgets/game_logo.dart) | Dart | 12 | 0 | 2 | 14 |
| [lib/ui/shared/animations/clicky_button_animation.dart](/lib/ui/shared/animations/clicky_button_animation.dart) | Dart | 76 | 0 | 15 | 91 |
| [lib/ui/shared/game_colors.dart](/lib/ui/shared/game_colors.dart) | Dart | 22 | 0 | 3 | 25 |
| [lib/ui/shared/widgets/custom_button.dart](/lib/ui/shared/widgets/custom_button.dart) | Dart | 35 | 0 | 4 | 39 |
| [lib/ui/shared/widgets/custom_long_button.dart](/lib/ui/shared/widgets/custom_long_button.dart) | Dart | 35 | 0 | 4 | 39 |
| [lib/ui/shared/widgets/input_field.dart](/lib/ui/shared/widgets/input_field.dart) | Dart | 73 | 0 | 5 | 78 |
| [lib/ui/splash/splash_screen.dart](/lib/ui/splash/splash_screen.dart) | Dart | 62 | 1 | 13 | 76 |
| [lib/view_models/home/status_appbar_viewmodel.dart](/lib/view_models/home/status_appbar_viewmodel.dart) | Dart | 22 | 0 | 6 | 28 |
| [lib/view_models/login/manage_login_screen_viewmodel.dart](/lib/view_models/login/manage_login_screen_viewmodel.dart) | Dart | 166 | 10 | 23 | 199 |
| [pubspec.yaml](/pubspec.yaml) | YAML | 52 | 42 | 20 | 114 |
| [test/widget_test.dart](/test/widget_test.dart) | Dart | 14 | 10 | 7 | 31 |

[summary](results.md)