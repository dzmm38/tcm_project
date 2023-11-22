import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tcm_project/application/camera/bloc/camera_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Size size;
  final String tcgImagePath;
  const CustomAppBar({super.key, required this.size, required this.tcgImagePath});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          SizedBox(
            height: 80,
            child: AppBar(
              leading: BackButton(
                onPressed: () {
                  BlocProvider.of<CameraBloc>(context).add(CameraCloseEvent());
                  Navigator.of(context).pop();
                },
              ),
              backgroundColor: themeData.appBarTheme.backgroundColor,
              centerTitle: true,
              actions: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Kaltsit.png'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 23),
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 100,
                width: 200,
                child: Center(
                  child: SimpleShadow(
                    opacity: 0.3,
                    color: Colors.black,
                    offset: const Offset(8, 8),
                    sigma: 1,
                    child: Image(image: AssetImage(tcgImagePath)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize => Size(size.width, 100);
}