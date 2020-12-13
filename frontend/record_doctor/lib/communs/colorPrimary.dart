import 'package:flutter/material.dart';

class PrimaryColor {
  Map<int, Color> color = {
    50: Color.fromRGBO(59, 168, 170, .1),
    100: Color.fromRGBO(59, 168, 170, .2),
    200: Color.fromRGBO(59, 168, 170, .3),
    300: Color.fromRGBO(59, 168, 170, .4),
    400: Color.fromRGBO(59, 168, 170, .5),
    500: Color.fromRGBO(59, 168, 170, .6),
    600: Color.fromRGBO(59, 168, 170, .7),
    700: Color.fromRGBO(59, 168, 170, .8),
    800: Color.fromRGBO(59, 168, 170, .9),
    900: Color.fromRGBO(59, 168, 170, 1),
  };

  MaterialColor getColor() {
    return MaterialColor(0xFF3BA8AA, color);
  }
}
