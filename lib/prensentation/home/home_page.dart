import 'package:flutter/material.dart';
import 'package:tcm_project/prensentation/home/widgets/carousel_horizontal.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.primary,
      appBar: AppBar(
        centerTitle: true,
        title: Text('TCCM', style: themeData.textTheme.displayLarge,),
        actions: const [
              CircleAvatar(backgroundImage: AssetImage('assets/images/Kaltsit.png'),)
            ],
        backgroundColor: themeData.appBarTheme.backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.power_settings_new),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/login'),
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CarouselHorizontal(),
        ],
      ),
    );
  }
}
