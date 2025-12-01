import 'package:flutter/material.dart';

// height
Widget gapH4 = const SizedBox(height: 4);
Widget gapH8 = const SizedBox(height: 8);
Widget gapH10 = const SizedBox(height: 10);
Widget gapH12 = const SizedBox(height: 12);
Widget gapH16 = const SizedBox(height: 16);
Widget gapH20 = const SizedBox(height: 20);
Widget gapH24 = const SizedBox(height: 24);
// width
Widget gapW4 = const SizedBox(width: 4);
Widget gapW8 = const SizedBox(width: 8);
Widget gapW10 = const SizedBox(width: 10);
Widget gapW12 = const SizedBox(width: 12);
Widget gapW16 = const SizedBox(width: 16);
Widget gapW20 = const SizedBox(width: 20);
Widget gapW24 = const SizedBox(width: 24);

Widget gapH(double height) => SizedBox(height: height);

Widget gapW(double width) => SizedBox(width: width);

//spacing
// All
EdgeInsets padAll5 = const EdgeInsets.all(5);
EdgeInsets padAll8 = const EdgeInsets.all(8);
EdgeInsets padAll10 = const EdgeInsets.all(10);
EdgeInsets padAll12 = const EdgeInsets.all(12);
EdgeInsets padAll16 = const EdgeInsets.all(16);
EdgeInsets padAll20 = const EdgeInsets.all(20);
EdgeInsets padAll24 = const EdgeInsets.all(24);

EdgeInsets padAll(double all) => EdgeInsets.all(all);

// LR
EdgeInsets padLR5 = const EdgeInsets.symmetric(horizontal: 5);
EdgeInsets padLR8 = const EdgeInsets.symmetric(horizontal: 8);
EdgeInsets padLR10 = const EdgeInsets.symmetric(horizontal: 10);
EdgeInsets padLR12 = const EdgeInsets.symmetric(horizontal: 12);
EdgeInsets padLR16 = const EdgeInsets.symmetric(horizontal: 16);
EdgeInsets padLR20 = const EdgeInsets.symmetric(horizontal: 20);
EdgeInsets padLR24 = const EdgeInsets.symmetric(horizontal: 24);

EdgeInsets padLR(double horizontal) =>
    EdgeInsets.symmetric(horizontal: horizontal);

// TB
EdgeInsets padTB5 = const EdgeInsets.symmetric(vertical: 5);
EdgeInsets padTB8 = const EdgeInsets.symmetric(vertical: 8);
EdgeInsets padTB10 = const EdgeInsets.symmetric(vertical: 10);
EdgeInsets padTB12 = const EdgeInsets.symmetric(vertical: 12);
EdgeInsets padTB16 = const EdgeInsets.symmetric(vertical: 16);
EdgeInsets padTB20 = const EdgeInsets.symmetric(vertical: 20);
EdgeInsets padTB24 = const EdgeInsets.symmetric(vertical: 24);

EdgeInsets padTB(double vertical) => EdgeInsets.symmetric(vertical: vertical);

// only
EdgeInsets padOnly({
  double top = 0,
  double bottom = 0,
  double left = 0,
  double right = 0,
}) =>
    EdgeInsets.only(
      left: left,
      right: right,
      bottom: bottom,
      top: top,
    );

// Symmetric
EdgeInsets padSym({
  double horizontal = 0,
  double vertical = 0,
}) =>
    EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );
