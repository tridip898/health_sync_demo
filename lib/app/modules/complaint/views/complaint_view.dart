import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';
import 'package:health_sync_question/app/data/app_data/basic_question_data.dart';
import 'package:health_sync_question/app/modules/complaint/controllers/complaint_controller.dart';
import 'package:health_sync_question/app/modules/complaint/views/widgets/branch_view.dart';
import 'package:health_sync_question/app/modules/complaint/views/widgets/section_view.dart';
import 'package:health_sync_question/app/modules/complaint/views/widgets/summary_view.dart';

class ComplaintView extends GetView<ComplaintController> {
  const ComplaintView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PopScope(
        onPopInvokedWithResult: controller.onBackTap,
        canPop: controller.answerList.value.isEmpty,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(title: "Complaint"),
          body: Padding(
            padding: padAll16,
            child: Obx(() {
              final currentQuestion = controller.currentQuestion.value;
              if (currentQuestion != null) {
                if (currentQuestion.type == InputType.section) {
                  return SectionView(
                    section: currentQuestion,
                    onSectionTap: controller.onSectionTap,
                  );
                } else if (controller.isBranch) {
                  if (controller.isExtraNoteComplete) {
                    return SummaryView(
                      onTap: controller.onSubmitResponse,
                      answerList: controller.answerList.value,
                    );
                  } else if (controller.isBranchComplete) {
                    return Column(
                      children: [
                        CustomTextFormField(
                          labelText: 'Extra Notes',
                          hintText: 'Write any other issue...',
                          controller: controller.extraNotesController,
                        ),
                        gapH24,
                        CustomButton(
                          text: 'Review',
                          onPressed: controller.onReviewTap,
                        ),
                      ],
                    );
                  } else {
                    return BranchView(
                      section: currentQuestion
                          .questions![controller.currentBranchIndex.value],
                      onBranchNextTap: (answer) =>
                          controller.onBranchNextTap(answer),
                      currentIndex: controller.currentBranchIndex.value,
                      totalQuestions:
                          (controller
                                  .currentQuestion
                                  .value
                                  ?.questions
                                  ?.length ??
                              0) +
                          1,
                    );
                  }
                }
                return SizedBox();
              }
              return SizedBox();
            }),
          ),
        ),
      );
    });
  }
}
