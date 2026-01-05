import 'package:network/network.dart';

import '../../core/config/network/apis.dart';
import '../model/create_medical_history_request.dart';
import '../model/create_medical_history_response.dart';
import '../model/disease_category.dart';
import '../model/medical_history_details_response_Model.dart';
import '../model/specialty_list_response_model.dart';

class MedicalHistoryRepository extends BaseRepository {

  Future<Either<ErrorResponse, MedicalHistoryListResponseModel>>
  getPatientMedicalHistory({
    required String patientId,
    required int page,
    int limit = 15,
  }) {
    return get(
      path: Apis.patientMedicalHistory.replaceFirst('{patientId}', patientId),
      queryParameters: {
        'page': page.toString(),
        'limit': limit.toString(),
      },
      responseCompiler: MedicalHistoryListResponseModel.fromJson,
    );
  }

  Future<Either<ErrorResponse, MedicalHistoryDetailsResponseModel>>
  getPatientMedicalHistoryDetails({
    required String patientId,
    required String medicalHistoryId,
  }) {
    return get(
      path: Apis.patientMedicalHistoryDetails
          .replaceFirst('{patientId}', patientId)
          .replaceFirst('{medicalHistoryId}', medicalHistoryId),
      responseCompiler: MedicalHistoryDetailsResponseModel.fromJson,
    );
  }

  Future<Either<ErrorResponse, CreateMedicalHistoryResponse>>
  createMedicalHistory({
    required String patientId,
    required CreateMedicalHistoryRequest request,
  }) {
    return post(
      path: Apis.createHistory(patientId),
      data: request.toJson(),
      responseCompiler: CreateMedicalHistoryResponse.fromJson,
    );
  }


  Future<Either<ErrorResponse, DiseaseCategoryResponse>> getDiseaseCategories() {
    return get<DiseaseCategoryResponse>(
      path: Apis.diseaseCategories,
      responseCompiler: (json) => DiseaseCategoryResponse.fromJson(json),
    );
  }




}


