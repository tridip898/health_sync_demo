import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/modules/chielf_complaint/views/question_view.dart';
import 'package:health_sync_question/app/core/widgets/complaints_card.dart';

import 'package:health_sync_question/app/modules/chielf_complaint/controllers/chielf_complaint_controller.dart';

class ChielfComplaintView extends GetView<ChiefComplaintController> {
  const ChielfComplaintView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Chief Complaint"),
      body: Padding(
        padding: padAll16,
        child: Column(
          children: [
            Obx(() {
              return LinearProgressIndicator(
                value: controller.progress.value,
                backgroundColor: gray.base300,
                color: Color(0xFFE64636),
                minHeight: 6,
                borderRadius: BorderRadius.circular(100),
              );
            }),
            gapH12,
            Obx(() {
              if (controller.currentComplaintQuestions.isEmpty) {
                return Expanded(
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Text(
                          "Which area are you having health issues with?",
                          style: textStyle.boldFontStyle.xl,
                        ),
                        gapH16,
                        ListView.separated(
                          controller: controller.scrollController,
                          shrinkWrap: true,
                          itemCount: controller.chiefComplaintOption.keys
                              .toList()
                              .length,
                          itemBuilder: (context, index) {
                            final complaint = controller
                                .chiefComplaintOption
                                .keys
                                .toList()[index];
                            return Obx(() {
                              return ComplaintsCard(
                                complaint: complaint,
                                isSelected:
                                    controller.selectedComplaint.value ==
                                    complaint,
                                onPressed: () =>
                                    controller.selectChiefComplaint(complaint),
                              );
                            });
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return gapH12;
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
              return QuestionView();
            }),
          ],
        ),
      ),
    );
  }
}
