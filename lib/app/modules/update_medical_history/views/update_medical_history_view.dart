import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';

import '../../../core/extensions/widget_extension.dart';
import '../../../core/utils/multiple_picker_bottom_sheet.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../data/model/disease_category.dart';
import '../controllers/update_medical_history_controller.dart';

class UpdateMedicalHistoryView extends GetView<UpdateMedicalHistoryController> {
  const UpdateMedicalHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = controller;
    return Scaffold(
      appBar: CustomAppBar(title: "Add Medical History"),
      body: Obx(
        () => Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFormField(
                      labelText: 'Title',
                      hintText: 'e.g Chronic Migraine',
                      controller: controller.titleController,
                      keyboardType: TextInputType.text,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),

                  const SizedBox(height: 16),
                  Text('Categories', style: textStyle.regular.s14.copyWith(color: Colors.black)),
                  const SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsetsGeometry.all(2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() {
                          if (controller.selectedCategories.isEmpty) {
                            return const SizedBox();
                          }

                          return Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: controller.selectedCategories.map((cat) {
                              return Chip(
                                label: Text(cat['name']!,style: textStyle.regular.s10.copyWith(color: Colors.grey,)),
                                deleteIcon: const Icon(Icons.close, size: 16),
                                onDeleted: () => controller.removeCategory(cat['id']!),
                              );
                            }).toList(),
                          );
                        }),


                        const SizedBox(height: 6),

                        GestureDetector(
                          onTap: () => openCategoryBottomSheet(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Add more categories...',
                                  style: textStyle.regular.s14.copyWith(color: Colors.grey.shade500),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),
                      ],
                    ),
                  ),

                  // Date picker
                  Text('Select Date', style: TextStyle(color: Colors.black)),
                  const SizedBox(height: 6),
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
                        border: Border.all(color: Colors.grey),
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
                  const SizedBox(height: 16),

                  // Description
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFormField(
                      controller: c.descriptionController,
                      maxLines: 4,
                      hintText:
                          'Enter Details about the condition, symtoms, or notes...',
                      labelText: 'Description',
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Save button
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      onPressed: controller.updateMedicalHistory,
                      text: 'Update Medical History',
                    ),
                  ),
                ],
              ),
            ),

            if (c.isLoading.value)
              const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  void openCategoryBottomSheet(BuildContext context) {
    final controller = Get.find<UpdateMedicalHistoryController>();

    if (controller.categories.isEmpty) {
      controller.fetchCategories(); // fetch from API if empty
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => MultiSelectBottomSheet<DiseaseCategoryModel>(
        items: controller.categories,
        selectedIds: controller.selectedCategoryIds,
        getId: (cat) => cat.diseaseCategoryId!,
        getLabel: (cat) => cat.name ?? '',
        onConfirm: () {
          controller.selectedCategories.clear();
          for (final cat in controller.categories) {
            if (controller.selectedCategoryIds.contains(cat.diseaseCategoryId)) {
              controller.selectedCategories.add({
                'id': cat.diseaseCategoryId!,
                'name': cat.name ?? '',
              });
            }
          }
          Get.back(); // close bottom sheet
        },
      ),
    );
  }


}
