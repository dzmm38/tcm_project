import 'package:flutter/material.dart';

class Collection extends StatelessWidget {
  const Collection({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      color: themeData.colorScheme.primary,
      child: Center(
        child: Text('TODO Collection Seite', style: themeData.textTheme.displayLarge),
      ),
    );
  }
}