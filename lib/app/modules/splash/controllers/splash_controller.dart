import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<Offset> leftTextAnimation;
  late Animation<Offset> rightTextAnimation;

  late AnimationController fadeController;
  late Animation<double> fadeAnimation;

  late AnimationController pulseController;
  late Animation<double> scaleAnimation;
  late Animation<double> glowAnimation;

  @override
  void onInit() {
    super.onInit();

    // Pulse controller (1.2 seconds looping)
    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: pulseController, curve: Curves.easeInOut),
    );

    glowAnimation = Tween<double>(begin: 0.2, end: 0.5).animate(
      CurvedAnimation(parent: pulseController, curve: Curves.easeInOut),
    );

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    leftTextAnimation =
        Tween<Offset>(begin: const Offset(-1.5, 0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    rightTextAnimation =
        Tween<Offset>(begin: const Offset(1.5, 0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    /// Fade-in animation AFTER slide completes
    fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: fadeController, curve: Curves.easeIn));

    animationController.forward();

    /// Start fade after slide completes
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        fadeController.forward();
      }
    });

    animationController.forward();
  }

  @override
  void onReady() async {
    Future.delayed(Duration(milliseconds: 2500), () {
      if (appController.token == null) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.offAllNamed(Routes.DASHBOARD);
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    animationController.dispose();
    fadeController.dispose();
    pulseController.dispose();
    super.onClose();
  }
}
