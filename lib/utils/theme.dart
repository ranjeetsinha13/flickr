import 'package:flutter/material.dart';

final ThemeData appThemeData = new ThemeData(
    dividerColor: Colors.white,
    brightness: Brightness.light,
    primarySwatch: Colors.blueGrey,
    accentColor: Colors.deepOrange,
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      title: TextStyle(
          fontSize: 16.0, fontStyle: FontStyle.normal, color: Colors.black87),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ));

final TextStyle movieListTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27);

final TextStyle movieRatingTextStyle =
    TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 35);
