import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/complaints_card.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/modules/chielf_complaint/controllers/chielf_complaint_controller.dart';

class QuestionView extends GetView<ChiefComplaintController> {
  const QuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final question = controller.currentQuestion;
      return Expanded(
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(question.question, style: textStyle.bold.s20),
              gapH16,
              if (question.options != null)
                ListView.separated(
                  controller: controller.scrollController,
                  shrinkWrap: true,
                  itemCount: question.options?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final option = question.options?[index];
                      final isSelected =
                          controller.selectedOptions[question.question] ==
                          option;
                      return ComplaintsCard(
                        complaint: option ?? "",
                        isSelected: isSelected,
                        onPressed: () => controller.nextQuestion(option ?? ""),
                      );
                    });
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return gapH12;
                  },
                ),
              gapH(36),

              if (controller.isLastQuestion.value)
                SizedBox(
                  width: double.maxFinite,
                  child: CustomButton(
                    text: "Completed",
                    onPressed: controller.completeClick,
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
