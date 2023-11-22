import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final double height;
  final double sidePadding;
  final double heightPadding;
  final double imageWidth;
  final String imagePath;
  const CarouselItem(
      {super.key,
      required this.height,
      required this.sidePadding,
      required this.imageWidth,
      required this.imagePath,
      required this.heightPadding});

  @override
  Widget build(BuildContext context) {
      final themeData = Theme.of(context);
    return SizedBox(
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: sidePadding, vertical: heightPadding),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/overview_root',
              arguments: {'tcgImagePath': imagePath});
          },
          child: Material(
            borderRadius: BorderRadius.circular(12),
            elevation: 15,
            child: Container(
              decoration: BoxDecoration(
                color: themeData.colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image(
                image: AssetImage(imagePath),
                width: imageWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
