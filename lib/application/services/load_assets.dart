

import 'dart:convert';
import 'package:flutter/material.dart';

Future loadAssets(context) async{
  final manifestJson = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
  final images = json.decode(manifestJson).keys.where((String key) => key.startsWith('assets/images'));
  return images;
}