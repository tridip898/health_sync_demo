import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';
import 'package:health_sync_question/app/data/app_data/basic_question_data.dart';
import 'package:health_sync_question/app/modules/complaint/controllers/complaint_controller.dart';

class ComplaintView extends GetView<ComplaintController> {
  const ComplaintView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            } else if (currentQuestion.type == InputType.branch &&
                currentQuestion.questions?.isNotEmpty == true) {
              return BranchView(
                section: currentQuestion
                    .questions![controller.currentBranchIndex.value],
                onBranchNextTap: (answer) => controller.onBranchNextTap(answer),
              );
            }
            return SizedBox();
          }
          return SizedBox();
        }),
      ),
    );
  }
}

class SectionView extends StatelessWidget {
  final Section section;
  final Function(int) onSectionTap;

  const SectionView({
    super.key,
    required this.section,
    required this.onSectionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(section.question ?? '', style: textStyle.semiBold.s16),
        gapH8,
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: section.options?.keys.length ?? 0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onSectionTap(index),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: gray.base100,
                    borderRadius: radius8,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          section.options?.keys.elementAt(index) ?? 'N/A',
                          style: textStyle.medium.s14,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right, size: 14),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, _) => gapH8,
          ),
        ),
      ],
    );
  }
}

class BranchView extends StatelessWidget {
  final Section section;
  final Function(String answer) onBranchNextTap;

  const BranchView({
    super.key,
    required this.section,
    required this.onBranchNextTap,
  });

  @override
  Widget build(BuildContext context) {
    print(section);
    print('here section');
    return Column(
      children: [
        Text(section.question ?? '', style: textStyle.semiBold.s16),
        gapH8,
        if (section.options?.isNotEmpty == true)
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: section.options?.keys.length ?? 0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onBranchNextTap(
                    section.options?.values.elementAt(index) ?? '',
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: gray.base100,
                      borderRadius: radius8,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            section.options?.keys.elementAt(index) ?? 'N/A',
                            style: textStyle.medium.s14,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_right, size: 14),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, _) => gapH8,
            ),
          )
        else if (section.type == InputType.number)
          CustomTextFormField(
            labelText: '',
            hintText: '',
            keyboardType: TextInputType.number,
          )
        else
          CustomTextFormField(labelText: '', hintText: ''),
      ],
    );
  }
}
