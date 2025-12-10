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
}) => EdgeInsets.only(left: left, right: right, bottom: bottom, top: top);

// Symmetric
EdgeInsets padSym({double horizontal = 0, double vertical = 0}) =>
    EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

BorderRadius radius4 = BorderRadius.circular(4);
BorderRadius radius8 = BorderRadius.circular(8);
BorderRadius radius10 = BorderRadius.circular(10);
BorderRadius radius12 = BorderRadius.circular(12);
BorderRadius radius16 = BorderRadius.circular(16);
BorderRadius radius20 = BorderRadius.circular(20);
BorderRadius radius24 = BorderRadius.circular(24);

BorderRadius radius(double value) => BorderRadius.circular(value);

// Only specific corners
BorderRadius radiusOnly({
  double? topLeft,
  double? topRight,
  double? bottomLeft,
  double? bottomRight,
}) {
  return BorderRadius.only(
    topLeft: topLeft != null ? Radius.circular(topLeft) : Radius.zero,
    topRight: topRight != null ? Radius.circular(topRight) : Radius.zero,
    bottomLeft: bottomLeft != null ? Radius.circular(bottomLeft) : Radius.zero,
    bottomRight: bottomRight != null
        ? Radius.circular(bottomRight)
        : Radius.zero,
  );
}

// Vertical corners (top-left & top-right / bottom-left & bottom-right)
BorderRadius radiusVertical({double? top, double? bottom}) {
  return BorderRadius.vertical(
    top: top != null ? Radius.circular(top) : Radius.zero,
    bottom: bottom != null ? Radius.circular(bottom) : Radius.zero,
  );
}

// Horizontal corners (top-left & bottom-left / top-right & bottom-right)
BorderRadius radiusHorizontal({double? left, double? right}) {
  return BorderRadius.horizontal(
    left: left != null ? Radius.circular(left) : Radius.zero,
    right: right != null ? Radius.circular(right) : Radius.zero,
  );
}
