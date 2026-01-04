import 'package:health_sync_question/app/core/config/network/apis.dart';
import 'package:health_sync_question/app/data/model/prescription_details_model.dart';
import 'package:health_sync_question/app/data/model/prescription_history_response_model4.dart';
import 'package:health_sync_question/app/data/model/prescription_list_response_model.dart';
import 'package:health_sync_question/app/data/model/prescription_pdf_response_model.dart';
import 'package:network/network.dart';

class PrescriptionRepository extends BaseRepository {
  Future<Either<ErrorResponse, PrescriptionListResponseModel>> getPrescription({
    Map<String, String>? query,
  }) {
    return get(
      path: Apis.prescription,
      queryParameters: query,
      responseCompiler: PrescriptionListResponseModel.fromJson,
    );
  }

  Future<Either<ErrorResponse, PrescriptionHistoryResponseModel>>
  getPrescriptionHistory({required String prescriptionId}) {
    return get(
      path: Apis.prescriptionHistory(prescriptionId),
      responseCompiler: PrescriptionHistoryResponseModel.fromJson,
    );
  }

  Future<Either<ErrorResponse, PrescriptionDetailsResponseModel>>
  getPrescriptionDetails({required String id}) {
    return get(
      path: Apis.prescriptionDetails(id),
      responseCompiler: PrescriptionDetailsResponseModel.fromJson,
    );
  }

  Future<Either<ErrorResponse, GeneratePDFResponseModel>> pdfGenerate({
    required String prescriptionId,
  }) {
    return get(
      path: Apis.prescriptionPdf(prescriptionId),
      responseCompiler: GeneratePDFResponseModel.fromJson,
    );
  }
}
