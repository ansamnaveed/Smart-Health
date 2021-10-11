import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

MaterialColor themePrimaryColor = MaterialColor(0xEF4132, colorMap);
Map<int, Color> colorMap = {
  50: Color.fromRGBO(239, 66, 54, .1),
  100: Color.fromRGBO(239, 66, 54, .2),
  200: Color.fromRGBO(239, 66, 54, .3),
  300: Color.fromRGBO(239, 66, 54, .4),
  400: Color.fromRGBO(239, 66, 54, .5),
  500: Color.fromRGBO(239, 66, 54, .6),
  600: Color.fromRGBO(239, 66, 54, .7),
  700: Color.fromRGBO(239, 66, 54, .8),
  800: Color.fromRGBO(239, 66, 54, .9),
  900: Color.fromRGBO(239, 66, 54, 1),
};
String image = "assets/images/icon-user.png";

File profilePicture;
int bottomIndex;
bool isWatched = false;
Widget gradientButton(String text, Function onPressed) {
  return GradientButton(
    child: Text(
      text,
      style: TextStyle(color: Colors.white),
    ),
    callback: () => onPressed(),
    increaseWidthBy: double.infinity,
    increaseHeightBy: 15,
    shapeRadius: BorderRadius.circular(30),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color.fromRGBO(65, 65, 67, 1),
        Color.fromRGBO(239, 66, 54, 1),
      ],
    ),
  );
}
