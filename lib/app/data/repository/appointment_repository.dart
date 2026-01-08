import 'package:common/common.dart';
import 'package:health_sync_question/app/core/config/network/apis.dart';
import 'package:health_sync_question/app/data/model/appointment_details_response_model.dart';
import 'package:health_sync_question/app/data/model/appointment_list_response_model.dart';
import 'package:health_sync_question/app/data/model/general_data_model.dart';
import 'package:health_sync_question/app/data/model/questionnaire_response_model.dart';
import 'package:health_sync_question/app/data/model/request/create_appointment_request_model.dart';
import 'package:network/network.dart';

class AppointmentRepository extends BaseRepository {
  Future<Either<ErrorResponse, GeneralResponseModel>> createAppointment({
    required CreateAppointmentRequest requestModel,
  }) {
    return post(
      path: Apis.appointment,
      data: requestModel.toJson(),
      responseCompiler: GeneralResponseModel.fromJson,
    );
  }

  Future<Either<ErrorResponse, AppointmentResponseModel>> getAppointmentList({
    required int page,
  }) {
    return get(
      path: Apis.appointment,
      queryParameters: {"page": page.toString()},
      responseCompiler: AppointmentResponseModel.fromJson,
    );
  }

  Future<Either<ErrorResponse, AppointmentDetailsResponseModel>>
  getAppointmentDetails({required String appointmentId}) {
    return get(
      path: Apis.appointmentDetails(appointmentId),
      responseCompiler: AppointmentDetailsResponseModel.fromJson,
    );
  }

  Future<Either<ErrorResponse, QuestionnaireResponseModel>>
  getQuestionnaireResponse(List<Map<String, String>> questionnaire) {
    return post(
      path: Apis.questionnaire,
      data: questionnaire,
      responseCompiler: QuestionnaireResponseModel.fromJson,
    );
  }
}
