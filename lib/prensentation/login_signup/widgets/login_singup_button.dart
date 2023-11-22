import 'package:flutter/material.dart';

class LoginSignUpButton extends StatelessWidget {
  final String buttonText;
  final Function ontab;
  final bool pressed;
  
  const LoginSignUpButton({super.key, required this.buttonText, required this.ontab, required this.pressed});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return GestureDetector(
      onTap: () => ontab(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 40,
        width: 130,
        decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: pressed ? []: [ 
            BoxShadow(
              color: themeData.colorScheme.surface,
              offset: const Offset(6, 6),
              blurRadius: 15,
              spreadRadius: 1
          ), BoxShadow(
              color: themeData.colorScheme.onSurface,
              offset: const Offset(-6, -6),
              blurRadius: 15,
              spreadRadius: 1
          )
          ],
          border: pressed ? Border.all(color: Colors.white) : const Border()
        ),
        child: Center(child: Text(buttonText, style: themeData.textTheme.displayLarge)),
      ),
    );
  }
}