import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../config/color/base_color.dart';
import '../config/styles/base_text_styles.dart';
import '../controller/app_controller.dart';
import '../translations/translation_base.dart';

extension GetViewExtension on GetView {
  AppController get appController => Get.find<AppController>();

  TranslationBase get tr => appController.tr.value;

  Duration get defaultAnimationDuration =>
      appController.defaultAnimationDuration;

  Color get white => appController.white;

  Color get black => appController.black;

  BaseColor get primary => appController.primary;

  BaseColor get secondary => appController.secondary;

  BaseColor get gray => appController.gray;

  BaseColor get magendaClient => appController.magendaClient;

  BaseColor get error => appController.error;

  BaseColor get warning => appController.warning;

  BaseColor get success => appController.success;

  BaseTextStyles get textStyle => appController.textStyle;
}

extension GetViewControllerExtension on GetxController {
  AppController get appController => Get.find<AppController>();

  TranslationBase get tr => appController.tr.value;

  Duration get defaultAnimationDuration =>
      appController.defaultAnimationDuration;

  Color get white => appController.white;

  Color get black => appController.black;

  BaseColor get primary => appController.primary;

  BaseColor get secondary => appController.secondary;

  BaseColor get gray => appController.gray;

  BaseColor get magendaClient => appController.magendaClient;

  BaseColor get error => appController.error;

  BaseColor get warning => appController.warning;

  BaseColor get success => appController.success;

  BaseTextStyles get textStyle => appController.textStyle;
}

extension StatelessExtension on StatelessWidget {
  AppController get appController => Get.find<AppController>();

  TranslationBase get tr => appController.tr.value;

  Duration get defaultAnimationDuration =>
      appController.defaultAnimationDuration;

  Color get white => appController.white;

  Color get black => appController.black;

  BaseColor get primary => appController.primary;

  BaseColor get secondary => appController.secondary;

  BaseColor get gray => appController.gray;

  BaseColor get magendaClient => appController.magendaClient;

  BaseColor get error => appController.error;

  BaseColor get warning => appController.warning;

  BaseColor get success => appController.success;

  BaseTextStyles get textStyle => appController.textStyle;
}

extension StatefulExtension on State {
  AppController get appController => Get.find<AppController>();

  TranslationBase get tr => appController.tr.value;

  Duration get defaultAnimationDuration =>
      appController.defaultAnimationDuration;

  Color get white => appController.white;

  Color get black => appController.black;

  BaseColor get primary => appController.primary;

  BaseColor get secondary => appController.secondary;

  BaseColor get gray => appController.gray;

  BaseColor get magendaClient => appController.magendaClient;

  BaseColor get error => appController.error;

  BaseColor get warning => appController.warning;

  BaseColor get success => appController.success;

  BaseTextStyles get textStyle => appController.textStyle;
}
