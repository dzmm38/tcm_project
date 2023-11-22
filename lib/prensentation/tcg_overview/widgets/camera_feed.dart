import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraFeed extends StatelessWidget {
  final CameraController cameraController;
  const CameraFeed({super.key, required this.cameraController});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    if (cameraController.value.isInitialized) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Transform.scale(
              scale: 1,
              child: CameraPreview(cameraController)),
          ),
        ],
      );
    }else{
      return Container(
        color: themeData.colorScheme.primary,
      );
    }
  }
}
