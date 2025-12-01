import 'package:flutter/material.dart';

abstract class RandomColor {
  static const List<MaterialColor> _colors = [
    Colors.cyan,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.pink,
    Colors.blueGrey,
    Colors.purple,
    Colors.yellow,
    Colors.teal,
  ];

  static Color getTextColor(int index) {
    //return _colors[index % _colors.length].shade700;
    return Color(index==1?0xffEC008C:0xff027A48);
  }

  static Color getBgColor(int index) {
   // return _colors[index % _colors.length].shade100;
    return Color(index==1?0xffFDE6F4:0xffD1FADF);
  }
}
