import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: controller.scaleAnimation,
            child: Container(
              height: 96,
              width: 96,
              decoration: BoxDecoration(
                color: green.base500.withOpacity(controller.glowAnimation.value),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.health_and_safety,
                size: 48,
                color: green.base500,
              ),
            ),
          ),
          gapH(32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: controller.leftTextAnimation,
                child: Text("Health", style: textStyle.bold.s36),
              ),
              const SizedBox(width: 8),
              SlideTransition(
                position: controller.rightTextAnimation,
                child: Text("Sync", style: textStyle.bold.s36),
              ),
            ],
          ),
          FadeTransition(
            opacity: controller.fadeAnimation,
            child: Text(
              "Your health, synchronized",
              style: textStyle.medium.s18,
            ),
          ),
        ],
      ),
    );
  }
}
