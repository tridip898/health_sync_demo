import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

import 'package:health_sync_question/app/core/constants/enums.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';
import 'package:health_sync_question/app/modules/basic_info_question/controllers/basic_info_question_controller.dart';

class BasicInfoSubmitView extends GetView<BasicInfoQuestionController> {
  const BasicInfoSubmitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: padAll20,
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return Form(
                  key: controller.basicInfoFormKey,
                  autovalidateMode: controller.isAutoValidateEnabled.value
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        gapH24,
                        Text(
                          "Patient Information",
                          style: textStyle.displayFontStyle.md,
                        ),
                        gapH20,
                        CustomTextFormField(
                          controller: controller.nameController,
                          labelText: "Name",
                          hintText: "Enter your name",
                          isRequired: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
                        ),
                        gapH12,
                        CustomTextFormField(
                          controller: controller.ageController,
                          labelText: "Age",
                          hintText: "Enter your age",
                          isRequired: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Age is required";
                            }
                            return null;
                          },
                        ),
                        gapH12,
                        genderSelection(),
                      ],
                    ),
                  ),
                );
              }),
            ),
            SizedBox(
              width: double.maxFinite,
              child: CustomButton(
                text: "Proceed",
                onPressed: controller.basicInfoSubmitClick,
              ),
            ),
            gapH20,
          ],
        ),
      ),
    );
  }

  genderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: "Gender",
            style: textStyle.boldFontStyle.md.copyWith(
              color: Color(0xff0E121B),
            ),
            children: [
              TextSpan(
                text: " *",
                style: textStyle.boldFontStyle.md.copyWith(
                  color: Color(0xffF04438),
                ),
              ),
            ],
          ),
        ),
        gapH8,
        Row(
          children: List.generate(3, (index) {
            return Obx(() {
              var isSelected =
                  controller.selectedGender.value == Gender.values[index];
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.selectedGender.value = Gender.values[index];
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: (isSelected)
                                ? primary.base500
                                : gray.base400,
                            width: 1.5,
                          ),
                        ),
                        padding: padSym(horizontal: 2, vertical: 2),
                        child: (isSelected)
                            ? Container(
                                decoration: BoxDecoration(
                                  color: primary.base500,
                                  shape: BoxShape.circle,
                                ),
                              )
                            : Container(),
                      ),
                      gapW8,
                      Expanded(
                        child: Text(
                          Gender.values[index].name.capitalizeFirst??"",
                          style: textStyle.mediumFontStyle.md,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
          }),
        ),
      ],
    );
  }
}
