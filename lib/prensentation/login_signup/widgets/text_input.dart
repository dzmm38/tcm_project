import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String textLabel;
  final bool isPassword;

  const TextInput({super.key, required this.textLabel, required this.isPassword});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SizedBox(
      width: 320,
      height: 90,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: themeData.appBarTheme.backgroundColor!),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    scrollPadding: const EdgeInsets.symmetric(vertical: 120),
                    style: const TextStyle(fontSize: 20),
                    obscureText: isPassword ? true: false,
                    decoration: const InputDecoration(
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 15),
            child: Container(
              decoration: BoxDecoration(
                color: themeData.colorScheme.primary,
              ),
              child: Text('  $textLabel  ', style: themeData.textTheme.bodyLarge!.copyWith(fontSize: 11, color: themeData.appBarTheme.backgroundColor, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}