import 'package:flutter/material.dart';

abstract class BaseTextStyles {
  TextStyle get textStyle;

  TextTheme get textTheme;

  FontStyles get bold;

  FontStyles get semiBold;

  FontStyles get medium;

  FontStyles get regular;
}

class FontStyles {
  final TextStyle s72;
  final TextStyle s60;
  final TextStyle s48;
  final TextStyle s36;
  final TextStyle s30;
  final TextStyle s22;

  final TextStyle s24;
  final TextStyle s20;
  final TextStyle s18;
  final TextStyle s16;
  final TextStyle s14;
  final TextStyle s12;
  final TextStyle s10;
  final TextStyle s8;
  final TextStyle s6;

  FontStyles({
    required this.s72,
    required this.s60,
    required this.s48,
    required this.s36,
    required this.s30,
    required this.s22,
    required this.s24,
    required this.s20,
    required this.s18,
    required this.s16,
    required this.s14,
    required this.s12,
    required this.s10,
    required this.s8,
    required this.s6,
  });
}
