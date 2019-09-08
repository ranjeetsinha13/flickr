import 'package:flutter/material.dart';
import 'home.dart';
import '../utils/theme.dart';

void main() => runApp(FlickrApp());

class FlickrApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Flickr", theme: appThemeData, home: Home());
  }
}
