import 'package:health_sync_question/app/core/config/network/apis.dart';
import 'package:health_sync_question/app/data/model/doctor_details_response_model.dart';
import 'package:health_sync_question/app/data/model/doctor_details_response_model.dart';
import 'package:health_sync_question/app/data/model/doctor_list_response_model.dart';
import 'package:health_sync_question/app/data/model/specialty_list_response_model.dart';
import 'package:health_sync_question/app/data/model/specialty_list_response_model.dart';
import 'package:network/network.dart';

class DoctorRepository extends BaseRepository {
  Future<Either<ErrorResponse, DoctorListResponseModel>> getDoctorList({
    required int page,
    int limit = 15,
    required String search,
    required bool? activeFilter,
    required String? specialtyId,
    required String? organizationId,
  }) {
    return get(
      path: Apis.doctorList,
      queryParameters: {
        'page': page.toString(),
        'limit': limit.toString(),
        'search': search,
        if (activeFilter != null) 'active': activeFilter.toString(),
        if (organizationId != null) 'organizationId': organizationId,
        if (specialtyId != null) 'specialityId': specialtyId,
      },
      responseCompiler: DoctorListResponseModel.fromJson,
    );
  }

  Future<Either<ErrorResponse, SpecialtyListResponseModel>> getSpecialtyList() {
    return get(
      path: Apis.specialtyList,
      responseCompiler: SpecialtyListResponseModel.fromJson,
    );
  }

  Future<Either<ErrorResponse, DoctorDetailsResponseModel>> getDoctorDetails({
    required dynamic doctorId,
  }) {
    return get(
      path: Apis.doctorDetails(doctorId),
      responseCompiler: DoctorDetailsResponseModel.fromJson,
    );
  }
}
