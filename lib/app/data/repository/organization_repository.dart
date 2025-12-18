import 'package:health_sync_question/app/core/config/network/apis.dart';
import 'package:health_sync_question/app/data/model/organization_response_model.dart';
import 'package:network/network.dart';

class OrganizationRepository extends BaseRepository {
  Future<Either<ErrorResponse, OrganizationResponseModel>> getOrganizationList({
    int page = 1,
    int limit = 15,
    required String search,
  }) async {
    return get(
      path: Apis.organizationList,
      queryParameters: {
        'page': page.toString(),
        'limit': limit.toString(),
        'search': search,
      },
      responseCompiler: OrganizationResponseModel.fromJson,
    );
  }
}
