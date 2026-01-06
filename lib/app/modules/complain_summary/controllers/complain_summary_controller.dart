import 'dart:developer';

import 'package:get/get.dart';
import 'package:health_sync_question/app/data/app_data/basic_question_data.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/model/questionnaire_response_model.dart';
import 'package:health_sync_question/app/data/repository/appointment_repository.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class ComplainSummaryController extends GetxController {
  final RxList<List<Section>> answersList = <List<Section>>[].obs;
  RxList<Map<String, String>> questionnaires = <Map<String, String>>[].obs;
  final AppointmentRepository appointmentRepository = AppointmentRepository();
  final Rx<QuestionnaireModel> questionnaireModel = QuestionnaireModel().obs;
  final List<Section> answerList = Get.arguments;
  final RxBool isListShowing = true.obs;
  final RxList<Category> selectedCategory = <Category>[].obs;

  @override
  void onInit() {
    answersList.add(answerList);
    questionnaires.add(SectionUtils.convertToMap(answerList));
    log("Length of answersList: ${answersList.length}");
    super.onInit();
  }

  onSubmitQuestionnaire() async {
    log('Questionnaires: ${questionnaires.toJson()}');
    Loading.show();
    final response = await appointmentRepository.getQuestionnaireResponse(
      questionnaires,
    );
    Loading.hide();
    response.fold(
      (errorRes) {
        Toaster.error(
          errorRes.message ?? "Failed to generate complain response",
        );
      },
      (successRes) {
        isListShowing.value = false;
        questionnaireModel.value = successRes.data!;
      },
    );
  }

  onRemoveQuestionnaire(int index) {
    questionnaires.removeAt(index);
  }

  void onAddMoreComplaint() {
    Get.toNamed(
      Routes.COMPLAINT,
      arguments: {"isCategorySelector": true},
    )?.then((value) {
      if (value != null) {
        answersList.add(value);
        questionnaires.add(SectionUtils.convertToMap(value));
      }
    });
  }

  void onContinueClick() {
    if (isListShowing.value) {
      if (questionnaires.isNotEmpty) {
        onSubmitQuestionnaire();
      }
    } else {
      if (selectedCategory.isEmpty) {
        Toaster.warning('Please select at least one category');
        return;
      } else {
        Get.offNamed(
          Routes.DOCTOR_LIST,
          arguments: {
            "questionnaire": questionnaires,
            "specialties": selectedCategory.value,
          },
        );
      }
    }
  }

  void categorySelection(Category? category) {
    if (selectedCategory.contains(category)) {
      selectedCategory.remove(category);
    } else {
      selectedCategory.add(category ?? Category());
    }
    selectedCategory.refresh();
  }
}
