import 'package:diagonal_scrollview/diagonal_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:game_client/services/service_locator.dart';
import 'package:game_client/services/storage/storage_service.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  DiagonalScrollViewController _controller;
  final StorageService _storageService = serviceLocator<StorageService>();

  @override
  void initState() {
    super.initState();
    print(
      _storageService.getToken(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('as'),
      ),
      body: Stack(
        children: <Widget>[
          DiagonalScrollView(
            enableFling: true,
            enableZoom: true,
            minScale: 0.8,
            maxScale: 1,
            maxWidth: 1920,
            maxHeight: 1295,
            onCreated: (DiagonalScrollViewController controller) {
              controller.moveTo(
                location: Offset(900, 300),
              );
            },
            onScaleChanged: (double scale) {
              print('On scale changed');
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
                    child: Container(
                      height: 45,
                      width: 210,
                      color: Colors.red,
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
