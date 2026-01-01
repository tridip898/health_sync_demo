import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
                  TextField(
                    controller: c.titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Category multi-select (example with checkboxes)
                  Text('Select Categories'),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: demoCategories.map((cat) {
                      final selected = c.selectedCategoryIds.contains(cat['id']);
                      return FilterChip(
                        label: Text(cat['name']!),
                        selected: selected,
                        onSelected: (val) {
                          if (val) {
                            c.selectedCategoryIds.add(cat['id']!);
                          } else {
                            c.selectedCategoryIds.remove(cat['id']);
                          }
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

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
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Obx(() => Text(
                        c.selectedDate.value == null
                            ? 'Pick a date'
                            : "${c.selectedDate.value!.day.toString().padLeft(2,'0')}-${c.selectedDate.value!.month.toString().padLeft(2,'0')}-${c.selectedDate.value!.year}",
                      )),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Description
                  TextField(
                    controller: c.descriptionController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Save button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Save'),
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
}

final demoCategories = [
  {"id": "d4cc8445-46d2-436f-a111-3e4779d7110b", "name": "Joint Pain"},
  {"id": "958b093e-6d89-4a12-82b0-738862cae8b9", "name": "Dengue"},
  {"id": "c8ecee4f-d7d1-45c4-bbba-650de364ee51", "name": "Liver Issue"},
  {"id": "6bc10fc8-ae50-4279-9cc6-3111fd4d41ed", "name": "Fever"},
  {"id": "9d20206e-ce4a-4d44-b907-c5f85cf6cd5f", "name": "Faver"},
  {"id": "939b3a23-f60e-4c74-96d7-5298ade3636f", "name": "Leg Injury"},
];













