import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';

class DoctorFilterDialog extends StatelessWidget {
  const DoctorFilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              height: 5,
              width: 48,
              decoration: BoxDecoration(
                color: gray.base300,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Filter Options', style: textStyle.bold.s20),
                  GestureDetector(
                    onTap: Get.back,
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  gapH16,
                  CustomTextFormField(
                    labelText: 'Organization',
                    hintText: 'Select Organization',
                    isViewOnly: true,
                  ),
                  gapH8,
                  CustomTextFormField(
                    labelText: 'Specialty',
                    hintText: 'Select Specialty',
                    isViewOnly: true,
                  ),
                  gapH24,
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'Clear Filter',
                          onPressed: () {},
                          variant: CustomButtonVariant.outlined,
                          borderColor: gray.base200,
                          textColor: Colors.black,
                        ),
                      ),
                      gapW8,
                      Expanded(
                        child: CustomButton(
                          text: 'Apply Filter',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  gapH16,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
