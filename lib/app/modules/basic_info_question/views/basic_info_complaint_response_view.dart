import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/modules/basic_info_question/controllers/basic_info_question_controller.dart';

import 'package:health_sync_question/app/core/constants/gap_constants.dart';

class BasicInfoComplaintResponseView
    extends GetView<BasicInfoQuestionController> {
  const BasicInfoComplaintResponseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: controller.complaintAnswers.isNotEmpty
          ? SizedBox(
              width: double.infinity,
              child: Padding(
                padding: padOnly(left: 20, right: 20, bottom: 24, top: 8),
                child: CustomButton(
                  text: "Search",
                  onPressed: controller.searchClick,
                ),
              ),
            )
          : null,
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Padding(
          padding: padAll20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Patient Info", style: textStyle.bold.s18),
              gapH12,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: borderRadius12,
                ),
                padding: padSym(horizontal: 12, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name", style: textStyle.medium.s14),
                    gapH4,
                    Text(
                      controller.patientInfo.value.name ?? "",
                      style: textStyle.bold.s18,
                    ),
                    gapH8,
                    Text("Age", style: textStyle.medium.s14),
                    gapH4,
                    Text(
                      controller.patientInfo.value.age ?? "",
                      style: textStyle.bold.s18,
                    ),
                    gapH8,
                    Text("Gender", style: textStyle.medium.s14),
                    gapH4,
                    Text(
                      controller.patientInfo.value.gender ?? "",
                      style: textStyle.bold.s18,
                    ),
                  ],
                ),
              ),
              if (controller.complaintAnswers.isNotEmpty) ...[
                gapH24,
                Text("Patient Complaints", style: textStyle.bold.s20),
                gapH12,
                ListView.separated(
                  itemCount: controller.complaintAnswers.length,
                  controller: controller.scrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final complaint = controller.complaintAnswers[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: borderRadius12,
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: Text(
                            complaint.complaint,
                            style: textStyle.bold.s20.copyWith(
                              color: Color(0xFFE64636),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: borderRadius12,
                          ),
                          backgroundColor: Colors.white,
                          collapsedIconColor: Color(0xFFE64636),
                          iconColor: Color(0xFFE64636),

                          children: complaint.answers
                              .map(
                                (complaint) => ListTile(
                                  title: Text(
                                    complaint.question,
                                    style: textStyle.bold.s16,
                                  ),
                                  subtitle: Text(
                                    "Answer: ${complaint.answer}",
                                    style: textStyle.semiBold.s16.copyWith(
                                      color: gray.base500,
                                    ),
                                  ),
                                  minVerticalPadding: 6,
                                  visualDensity: VisualDensity.compact,
                                  dense: true,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return gapH12;
                  },
                ),
              ],
              gapH24,
              SizedBox(
                width: double.infinity,
                child: RawMaterialButton(
                  onPressed: controller.newComplaintClick,
                  fillColor: Color(0xFFF8D4CC),
                  elevation: 0,
                  focusElevation: 0,
                  highlightElevation: 0,
                  highlightColor: Color(0xFFF6B4A7),
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius12,
                    side: BorderSide(color: Color(0xFFC68B85), width: 2),
                  ),
                  child: Padding(
                    padding: padSym(horizontal: 12, vertical: 12),
                    child: Text(
                      controller.complaintAnswers.isEmpty
                          ? "Add Your Complaint"
                          : "Add New",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle.bold.s18.copyWith(
                        color: Color(0xFFE64636),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
