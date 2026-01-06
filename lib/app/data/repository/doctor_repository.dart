import 'package:common/common.dart';
import 'package:health_sync_question/app/core/config/network/apis.dart';
import 'package:health_sync_question/app/data/model/doctor_details_response_model.dart';
import 'package:health_sync_question/app/data/model/doctor_details_response_model.dart';
import 'package:health_sync_question/app/data/model/doctor_list_response_model.dart';
import 'package:health_sync_question/app/data/model/specialty_list_response_model.dart';
import 'package:health_sync_question/app/data/model/specialty_list_response_model.dart';
import 'package:health_sync_question/app/data/model/specialty_model.dart';
import 'package:network/network.dart';

class DoctorRepository extends BaseRepository {
  Future<Either<ErrorResponse, DoctorListResponseModel>> getDoctorList({
    required int page,
    int limit = 15,
    required String search,
    required bool? activeFilter,
    required List<SpecialtyModel> specialtyId,
    required String? organizationId,
  }) {
    final query = <String, String>{};
    query['page'] = page.toString();
    query['limit'] = limit.toString();
    query['search'] = search;
    if (activeFilter != null) {
      query['active'] = activeFilter.toString();
    }
    if (organizationId != null) {
      query['organizationId'] = organizationId;
    }
    if (specialtyId.isNotEmpty) {
      for (var i = 0; i < (specialtyId.length); i++) {
        query['specialtyId[$i]'] = specialtyId[i].specialtyId ?? '';
      }
    }
    return get(
      path: Apis.doctorList,
      queryParameters: query,
      /* queryParameters: {
        'page': page.toString(),
        'limit': limit.toString(),
        'search': search,
        if (activeFilter != null) 'active': activeFilter.toString(),
        if (organizationId != null) 'organizationId': organizationId,
        if (specialtyId.isNotEmpty)
          for (var i = 0; i < (specialtyId.length); i++)
            'specialtyId[$i]': specialtyId[i].specialtyId ?? '',
      },*/
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
