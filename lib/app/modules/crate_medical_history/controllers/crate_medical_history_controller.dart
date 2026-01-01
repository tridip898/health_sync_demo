import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/data/model/disease_category.dart';

import '../../../core/utils/toaster.dart';
import '../../../data/repository/medical_history_repository.dart';

class CrateMedicalHistoryController extends GetxController {
  final MedicalHistoryRepository repository = MedicalHistoryRepository();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final selectedDate = Rxn<DateTime>();
  RxList<DiseaseCategoryModel> categories = <DiseaseCategoryModel>[].obs;

  final selectedCategories = <Map<String, String>>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  bool isCategorySelected(String id) {
    return selectedCategories.any((e) => e['id'] == id);
  }

  void toggleCategory(String id, String name) {
    final index = selectedCategories.indexWhere((e) => e['id'] == id);

    if (index >= 0) {
      selectedCategories.removeAt(index);
    } else {
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

    isLoading.value = false;
  }

  Future<void> fetchCategories() async {
    isLoading.value = true;

    final result = await repository.getDiseaseCategories();

    result.fold(
      (error) => Toaster.error(error.message ?? 'Failed to load categories'),
      (success) {
        categories.assignAll(success.data ?? []);
      },
    );

    isLoading.value = false;
  }
}
