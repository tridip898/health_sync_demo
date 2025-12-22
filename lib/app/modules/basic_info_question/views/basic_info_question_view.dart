import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/modules/basic_info_question/controllers/basic_info_question_controller.dart';
import 'package:health_sync_question/app/modules/basic_info_question/views/basic_info_complaint_response_view.dart';
import 'package:health_sync_question/app/modules/basic_info_question/views/basic_info_submit_view.dart';

class BasicInfoQuestionView extends GetView<BasicInfoQuestionController> {
  const BasicInfoQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Basic Information",
        needRefreshBtn: true,
        refreshBtnClick: controller.refreshButtonClick,
      ),
      body: SafeArea(
        child: Obx(() {
          return controller.complaintAnswers.isNotEmpty ||
                  (controller.patientInfo.value.name ?? "").isNotEmpty
              ? BasicInfoComplaintResponseView()
              : BasicInfoSubmitView();
        }),
      ),
    );
  }
}
