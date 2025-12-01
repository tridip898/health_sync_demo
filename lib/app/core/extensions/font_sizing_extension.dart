extension FontSizeExtension on num {
  double fontSize(num maxVariation) {
    return this as double;
  }

  double fontHeight(int fontSize) {
    return this / fontSize;
  }
}
