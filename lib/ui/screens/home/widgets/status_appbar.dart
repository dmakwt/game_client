import 'package:flutter/material.dart';
import 'package:game_client/services/service_locator.dart';
import 'package:game_client/ui/shared/widgets/custom_progress_bar/flutter_animation_progress_bar.dart';
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
              color: Color.fromRGBO(24, 19, 15, 1),
              width: double.infinity,
              height: 120,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 300,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        FAProgressBar(
                          currentValue: model.hp.toInt(),
                          maxValue: 100,
                          size: 20,
                          animatedDuration: Duration(milliseconds: 1000),
                          progressColor: Color.fromRGBO(248, 21, 21, 1),
                          progressColor2: Color.fromRGBO(106, 0, 0, 1),
                          backgroundColor: Color.fromRGBO(24, 19, 15, 1),
                          displayText: '/100',
                        ),
                        SizedBox(height: 5),
                        FAProgressBar(
                          currentValue: model.energy.toInt(),
                          maxValue: 100,
                          size: 20,
                          animatedDuration: Duration(milliseconds: 1000),
                          progressColor: Color.fromRGBO(252, 187, 70, 1),
                          progressColor2: Color.fromRGBO(251, 138, 26, 1),
                          backgroundColor: Color.fromRGBO(24, 19, 15, 1),
                          displayText: '/100',
                        ),
                        SizedBox(height: 5),
                        FAProgressBar(
                          currentValue: 5000,
                          maxValue: 10000,
                          size: 20,
                          animatedDuration: Duration(milliseconds: 1000),
                          progressColor: Color.fromRGBO(36, 120, 177, 1),
                          progressColor2: Color.fromRGBO(30, 84, 153, 1),
                          backgroundColor: Color.fromRGBO(24, 19, 15, 1),
                          displayText: '/1000',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
