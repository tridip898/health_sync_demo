import 'package:network/network.dart';

import '../../core/config/network/apis.dart';
import '../model/medical_history_details_response_Model.dart';

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

}


