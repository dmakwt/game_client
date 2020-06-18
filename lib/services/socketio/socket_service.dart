import 'package:flutter/material.dart';
import 'package:game_client/config/api_key.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  IO.Socket socket;

  createSocketConnection({@required String usernameID}) {
    socket = IO.io(APIKeys.socketUrl, <String, dynamic>{
      'transports': ['websocket'],
    });

    this.socket.on('connect', (_) {
      print('Socket connecting $usernameID');
      this.socket.emit('join', usernameID);
    });


    this.socket.on('disconnect', (_) => print('Disconnected'));


    this.socket.on('profileChanged', (profile) => print(profile));
  }
}
