part of 'camera_bloc.dart';

@immutable
sealed class CameraState {}

final class CameraInitial extends CameraState {}

final class CameraLoadingState extends CameraState {}

final class CameraLoadedState extends CameraState {
  final CameraController cameraController;
  CameraLoadedState({required this.cameraController});
}
