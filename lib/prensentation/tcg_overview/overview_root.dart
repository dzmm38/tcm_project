import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcm_project/application/camera/bloc/camera_bloc.dart';
import 'package:tcm_project/application/utility/bloc/utility_bloc.dart';
import 'package:tcm_project/prensentation/tcg_overview/sub_pages/collection.dart';
import 'package:tcm_project/prensentation/tcg_overview/sub_pages/scanner.dart';
import 'package:tcm_project/prensentation/tcg_overview/widgets/custom_appbar.dart';
import 'package:tcm_project/prensentation/tcg_overview/sub_pages/overview.dart';

class OverviewRoot extends StatelessWidget {
  final String tcgImagePath;
  const OverviewRoot({super.key, required this.tcgImagePath});

  //! Weiß noch nicht ob ich das brauche aber sicherheisthablber mal stehen lassen !!!
  String getTcgName(String path) {
    String tcgName = '';
    int lastSlash = path.lastIndexOf('/');
    int dot = path.lastIndexOf('.');
    if (lastSlash != -1 && dot != -1 && lastSlash < dot) {
      tcgName = path.substring(lastSlash + 1, dot);
    }
    return tcgName;
  }

  @override
  Widget build(BuildContext context) {
    final indexBloc = UtilityBloc();
    final Size size = MediaQuery.of(context).size;
    final themeData = Theme.of(context);
    int currentIndex = 0;
    return BlocProvider(
      create: (BuildContext context) => CameraBloc(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: themeData.colorScheme.primary,
        appBar: CustomAppBar(
          size: size,
          tcgImagePath: tcgImagePath,
        ),
        bottomNavigationBar: BlocBuilder<UtilityBloc, UtilityState>(
          bloc: indexBloc,
          builder: (context, state) {
            if (state is NavigationBarButtonSwitched) {
              currentIndex = state.index;
            } else {
              currentIndex = 0;
            }
            return BottomNavigationBar(
              onTap: (index) =>
                  indexBloc.add(NavigationBarButtonPressed(index)),
              currentIndex: currentIndex,
              unselectedItemColor: themeData.colorScheme.onPrimary,
              selectedItemColor: Colors.white,
              iconSize: 30,
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(Icons.home),
                    label: 'Home',
                    backgroundColor:
                        themeData.bottomNavigationBarTheme.backgroundColor),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.book),
                    label: 'Collection',
                    backgroundColor:
                        themeData.bottomNavigationBarTheme.backgroundColor),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.camera),
                    label: 'Scanner',
                    backgroundColor:
                        themeData.bottomNavigationBarTheme.backgroundColor),
              ],
            );
          },
        ),
        body: BlocBuilder<UtilityBloc, UtilityState>(
          bloc: indexBloc,
          builder: (context, state) {
            return IndexedStack(
              index: currentIndex, 
              children: [
                const Overview(),
                const Collection(),
                Scanner(activePageIndex: currentIndex),
              ]);
          },
        ),
      ),
    );
  }
}
