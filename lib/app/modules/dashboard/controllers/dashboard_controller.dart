import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardController extends GetxController {
  final currentIndex = 0.obs;

  final name = 'Alex'.obs;
  final greeting = 'Good Morning,'.obs;
  final subtitle = 'Your Health Hub'.obs;
  final profileImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDIl-bskxXIrt4RZgLmVcEIit2POBFObH0x5FOXNNv7xSZ0bF9zjyxY2z_yfeDIoWgBm9mQcudFPU2deDM81zth5wmjCJb7pg6ZlxFakCR34lW8zw6HOAFXrfu35ZAYP947qbDBlmjGffxrdY4ZDDD_bMm232wll3c-2CzYc5awvFzqXKMcldJytL03ZyLPvDynEjb2cpCfYDaUZ1mltxbhjq2iRbggjZH2sP960nGjAgRA0cZeEzlkQnEV2ulJSAmyyl3RJrnLH8c';

  void onTab(int idx) => currentIndex.value = idx;

  Future<void> openCallChooser(BuildContext context) async {
    final telUrl = Uri.parse('tel:01712168421');

    if (Platform.isAndroid) {
      final intent = AndroidIntent(
        action: 'android.intent.action.CALL',
        data: telUrl.toString(),
        package: '',
      );
      await intent.launch();
    } else if (Platform.isIOS) {
      if (await canLaunchUrl(telUrl)) {
        await launchUrl(telUrl);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cannot launch call')),
        );
      }
    }
  }
}
