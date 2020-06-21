import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:game_client/services/service_locator.dart';
import 'package:game_client/ui/shared/widgets/custom_progress_bar/flutter_animation_progress_bar.dart';
import 'package:game_client/view_models/home/status_appbar_viewmodel.dart';
import 'package:intl/intl.dart';
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

          return Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned(
                    top: 8,
                    left: 50,
                    child: Container(
                      // color: Colors.yellow.withOpacity(0.3),
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/appbar/bgBar.png',
                        fit: BoxFit.fill,
                        // scale: 0.4,
                        width: 395,
                        height: 120,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Positioned(
                            top: 14,
                            left: 14,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1000),
                              child: CachedNetworkImage(
                                alignment: Alignment.center,
                                fit: BoxFit.cover,
                                width: 105,
                                height: 105,
                                imageUrl: model.avatarURL,
                                placeholder: (context, url) => Container(
                                  height: 105,
                                  width: 105,
                                  child: Image.asset(
                                    'assets/appbar/avatar.png',
                                  ),
                                ),
                                // errorWidget: (context, url, error) =>
                                //     Icon(Icons.error),
                              ),
                            ),
                          ),
                          Container(
                            width: 130,
                            height: 130,
                            // color: Colors.orange,
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              'assets/appbar/avatarFrame.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        // color: Colors.yellow.withOpacity(0.5),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 3),
                            Tooltip(
                              message: 'Health',
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/appbar/hp.png',
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.contain,
                                  ),
                                  Container(
                                    width: 160,
                                    height: 20,
                                    child: FAProgressBar(
                                      currentValue: model.hp.toInt(),
                                      maxValue: 100,
                                      size: 20,
                                      animatedDuration:
                                          Duration(milliseconds: 1000),
                                      progressColor:
                                          Color.fromRGBO(248, 21, 21, 1),
                                      progressColor2:
                                          Color.fromRGBO(106, 0, 0, 1),
                                      backgroundColor:
                                          Color.fromRGBO(24, 19, 15, 1),
                                      displayText: '/100',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 3),
                            Tooltip(
                              message: 'Energy',
                              child: Row(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/appbar/energy.png',
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.contain,
                                      ),
                                      if (model.energy < 100)
                                        Positioned(
                                          bottom: 4,
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            child: FlareActor(
                                              'assets/flare/plusAnimation.flr',
                                              fit: BoxFit.contain,
                                              animation: 'plusAnimation',
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                  Container(
                                    width: 160,
                                    height: 20,
                                    child: FAProgressBar(
                                      currentValue: model.energy.toInt(),
                                      maxValue: 100,
                                      size: 20,
                                      animatedDuration:
                                          Duration(milliseconds: 1000),
                                      progressColor:
                                          Color.fromRGBO(252, 187, 70, 1),
                                      progressColor2:
                                          Color.fromRGBO(251, 138, 26, 1),
                                      backgroundColor:
                                          Color.fromRGBO(24, 19, 15, 1),
                                      displayText: '/100',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 3),
                            Tooltip(
                              message: 'XP',
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/appbar/xp.png',
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.contain,
                                  ),
                                  Container(
                                    width: 160,
                                    height: 20,
                                    child: FAProgressBar(
                                      currentValue: 1200,
                                      maxValue: 2000,
                                      size: 20,
                                      animatedDuration:
                                          Duration(milliseconds: 1000),
                                      progressColor:
                                          Color.fromRGBO(36, 120, 177, 1),
                                      progressColor2:
                                          Color.fromRGBO(30, 84, 153, 1),
                                      backgroundColor:
                                          Color.fromRGBO(24, 19, 15, 1),
                                      displayText: '/2000',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 3),
                      Container(
                        // color: Colors.pinkAccent.withOpacity(0.5),
                        width: 113,
                        height: 100,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 5),
                            Container(
                              width: 113,
                              height: 30,
                              decoration: BoxDecoration(
                                // color: Colors.amber.withOpacity(0.5),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/appbar/goldbar.png',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  NumberFormat('#,###,###').format(model.money),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 113,
                              height: 30,
                              decoration: BoxDecoration(
                                // color: Colors.amber.withOpacity(0.5),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/appbar/gembar.png',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  NumberFormat('#,###,###').format(model.gems),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 23,
                                    height: 23,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/appbar/level.png',
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    model.level.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
