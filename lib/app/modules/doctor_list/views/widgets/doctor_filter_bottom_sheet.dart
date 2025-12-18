import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/custom_dropdown_widget.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';

class DoctorFilterBottomSheet extends StatelessWidget {
  final Function() onOrganizationSelect;
  final Function() onSpecialtySelect;

  final TextEditingController organizationNameController;
  final TextEditingController specialtyNameController;

  const DoctorFilterBottomSheet({
    super.key,
    required this.onOrganizationSelect,
    required this.onSpecialtySelect,
    required this.organizationNameController,
    required this.specialtyNameController,
  });

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
                  CustomDropDownWidget(
                    labelText: 'Organization',
                    hintText: 'Select Organization',
                    controller: organizationNameController,
                    onTap: onOrganizationSelect,
                  ),
                  gapH8,
                  CustomDropDownWidget(
                    labelText: 'Specialty',
                    hintText: 'Select Specialty',
                    controller: specialtyNameController,
                    onTap: onSpecialtySelect,
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
