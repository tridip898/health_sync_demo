import 'package:flutter/material.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;
  final bool show;
  final String bannerName;
  final Color bannerColor;

  const FlavorBanner({
    required this.child,
    required this.show,
    required this.bannerName,
    this.bannerColor = Colors.red,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!show) return child;

    return Stack(
      children: [
        child,
        Banner(
          message: bannerName.toUpperCase(),
          location: BannerLocation.topStart,
          color: bannerColor,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}
