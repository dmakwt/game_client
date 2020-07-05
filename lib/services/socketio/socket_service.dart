import 'package:flutter/material.dart';
import 'package:game_client/models/profile.dart';
import 'package:game_client/logger.dart';
import 'package:game_client/services/service_locator.dart';
import 'package:game_client/view_models/home/status_appbar_viewmodel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:game_client/config/api_key.dart';

class SocketService {
  IO.Socket socket;

  final logger = getLogger('ManageLoginScreenViewModel');

  final StatusAppbarViewModel statusAppbarModel =
      serviceLocator<StatusAppbarViewModel>();

  createSocketConnection({@required String usernameID}) {
    socket = IO.io(APIKeys.socketUrl, <String, dynamic>{
      'transports': ['websocket'],
    });

    this.socket.on('connect', (_) {
      logger.i('Socket connecting $usernameID');
      this.socket.emit('join', usernameID);
    });

    this.socket.on('disconnect', (_) => print('Disconnected'));

    this.socket.on('statusAppbarChanged', (profile) {
      // print(Profile.fromJson(profile));
      logger.i('status app bar envent');

      statusAppbarModel.updateData(Profile.fromJson(profile));
    });
  }
}
