import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:game_client/services/service_locator.dart';
import 'package:game_client/ui/screens/login/login_screen.dart';
import 'package:game_client/ui/screens/login/register_screen.dart';
import 'package:game_client/ui/shared/game_colors.dart';
import 'package:game_client/view_models/login/manage_login_screen_viewmodel.dart';

class ManageLoginScreen extends StatelessWidget {
  final ManageLoginScreenViewModel model =
      serviceLocator<ManageLoginScreenViewModel>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ManageLoginScreenViewModel>.value(
      value: model,
      child: Consumer<ManageLoginScreenViewModel>(
          builder: (context, model, widget) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: GameColors.backgroundColor,
          resizeToAvoidBottomPadding: false,
          body: Stack(
            children: <Widget>[
              PageView(
                controller: pageViewController,
                children: <Widget>[
                  LoginScreen(
                    pageViewController: pageViewController,
                    model: model,
                  ),
                  RegisterScreen(
                    pageViewController: pageViewController,
                    model: model,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'assets/frames/pattern.png',
                  scale: 5,
                ),
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 25, right: 8),
            child: IconButton(
              color: GameColors.textColor,
              icon: Icon(
                model.isPlay
                    ? FontAwesomeIcons.volumeUp
                    : FontAwesomeIcons.volumeOff,
              ),
              onPressed: () {
                model.printToken();
                // if (model.isPlay) {
                //   model.stopBackgroundMusic();
                // } else {
                //   model.playBackgroundMusic();
                // }
              },
            ),
          ),
        );
      }),
    );
  }
}
