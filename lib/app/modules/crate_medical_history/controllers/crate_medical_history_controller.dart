import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/data/model/disease_category.dart';
import 'package:health_sync_question/app/modules/medical_history_list/controllers/medical_history_list_controller.dart';

import '../../../core/extensions/widget_extension.dart';
import '../../../core/utils/toaster.dart';
import '../../../data/model/create_medical_history_request.dart';
import '../../../data/repository/medical_history_repository.dart';

class CrateMedicalHistoryController extends GetxController {
  final MedicalHistoryRepository repository = MedicalHistoryRepository();
  final MedicalHistoryListController medicalHistoryListController = Get.find();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final selectedDate = Rxn<DateTime>();
  RxList<DiseaseCategoryModel> categories = <DiseaseCategoryModel>[].obs;

  final selectedCategories = <Map<String, String>>[].obs;
  late final String patientId;

  final selectedCategoryIds = <String>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    patientId =
        appController.userModel.value?.currentRole?.patient?.patientId ?? '';
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

  Future<void> saveMedicalHistory(String patientId) async {
    if (selectedDate.value == null) {
      Get.snackbar('Error', 'Please select date');
      return;
    }

    final request = CreateMedicalHistoryRequest(
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      date:
          "${selectedDate.value!.day.toString().padLeft(2, '0')}-"
          "${selectedDate.value!.month.toString().padLeft(2, '0')}-"
          "${selectedDate.value!.year}",
      diseaseCategoryIds: selectedCategoryIds.toList(),
    );

    isLoading.value = true;

    final response = await repository.createMedicalHistory(
      patientId: patientId,
      request: request,
    );

    isLoading.value = false;

    response.fold(
      (error) {
        Get.snackbar('Error', error.message ?? 'Something went wrong');
      },
      (success) {
        Get.back();
        medicalHistoryListController.fetchMedicalHistory();
        Get.snackbar('Success', 'Medical history added');
      },
    );
  }
}
