import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcm_project/application/camera/bloc/camera_bloc.dart';
import 'package:tcm_project/prensentation/tcg_overview/widgets/camera_feed.dart';

class Scanner extends StatelessWidget {
  final int activePageIndex;
  const Scanner({super.key, required this.activePageIndex});

  @override
  Widget build(BuildContext context) {
    final cameraBloc = BlocProvider.of<CameraBloc>(context);
    final themeData = Theme.of(context);
    
    //! Vllt sollte das hier eine Page früher gemacht werden !!!!!
    if (activePageIndex == 2){
      cameraBloc.add(CameraLoadEvent());
    }else{
      cameraBloc.add(CameraCloseEvent());
    }
    
    return BlocBuilder<CameraBloc, CameraState>(
      bloc: cameraBloc,
      builder: (context, state) {
        if (state is CameraInitial) {
          return Container(
            color: themeData.colorScheme.primary
          );
        }else if (state is CameraLoadingState){
          return CircularProgressIndicator(
            color: themeData.appBarTheme.backgroundColor,
          );
        }else if (state is CameraLoadedState){
          CameraController cameraController = state.cameraController;
          return CameraFeed(cameraController: cameraController);
        }else{
          return Container(
            color: themeData.colorScheme.primary
          );
        }
      });
  }
}