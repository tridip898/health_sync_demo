import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/multiple_picker_bottom_sheet.dart';
import 'package:health_sync_question/app/core/widgets/bottom_sheet_title.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/custom_dropdown_widget.dart';
import 'package:health_sync_question/app/core/widgets/custom_switch_widget.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';
import 'package:health_sync_question/app/data/model/specialty_model.dart';

class DoctorFilterBottomSheet extends StatelessWidget {
  final Function() onOrganizationSelect;
  final Function() onOrganizationRemove;
  final TextEditingController organizationNameController;

  final Function() onSpecialtyTap;
  final Function(String?) onRemoveSpecialty;
  final List<SpecialtyModel> selectedSpecialties;

  final Function() onApplyFilter;
  final Function() onClearFilter;
  final Function() onIncludeNonVerifiedTap;
  final bool includeNonVerified;

  const DoctorFilterBottomSheet({
    super.key,
    required this.onOrganizationSelect,
    required this.onOrganizationRemove,
    required this.organizationNameController,

    required this.onSpecialtyTap,
    required this.onRemoveSpecialty,
    required this.selectedSpecialties,

    required this.onApplyFilter,
    required this.onClearFilter,
    required this.onIncludeNonVerifiedTap,
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
                  GestureDetector(
                    onTap: onSpecialtyTap,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: gray.base300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.only(left: 10, right: 10, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() {
                            if (selectedSpecialties.isEmpty) {
                              return const SizedBox();
                            }
                            return Wrap(
                              spacing: 8,
                              children: selectedSpecialties.map((cat) {
                                return Chip(
                                  label: Text(cat.title ?? ''),
                                  onDeleted: () {
                                    onRemoveSpecialty(cat.specialtyId);
                                  },
                                );
                              }).toList(),
                            );
                          }),
                          SizedBox(height: 6),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Add more categories...',
                                  style: TextStyle(color: Colors.grey[500]),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),

                          SizedBox(height: 12),
                        ],
                      ),
                    ),
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
