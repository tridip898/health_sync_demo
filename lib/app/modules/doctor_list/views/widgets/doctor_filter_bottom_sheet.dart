import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/bottom_sheet_title.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/custom_dropdown_widget.dart';
import 'package:health_sync_question/app/core/widgets/custom_switch_widget.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';

class DoctorFilterBottomSheet extends StatelessWidget {
  final Function() onOrganizationSelect;
  final Function() onSpecialtySelect;
  final Function() onOrganizationRemove;
  final Function() onSpecialtyRemove;
  final Function() onApplyFilter;
  final Function() onClearFilter;
  final Function() onIncludeNonVerifiedTap;

  final TextEditingController organizationNameController;
  final TextEditingController specialtyNameController;

  final bool includeNonVerified;

  const DoctorFilterBottomSheet({
    super.key,
    required this.onOrganizationSelect,
    required this.onSpecialtySelect,
    required this.onOrganizationRemove,
    required this.onSpecialtyRemove,
    required this.onApplyFilter,
    required this.onClearFilter,
    required this.onIncludeNonVerifiedTap,
    required this.organizationNameController,
    required this.specialtyNameController,
    required this.includeNonVerified,
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
            BottomSheetTitle(title: 'Filter Options'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  gapH8,
                  CustomDropDownWidget(
                    labelText: 'Organization',
                    hintText: 'Select Organization',
                    controller: organizationNameController,
                    onTap: onOrganizationSelect,
                    onRemove: onOrganizationRemove,
                  ),
                  gapH8,
                  CustomDropDownWidget(
                    labelText: 'Specialty',
                    hintText: 'Select Specialty',
                    controller: specialtyNameController,
                    onTap: onSpecialtySelect,
                    onRemove: onSpecialtyRemove,
                  ),
                  gapH12,
                  Row(
                    children: [
                      Text(
                        'Include Non Verified',
                        style: textStyle.semiBold.s16,
                      ),
                      gapW8,
                      CustomSwitchWidget(
                        isActive: includeNonVerified,
                        onTap: onIncludeNonVerifiedTap,
                      ),
                    ],
                  ),
                  gapH24,
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'Clear Filter',
                          onPressed: onClearFilter,
                          variant: CustomButtonVariant.outlined,
                          borderColor: gray.base200,
                          textColor: Colors.black,
                        ),
                      ),
                      gapW8,
                      Expanded(
                        child: CustomButton(
                          text: 'Apply Filter',
                          onPressed: onApplyFilter,
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
