import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCircleCachedNetworkImage extends StatelessWidget {
  final String? imagePath;
  final double? width, padding, radius;

  const CustomCircleCachedNetworkImage(
    this.imagePath,
    this.width,
    this.radius, {
    super.key,
    this.padding = 8,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imagePath ?? "",
          height: width,
          width: width,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, child, loadingProgress) {
            return SizedBox(
              height: width,
              width: width,
              child: CircleAvatar(
                backgroundColor: Colors.grey.withValues(alpha: .2),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Image.asset('assets/user.png'),
                ),
              ),
            );
          },
          errorWidget: (BuildContext context, String url, dynamic error) {
            return SizedBox(
              height: width,
              width: width,
              child: CircleAvatar(
                backgroundColor: Colors.grey.withValues(alpha: .2),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Image.asset('assets/user.png'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
