import 'package:health_sync_question/app/core/config/network/apis.dart';
import 'package:health_sync_question/app/data/model/login_response_model.dart';
import 'package:network/network.dart';

class ProfileRepository extends BaseRepository {
  Future<Either<ErrorResponse, LoginResponseModel>> loadMe() {
    return get(
      path: Apis.loadMe,
      responseCompiler: LoginResponseModel.fromJson,
    );
  }
}
