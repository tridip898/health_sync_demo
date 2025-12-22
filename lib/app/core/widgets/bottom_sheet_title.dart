import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

class BottomSheetTitle extends StatelessWidget {
  final String title;
  final Function()? onCloseTap;
  final double horizontalPadding;
  final double verticalPadding;

  const BottomSheetTitle({
    super.key,
    required this.title,
    this.onCloseTap,
    this.horizontalPadding = 16,
    this.verticalPadding = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Container(
          height: 3,
          width: 60,
          decoration: BoxDecoration(
            color: gray.base400,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: textStyle.bold.s20),
              GestureDetector(
                onTap: onCloseTap ?? Get.back,
                child: const Icon(Icons.close),
              ),
            ],
          ),
        ),
      ],
    );
    // return Container(
    //   height: 52,
    //   padding: padOnly(bottom: 8),
    //   alignment: Alignment.topCenter,
    //   decoration: BoxDecoration(
    //     border: Border(bottom: BorderSide(color: gray.base200, width: 1)),
    //   ),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Expanded(
    //         child: Align(
    //           alignment: Alignment.centerLeft,
    //           child: IconButton(
    //             onPressed: Get.back,
    //             icon: Icon(Icons.arrow_back_ios, size: 18),
    //           ),
    //         ),
    //       ),
    //       Center(
    //         child: Text(
    //           title,
    //           style: textStyle.medium.s14.copyWith(color: gray.base1000),
    //         ),
    //       ),
    //       Spacer(),
    //     ],
    //   ),
    // );
  }
}