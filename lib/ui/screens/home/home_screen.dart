import 'package:diagonal_scrollview/diagonal_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:game_client/services/service_locator.dart';
import 'package:game_client/ui/screens/home/widgets/status_appbar.dart';
import 'package:game_client/ui/shared/game_colors.dart';
import 'package:game_client/view_models/login/manage_login_screen_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  // DiagonalScrollViewController _controller;
  final ManageLoginScreenViewModel _manageLoginScreenViewModel =
      serviceLocator<ManageLoginScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColors.backgroundColor3,
      body: Stack(
        children: <Widget>[
          DiagonalScrollView(
            enableFling: true,
            enableZoom: true,
            minScale: 0.5,
            maxScale: 0.75,
            maxWidth: 1920,
            maxHeight: 1295,
            onCreated: (DiagonalScrollViewController controller) {
              controller.moveTo(
                location: Offset(900, 300),
              );
            },
            onScaleChanged: (double scale) {
              // print('On scale changed');
            },
            child: Container(
              width: 1920,
              height: 1295,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/frames/map.png'),
                  fit: BoxFit.contain,
                  repeat: ImageRepeat.noRepeat,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 600,
                    left: 1453,
                    child: GestureDetector(
                      onTap: () async {
                        await _manageLoginScreenViewModel.logout(context);
                      },
                      child: Container(
                        height: 45,
                        width: 210,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
