import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/assets_contants.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padAll20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH(36),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFCE2CA),
                  shape: BoxShape.circle,
                ),
                padding: padAll12,
                child: Image.asset(questionnaireIcon, height: 30),
              ),
              gapH12,
              Text(
                "Start your questionnaire",
                style: textStyle.displayFontStyle.md,
              ),
              gapH8,
              Text(
                "Please answer some questions about your health issues. That will help us to suggest you a specialist doctor based on your answers.",
                style: textStyle.mediumFontStyle.sm.copyWith(
                  color: gray.base500,
                ),
                textAlign: TextAlign.start,
              ),
              Spacer(),
              SizedBox(
                width: double.maxFinite,
                child: CustomButton(text: "Continue", onPressed: controller.nextClick),
              ),
              gapH20,
            ],
          ),
        ),
      ),
    );
  }
}
