import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/assets_contants.dart';

class Loading extends StatelessWidget {
  final double size;

  const Loading({super.key, this.size = 100});

  static bool isVisible = false;

  static show() {
    if (!isVisible) {
      isVisible = true;
      Get.dialog(Loading(), barrierDismissible: false);
    }
  }

  static hide() {
    if (isVisible) {
      isVisible = false;
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Center(child: Image.asset(loading, height: size)),
    );
  }
}
