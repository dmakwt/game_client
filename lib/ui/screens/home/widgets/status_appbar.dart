import 'package:flutter/material.dart';
import 'package:game_client/models/profile.dart';
import 'package:game_client/services/service_locator.dart';
import 'package:game_client/ui/shared/game_colors.dart';
import 'package:game_client/view_models/home/status_appbar_viewmodel.dart';
import 'package:provider/provider.dart';

class StatusAppbar extends StatelessWidget {
  final StatusAppbarViewModel model = serviceLocator<StatusAppbarViewModel>();

  @override
  Widget build(BuildContext context) {
    print('Build status Appbar');
    return ChangeNotifierProvider<StatusAppbarViewModel>(
      create: (context) => model,
      child: Consumer<StatusAppbarViewModel>(
        builder: (context, model, widget) {
          print('Updated  consummmer');

          return SafeArea(
            child: Container(
              color: GameColors.backgroundColor2,
              width: double.infinity,
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('${model.hp}'),
                  Text('${model.energy}'),
                  Text('${model.xp}'),
                  Text('${model.money}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
