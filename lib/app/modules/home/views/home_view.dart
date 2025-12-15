import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/asset_path.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Questionnaire',
        needLeadingIcon: false,
        actions: [
          IconButton(onPressed: controller.onLogout, icon: Icon(Icons.logout)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: padAll20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFCE2CA),
                  shape: BoxShape.circle,
                ),
                padding: padAll12,
                child: Image.asset(questionnaireIcon, height: 30),
              ),
              gapH12,
              Text("Start your questionnaire", style: textStyle.bold.s30),
              gapH8,
              Text(
                "Please answer some questions about your health issues. That will help us to suggest you a specialist doctor based on your answers.",
                style: textStyle.medium.s12.copyWith(color: gray.base500),
                textAlign: TextAlign.start,
              ),
              Spacer(),
              SizedBox(
                width: double.maxFinite,
                child: CustomButton(
                  text: "Continue",
                  onPressed: controller.nextClick,
                ),
              ),
              gapH20,
            ],
          ),
        ),
      ),
    );
  }
}
