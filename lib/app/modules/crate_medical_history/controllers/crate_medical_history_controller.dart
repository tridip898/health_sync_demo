import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/toaster.dart';

class CrateMedicalHistoryController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final selectedDate = Rxn<DateTime>();
  final selectedCategoryIds = <String>[].obs;
  final selectedCategoryNames = <String>[].obs;

  final isLoading = false.obs;

  Future<void> saveMedicalHistory(String patientId) async {
    if (titleController.text.isEmpty) {
      Toaster.error('Title is required');
      return;
    }
    if (selectedCategoryIds.isEmpty) {
      Toaster.error('Select at least one category');
      return;
    }
    if (selectedDate.value == null) {
      Toaster.error('Pick a date');
      return;
    }

    isLoading.value = true;

    final body = {
      "title": titleController.text,
      "description": descriptionController.text,
      "date":
          "${selectedDate.value!.day.toString().padLeft(2, '0')}-${selectedDate.value!.month.toString().padLeft(2, '0')}-${selectedDate.value!.year}",
      "diseaseCategoryIds": selectedCategoryIds,
    };

    // final response = await repository.createMedicalHistory(
    //   patientId: patientId,
    //   body: body,
    // );
    //
    // response.fold(
    //   (error) {
    //     Toaster.error(error.message ?? 'Failed to save');
    //   },
    //   (success) {
    //     Toaster.success('Medical history saved successfully');
    //     Get.back(); // go back after save
    //   },
    // );

    isLoading.value = false;
  }



  void addCategory(String id, String name) {
    if (!selectedCategoryIds.contains(id)) {
      selectedCategoryIds.add(id);
      selectedCategoryNames.add(name);
    }
  }

  void removeCategory(String id, String name) {
    selectedCategoryIds.remove(id);
    selectedCategoryNames.remove(name);
  }
}
