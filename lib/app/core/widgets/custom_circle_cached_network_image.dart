import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCircleCachedNetworkImage extends StatelessWidget {
  final String? imagePath;
  final double? width;
  final double? radius;

  const CustomCircleCachedNetworkImage(
    this.imagePath,
    this.width,
    this.radius, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath == null || imagePath!.isEmpty) {
      return _defaultAvatar();
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imagePath ?? "",
          height: width,
          width: width,
          fit: BoxFit.cover,
          placeholder: (context, url) => _defaultAvatar(),
          errorWidget: (BuildContext context, String url, dynamic error) =>
              _defaultAvatar(),
        ),
      ),
    );
  }

  Widget _defaultAvatar() {
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
  }
}
