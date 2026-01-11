import 'package:common/common.dart';
import 'package:network/network.dart';

import '../../core/config/network/apis.dart';
import '../model/create_medical_history_request.dart';
import '../model/create_medical_history_response.dart';
import '../model/delete_response_model.dart';
import '../model/disease_category.dart';
import '../model/medical_history_details_response_Model.dart';

class MedicalHistoryRepository extends BaseRepository {
  Future<Either<ErrorResponse, MedicalHistoryListResponseModel>>
  getPatientMedicalHistory({
    required String patientId,
    required int page,
    int limit = 15,
  }) {
    return get(
      path: Apis.patientMedicalHistory(patientId),
      queryParameters: {'page': page.toString(), 'limit': limit.toString()},
      responseCompiler: MedicalHistoryListResponseModel.fromJson,
    );
  }

  Future<Either<ErrorResponse, MedicalHistoryDetailsResponseModel>>
  getPatientMedicalHistoryDetails({
    required String patientId,
    required String medicalHistoryId,
  }) {
    return get(
      path: Apis.patientMedicalHistoryDetails(patientId, medicalHistoryId),
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

  Future<Either<ErrorResponse, DiseaseCategoryResponse>>
  getDiseaseCategories() {
    return get<DiseaseCategoryResponse>(
      path: Apis.diseaseCategories,
      responseCompiler: (json) => DiseaseCategoryResponse.fromJson(json),
    );
  }

  updateMedicalHistory({
    required String patientId,
    required String medicalHistoryId,
    required CreateMedicalHistoryRequest request,
  }) {
    return patch(
      path: Apis.updateHistory(patientId, medicalHistoryId),
      data: request.toJson(),
      responseCompiler: CreateMedicalHistoryResponse.fromJson,
    );
  }

  Future<Either<ErrorResponse, DeleteResponseModel>>
  deleteMedicalHistory({
    required String patientId,
    required String medicalHistoryId,
  }) {
    return delete<DeleteResponseModel>(
      path: Apis.deleteHistory(patientId, medicalHistoryId),
      responseCompiler: DeleteResponseModel.fromJson,
    );
  }


}
