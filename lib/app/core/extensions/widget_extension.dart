import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../config/color/base_color.dart';
import '../config/styles/base_text_styles.dart';
import '../controller/app_controller.dart';
import '../translations/translation_base.dart';

extension GetViewExtension on GetView {
  AppController get appController => Get.find<AppController>();

  TranslationBase get tr => appController.tr.value;

  BaseColor get cyan => appController.cyan;

  BaseColor get blue => appController.blue;

  BaseColor get gray => appController.gray;

  BaseColor get magenda => appController.magenda;

  BaseColor get red => appController.red;

  BaseColor get yellow => appController.yellow;

  BaseColor get green => appController.green;

  BaseTextStyles get textStyle => appController.textStyle;
}

extension GetViewControllerExtension on GetxController {
  AppController get appController => Get.find<AppController>();

  TranslationBase get tr => appController.tr.value;

  BaseColor get cyan => appController.cyan;

  BaseColor get blue => appController.blue;

  BaseColor get gray => appController.gray;

  BaseColor get magenda => appController.magenda;

  BaseColor get red => appController.red;

  BaseColor get yellow => appController.yellow;

  BaseColor get green => appController.green;

  BaseTextStyles get textStyle => appController.textStyle;
}

extension StatelessExtension on StatelessWidget {
  AppController get appController => Get.find<AppController>();

  TranslationBase get tr => appController.tr.value;

  BaseColor get cyan => appController.cyan;

  BaseColor get blue => appController.blue;

  BaseColor get gray => appController.gray;

  BaseColor get magenda => appController.magenda;

  BaseColor get red => appController.red;

  BaseColor get yellow => appController.yellow;

  BaseColor get green => appController.green;

  BaseTextStyles get textStyle => appController.textStyle;
}

extension StatefulExtension on State {
  AppController get appController => Get.find<AppController>();

  TranslationBase get tr => appController.tr.value;

  BaseColor get cyan => appController.cyan;

  BaseColor get blue => appController.blue;

  BaseColor get gray => appController.gray;

  BaseColor get magenda => appController.magenda;

  BaseColor get red => appController.red;

  BaseColor get yellow => appController.yellow;

  BaseColor get green => appController.green;

  BaseTextStyles get textStyle => appController.textStyle;
}
