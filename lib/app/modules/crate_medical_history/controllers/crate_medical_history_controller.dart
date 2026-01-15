import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/data/model/disease_category.dart';
import 'package:health_sync_question/app/modules/medical_history_list/controllers/medical_history_list_controller.dart';

import '../../../core/extensions/widget_extension.dart';
import '../../../core/utils/toaster.dart';
import '../../../core/widgets/loading.dart';
import '../../../data/model/create_medical_history_request.dart';
import '../../../data/repository/medical_history_repository.dart';

class CrateMedicalHistoryController extends GetxController {
  final MedicalHistoryRepository repository = MedicalHistoryRepository();
  final MedicalHistoryListController medicalHistoryListController = Get.find();

  final TextEditingController  titleController = TextEditingController();
  final TextEditingController  descriptionController = TextEditingController();
  final selectedDate = Rxn<DateTime>();
  RxList<DiseaseCategoryModel> categories = <DiseaseCategoryModel>[].obs;

  final selectedCategories = <Map<String, String>>[].obs;
  String? patientId;

  final selectedCategoryIds = <String>[].obs;

  Rx<bool> isLoading = false.obs;
  final isSubmitting = false.obs;


  @override
  void onInit() {
    patientId =
        appController.userModel.value?.currentRole?.patient?.patientId ?? '';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchCategories();
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
    Loading.show();
    isLoading.value = true;
    final result = await repository.getDiseaseCategories();
    result.fold(
      (error) => Toaster.error(error.message ?? 'Failed to load categories'),
      (success) {
        categories.assignAll(success.data ?? []);
      },
    );
    isLoading.value = false;
    Loading.hide();
  }

  Future<void> saveMedicalHistory(String patientId) async {

    if (isSubmitting.value) return;


    if (!_isRequestValid()) return;

    isSubmitting.value = true;
    Loading.show();

    final request = CreateMedicalHistoryRequest(
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      date:
      "${selectedDate.value!.day.toString().padLeft(2, '0')}-"
          "${selectedDate.value!.month.toString().padLeft(2, '0')}-"
          "${selectedDate.value!.year}",
      diseaseCategoryIds: selectedCategoryIds.toList(),
    );


    final response = await repository.createMedicalHistory(
      patientId: patientId,
      request: request,
    );

    Loading.hide();
    isSubmitting.value = false;

    response.fold(
          (error) {
        Get.snackbar('Error', error.message ?? 'Something went wrong');
      },
          (success) {
        Get.back();
        Get.find<MedicalHistoryListController>().fetchMedicalHistory();
      },
    );
  }


  bool _isRequestValid() {
    if (titleController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Title is required');
      return false;
    }

    if (descriptionController.text.trim().isEmpty) {
      Toaster.error('Description is required');
      return false;
    }

    if (selectedDate.value == null) {
      Toaster.error('Please select date');
      return false;
    }

    if (categories.isEmpty) {
      Toaster.error('Please select at least one category');
      return false;
    }

    return true;
  }

}
