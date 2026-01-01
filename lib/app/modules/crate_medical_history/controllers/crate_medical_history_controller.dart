import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/toaster.dart';

class CrateMedicalHistoryController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final selectedDate = Rxn<DateTime>();

  /// Single source of truth
  final selectedCategories = <Map<String, String>>[].obs;

  final isLoading = false.obs;

  void addCategory(String id, String name) {
    final exists = selectedCategories.any((e) => e['id'] == id);
    if (!exists) {
      selectedCategories.add({'id': id, 'name': name});
    }
  }

  void removeCategory(String id) {
    selectedCategories.removeWhere((e) => e['id'] == id);
  }

  List<String> get selectedCategoryIds =>
      selectedCategories.map((e) => e['id']!).toList();

  Future<void> saveMedicalHistory(String patientId) async {
    if (titleController.text.isEmpty) {
      Toaster.error('Title is required');
      return;
    }
    if (selectedCategories.isEmpty) {
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
      "${selectedDate.value!.day.toString().padLeft(2, '0')}-"
          "${selectedDate.value!.month.toString().padLeft(2, '0')}-"
          "${selectedDate.value!.year}",
      "diseaseCategoryIds": selectedCategoryIds,
    };

    /// CALL API HERE

    isLoading.value = false;
  }
}

