import 'package:health_sync_question/app/core/config/network/apis.dart';
import 'package:health_sync_question/app/data/model/profile_response_model.dart';
import 'package:network/network.dart';

class ProfileRepository extends BaseRepository {
  Future<Either<ErrorResponse, ProfileResponseModel>> loadMe() {
    return get(
      path: Apis.loadMe,
      responseCompiler: ProfileResponseModel.fromJson,
    );
  }
}
