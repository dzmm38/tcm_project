part of 'camera_bloc.dart';

@immutable
sealed class CameraEvent {}

final class CameraLoadEvent extends CameraEvent {}

final class CameraCloseEvent extends CameraEvent {}
