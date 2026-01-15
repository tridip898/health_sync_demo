import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';

import '../../../core/extensions/widget_extension.dart';
import '../../../core/utils/multiple_picker_bottom_sheet.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../data/model/disease_category.dart';
import '../controllers/crate_medical_history_controller.dart';

class CrateMedicalHistoryView extends GetView<CrateMedicalHistoryController> {
  const CrateMedicalHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = controller;
    return GestureDetector(
      onTap: appController.closeKeyboard,
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: 'Add Medical History'),
        body: Obx(
          () => Stack(
            children: [
              if (controller.isLoading.value)
                const Center(child: SizedBox())
              else
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        labelText: 'Title',
                        hintText: 'e.g Chronic Migraine',
                        controller: controller.titleController,
                        keyboardType: TextInputType.text,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      gapH(6),
                      Text(
                        'Categories',
                        style: textStyle.bold.s16.copyWith(color: Colors.black),
                      ),
                      gapH(6),
                      GestureDetector(
                        onTap: () => openCategoryBottomSheet(context),
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
                                if (controller.selectedCategoryIds.isEmpty) {
                                  return const SizedBox();
                                }
                                return Wrap(
                                  spacing: 8,
                                  children: controller.selectedCategoryModels
                                      .map((cat) {
                                        return Chip(
                                          label: Text(cat.name ?? ''),
                                          onDeleted: () {
                                            controller.removeCategory(
                                              cat.diseaseCategoryId!,
                                            );
                                          },
                                        );
                                      })
                                      .toList(),
                                );
                              }),
                              SizedBox(height: 6),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                      gapH(6),
                      // Date picker
                      Text(
                        'Select Date',
                        style: textStyle.bold.s16.copyWith(color: Colors.black),
                      ),
                      gapH(6),
                      GestureDetector(
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null) {
                            c.selectedDate.value = picked;
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: gray.base300),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Obx(
                            () => Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    c.selectedDate.value == null
                                        ? 'mm/dd/yyyy'
                                        : "${c.selectedDate.value!.day.toString().padLeft(2, '0')}-"
                                              "${c.selectedDate.value!.month.toString().padLeft(2, '0')}-"
                                              "${c.selectedDate.value!.year}",
                                    style: TextStyle(
                                      color: c.selectedDate.value == null
                                          ? Colors.grey
                                          : Colors.black,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 8),

                                const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.black,
                                  size: 22,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      gapH(6),
                      CustomTextFormField(
                        controller: c.descriptionController,
                        maxLines: 4,

                        hintText:
                            'Enter Details about the condition, symtoms, or notes...',
                        labelText: 'Description',
                      ),
                      gapH(16),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          onPressed: () {
                            final id = controller.patientId;
                            if (id == null) return;

                            controller.saveMedicalHistory(id);
                          },
                          text: 'Save Medical History',
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void openCategoryBottomSheet(BuildContext context) {
    final controller = Get.find<CrateMedicalHistoryController>();

    if (controller.categories.isEmpty) {
      controller.fetchCategories();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          minChildSize: 0.7,
          initialChildSize: .92,
          snapSizes: const [0.7, 1],
          builder: (_, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: MultiSelectBottomSheet<DiseaseCategoryModel>(
                items: controller.categories,
                selectedIds: controller.selectedCategoryIds,
                getId: (cat) => cat.diseaseCategoryId!,
                getLabel: (cat) => cat.name ?? '',
                scrollController: scrollController,
                onConfirm: () => Get.back(),
              ),
            );
          },
        );
      },
    );
  }
}
