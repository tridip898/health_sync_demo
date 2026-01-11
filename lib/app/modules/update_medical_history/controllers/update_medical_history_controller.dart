import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/toaster.dart';
import '../../../data/model/create_medical_history_request.dart';
import '../../../data/repository/medical_history_repository.dart';
import 'package:health_sync_question/app/data/model/disease_category.dart';

class UpdateMedicalHistoryController extends GetxController {
  final MedicalHistoryRepository repository = MedicalHistoryRepository();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final selectedDate = Rxn<DateTime>();
  RxList<DiseaseCategoryModel> categories = <DiseaseCategoryModel>[].obs;
  final selectedCategories = <Map<String, String>>[].obs;

  late final String patientId;
  late final String medicalHistoryId;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    final args = Get.arguments as Map<String, dynamic>;
    patientId = args['patientId'];
    medicalHistoryId = args['medicalHistoryId'];

    final history = args['history'];

    /// Prefill fields
    titleController.text = history.title ?? '';
    descriptionController.text = history.description ?? '';
    selectedDate.value = parseApiDate(history.date);


    final cats = history.categories ?? [];
    for (final c in cats) {
      if (c.category != null) {
        selectedCategoryIds.add(c.diseaseCategoryId!);
        selectedCategories.add({
          'id': c.diseaseCategoryId!,
          'name': c.category!.name!,
        });
      }
    }
  }

  Future<void> updateMedicalHistory() async {
    isLoading.value = true;

    final request = CreateMedicalHistoryRequest(
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      date: _formatDate(selectedDate.value!),
      diseaseCategoryIds: selectedCategoryIds,
    );

    final response = await repository.updateMedicalHistory(
      patientId: patientId,
      medicalHistoryId: medicalHistoryId,
      request: request,
    );

    response.fold((error) => Toaster.error(error.message ?? 'Update failed'), (
      _,
    ) {
      Toaster.success('Medical history updated');
      Get.back(result: true);
    });

    isLoading.value = false;
  }

  void removeCategory(String id) {
    selectedCategories.removeWhere((e) => e['id'] == id);
  }


  final selectedCategoryIds = <String>[].obs;


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

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.year}';
  }
  DateTime? parseApiDate(String? date) {
    if (date == null || date.isEmpty) return null;
    return DateTime.parse(date);
  }
}
