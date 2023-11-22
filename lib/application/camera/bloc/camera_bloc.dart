import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:meta/meta.dart';
import 'package:tcm_project/domain/usecases/camera_usecase.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(CameraInitial()) {
    //* Variables
    final CameraUsecase cameraUsecase = CameraUsecase();

    //* Event Handling 
    on<CameraLoadEvent>((event, emit) async{
      emit(CameraLoadingState());
      await cameraUsecase.initializeController();
      CameraController cameraController = cameraUsecase.cameraController;
      emit(CameraLoadedState(cameraController: cameraController));
    });

    on<CameraCloseEvent>((event, emit) { 
      cameraUsecase.closeCamera();
      emit(CameraInitial());
    });
  }
}
