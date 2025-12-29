import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/asset_path.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_cache_network_image.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import 'custom_circle_cached_network_image.dart';

class CustomImagePicker extends StatelessWidget {
  final String title;
  final String instructionText;
  final VoidCallback onTap;
  final File? selectedImage;
  final VoidCallback? onRemove;
  final bool? isEditable;
  final bool isCircle;
  final String? remoteSource;

  const CustomImagePicker({
    super.key,
    required this.title,
    required this.instructionText,
    required this.onTap,
    this.selectedImage,
    this.onRemove,
    this.isEditable,
    this.isCircle = false,
    this.remoteSource,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if (title.isNotEmpty) Text(title, style: textStyle.semiBold.s16),
        // gapH8,
        isCircle
            ? selectedImage != null && isEditable == true
                  ? Stack(
                      children: [
                        CircleAvatar(
                          radius: 65,
                          backgroundImage: FileImage(
                            File(selectedImage?.path ?? ''),
                          ),
                        ),
                        imageCapture(),
                      ],
                    )
                  : (remoteSource ?? "") != ""
                  ? Stack(
                      children: [
                        CustomCircleCachedNetworkImage(
                          remoteSource ?? '',
                          130,
                          65,
                        ),
                        imageCapture(),
                      ],
                    )
                  : Material(
                      elevation: 0,
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: onTap,
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: .2),
                            shape: BoxShape.circle,
                          ),
                          padding: padAll24,
                          child: Image.asset(
                            'assets/add_profile.png',
                            height: 90,
                            width: 90,
                          ),
                        ),
                      ),
                    )
            : InkWell(
                onTap: selectedImage == null && isEditable == true
                    ? onTap
                    : null,
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F3F3),
                    borderRadius: radius8,
                    border: DashedBorder.all(
                      color: gray.base200,
                      width: 1.5,
                      dashLength: 6,
                    ),
                  ),
                  child: selectedImage != null
                      ? Stack(
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: getImageWidget(selectedImage),
                              ),
                            ),
                            if (isEditable == true)
                              Positioned(
                                right: 8,
                                top: 8,
                                child: GestureDetector(
                                  onTap: onRemove,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(999),
                                      color: gray.base200,
                                    ),
                                    child: Icon(Icons.close),
                                  ),
                                ),
                              ),
                          ],
                        )
                      : remoteSource != null && remoteSource!.isNotEmpty
                      ? Stack(
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: getImageWidget(remoteSource),
                              ),
                            ),
                            // if (isEditable==true)
                            // Positioned(
                            //   right: 8,
                            //   top: 8,
                            //   child: GestureDetector(
                            //     onTap: onRemove,
                            //     child: AppCard(
                            //       color: Color(0xFFEBEBEB),
                            //       cardRadius: BorderRadius.circular(999),
                            //       child: Image.asset(ImagePath.crossIcon),
                            //     ),
                            //   ),
                            // )
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AssetPath.noDataFoundIcon),
                            gapH12,
                            RichText(
                              text: TextSpan(
                                style: textStyle.semiBold.s16,
                                children: [
                                  TextSpan(
                                    text: instructionText,
                                    style: textStyle.semiBold.s16,
                                  ),
                                  TextSpan(
                                    text: ' Browse',
                                    style: textStyle.semiBold.s16,
                                  ),
                                ],
                              ),
                            ),
                            gapH8,
                            Text(
                              "Accepted formats: JPG, JPEG, PNG\nSize: Less then 5 mb",
                              style: textStyle.regular.s14,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                ),
              ),
      ],
    );
  }

  imageCapture() {
    return Positioned(
      bottom: 6,
      right: 2,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Icon(Icons.camera_alt_outlined, color: Colors.white, size: 18),
        ),
      ),
    );
  }

  Widget getImageWidget(dynamic imageSource) {
    if (imageSource is File) {
      return Image.file(
        imageSource,
        height: 150,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }
    if (imageSource is String && imageSource.isNotEmpty) {
      final uri = Uri.tryParse(imageSource);
      if (uri != null &&
          (uri.isAbsolute && (uri.scheme == 'http' || uri.scheme == 'https'))) {
        return CacheNetworkImage(
          imageUrl: imageSource,
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover,
        );
      }
      return Image.asset(
        imageSource,
        height: 150,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }

    // Fallback widget if none of the above conditions match
    return const SizedBox();
  }
}
