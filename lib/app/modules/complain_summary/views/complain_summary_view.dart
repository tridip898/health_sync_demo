import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/complain_summary_widget.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/data/model/questionnaire_response_model.dart';

import '../controllers/complain_summary_controller.dart';

class ComplainSummaryView extends GetView<ComplainSummaryController> {
  const ComplainSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Complain Summary'),
      backgroundColor: Colors.white,
      bottomNavigationBar: _bottomContinueButton(),
      body: SingleChildScrollView(
        padding: padAll16,
        child: Obx(() {
          if (controller.isListShowing.value) {
            return Column(
              children: [
                ComplainSummaryWidget(
                  questionnaires: controller.questionnaires.toList(),
                  onRemoveQuestionnaire: (index) =>
                      controller.onRemoveQuestionnaire(index),
                ),
                gapH24,
                CustomButton(
                  text: "+ Add More Complaint",
                  onPressed: controller.onAddMoreComplaint,
                ),
              ],
            );
          }
          return _categorySelection();
        }),
      ),
    );
  }

  Widget _bottomContinueButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: gray.base200),
      ),
      padding: padSym(horizontal: 20, vertical: 16),
      child: CustomButton(
        text: "Continue",
        onPressed: controller.onContinueClick,
      ),
    );
  }

  Widget _categorySelection() {
    final questionnaire = controller.questionnaireModel.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questionnaire.summary ?? '',
          style: textStyle.medium.s16.copyWith(color: Colors.black54),
        ),
        gapH20,
        Text(
          'Please select the specialties for the appointment',
          style: textStyle.medium.s12.copyWith(color: gray.base500),
        ),
        gapH12,
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _categoryCard(questionnaire.category?[index], index);
          },
          separatorBuilder: (context, index) {
            return gapH12;
          },
          itemCount: questionnaire.category?.length ?? 0,
        ),
      ],
    );
  }

  _categoryCard(Category? category, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius12,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: .1), blurRadius: 6),
        ],
      ),
      padding: padAll12,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category?.specialty ?? '', style: textStyle.bold.s18),
                Divider(color: gray.base100, height: 32),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        category?.reason ?? '',
                        style: textStyle.semiBold.s14.copyWith(
                          color: gray.base500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    gapW8,
                    Icon(Icons.info, color: gray.base400),
                  ],
                ),
              ],
            ),
          ),
          gapW12,
          Obx(() {
            final selected = controller.selectedCategory.contains(category);
            return GestureDetector(
              onTap: () {
                controller.categorySelection(category);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: selected ? green.base50 : Colors.white,
                  border: Border.all(
                    color: selected ? green.base200 : gray.base200,
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: selected
                    ? Icon(Icons.check, color: green.base500)
                    : SizedBox.shrink(),
              ),
            );
          }),
        ],
      ),
    );
  }
}
