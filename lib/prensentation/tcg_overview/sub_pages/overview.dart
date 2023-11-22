import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      color: themeData.colorScheme.primary,
      child: Center(
        child: Text('TODO Home Seite', style: themeData.textTheme.displayLarge,),
      ),
    );
  }
}