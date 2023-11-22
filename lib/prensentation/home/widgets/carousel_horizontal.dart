import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcm_project/prensentation/home/widgets/carousel_item.dart';
import 'package:tcm_project/application/services/load_assets.dart' as test;

class CarouselHorizontal extends StatelessWidget {
  Future<List<String>> loadImagePaths() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) => key.startsWith('assets/images/tcg_logos/'))
        .toList();

    return imagePaths;
  }
  const CarouselHorizontal({super.key});

  @override
  Widget build(BuildContext context){
    test.loadAssets(context);
    final size = MediaQuery.of(context).size;
    
    return SizedBox(
      height: size.height * 0.4,
      child: Center(
        child: FutureBuilder<List<String>>(
          future: loadImagePaths(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: PageController(viewportFraction: 0.85),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final imagePath = snapshot.data![index];
                return CarouselItem(height: 200, sidePadding: 10, imageWidth: 350, imagePath: imagePath, heightPadding: 40);
              },
            );
          },
        ),
      ),
    );
  }
}