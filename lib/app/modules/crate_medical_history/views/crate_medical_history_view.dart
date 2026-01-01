import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_input_validator.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/crate_medical_history_controller.dart';

class CrateMedicalHistoryView extends GetView<CrateMedicalHistoryController> {
  const CrateMedicalHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = controller;

    return Scaffold(
      appBar: AppBar(title: const Text('Add Medical History')),
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
                      validator: AppInputValidator.bdPhoneValidator,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text('Categories'),
                  const SizedBox(height: 6),

                  Obx(() {
                    if (controller.selectedCategories.isEmpty) {
                      return const SizedBox();
                    }

                    return Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: controller.selectedCategories.map((cat) {
                        return Chip(
                          label: Text(cat['name']!),
                          deleteIcon: const Icon(Icons.close, size: 16),
                          onDeleted: () =>
                              controller.removeCategory(cat['id']!),
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
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Obx(() {
                              return Text('Select Categories');
                            }),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Date picker
                  Text('Select Date'),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Obx(
                        () => Text(
                          c.selectedDate.value == null
                              ? 'Pick a date'
                              : "${c.selectedDate.value!.day.toString().padLeft(2, '0')}-${c.selectedDate.value!.month.toString().padLeft(2, '0')}-${c.selectedDate.value!.year}",
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
                      onPressed: () {},
                      text: 'Save Medical History',
                      textColor: Colors.black,
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
    final controller = Get.find<CrateMedicalHistoryController>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Select Categories',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),

              const Divider(height: 1),

              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.categories.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (_, index) {
                    final cat = controller.categories[index];

                    return Obx(() {
                      final isSelected = controller.selectedCategoryIds
                          .contains(cat.diseaseCategoryId);

                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(cat.name ?? ''),
                        trailing: isSelected
                            ? const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.circle_outlined,
                                color: Colors.grey,
                              ),
                        onTap: () => controller.toggleCategory(
                          cat.diseaseCategoryId!,
                          cat.name ?? '',
                        ),
                      );
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
