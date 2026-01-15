import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/data/model/disease_category.dart';
import 'package:health_sync_question/app/modules/medical_history_details/controllers/medical_history_details_controller.dart';

import '../../../core/utils/toaster.dart';
import '../../../core/widgets/loading.dart';
import '../../../data/model/create_medical_history_request.dart';
import '../../../data/repository/medical_history_repository.dart';

class UpdateMedicalHistoryController extends GetxController {
  final MedicalHistoryRepository repository = MedicalHistoryRepository();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final selectedDate = Rxn<DateTime>();
  RxList<DiseaseCategoryModel> categories = <DiseaseCategoryModel>[].obs;
  final selectedCategoryIds = <String>[].obs;

  String? patientId;
  String? medicalHistoryId;
  final isLoading = false.obs;

  List<DiseaseCategoryModel> get selectedCategoryModels {
    return categories
        .where((c) => selectedCategoryIds.contains(c.diseaseCategoryId))
        .toList();
  }

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments as Map<String, dynamic>;

    // Assign IDs safely
    patientId = args['patientId'] as String?;
    medicalHistoryId = args['medicalHistoryId'] as String?;

    // Initialize text controllers
    final history = args['history'];
    titleController.text = history.title ?? '';
    descriptionController.text = history.description ?? '';
    selectedDate.value = parseApiDate(history.date);

    // Initialize selected category IDs safely
    final cats = history.categories ?? [];
    selectedCategoryIds.assignAll(
      cats
          .map((c) => c.diseaseCategoryId)
          .where((id) => id != null)
          .map((id) => id!.toString())
          .toList()
          .cast<String>(),
    );
  }

  @override
  void onReady() {
    super.onReady();
    fetchCategories();
  }

  Future<void> updateMedicalHistory() async {

    if (!_isRequestValid()) return;

    if (patientId == null || medicalHistoryId == null) {
      Toaster.error('Patient ID or Medical History ID is missing');
      return;
    }

    Loading.show();

    final request = CreateMedicalHistoryRequest(
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      date: selectedDate.value != null ? _formatDate(selectedDate.value!) : '',
      diseaseCategoryIds: selectedCategoryIds.toList(),
    );
    final response = await repository.updateMedicalHistory(
      patientId: patientId!, // Safe now after null check
      medicalHistoryId: medicalHistoryId!,
      request: request,
    );

    Loading.hide();

    await response.fold(
      (error) {
        Toaster.error(error.message ?? 'Update failed');
      },
      (_) async {
        if (Get.isRegistered<MedicalHistoryDetailsController>()) {
          final  controller = Get.find<MedicalHistoryDetailsController>();
          await controller.fetchDetails();
        }
        Get.back();
        Toaster.success('Medical history updated');

      },
    );

  }

  void removeCategory(String id) {
    selectedCategoryIds.remove(id);
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

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.year}';
  }

  DateTime? parseApiDate(String? date) {
    if (date == null || date.isEmpty) return null;
    return DateTime.parse(date);
  }

  bool _isRequestValid() {
    if (titleController.text.trim().isEmpty) {
      Toaster.error('Title is required');
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

    if (selectedCategoryIds.isEmpty) {
      Toaster.error('Please select at least one category');
      selectedCategoryIds.clear();
      return false;
    }

    return true;
  }
}
