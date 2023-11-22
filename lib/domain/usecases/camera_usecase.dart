import 'package:camera/camera.dart';

class CameraUsecase{
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  bool cameraUsed = false;
  
  Future<void> initializeController()async {
    cameraUsed = true;
    cameras = await availableCameras();
    cameraController = CameraController(cameras[0], ResolutionPreset.max, enableAudio: false);
    await cameraController.initialize();
  }

  void closeCamera() {
    if (cameraUsed){
      cameraController.dispose();
    }
  }
}