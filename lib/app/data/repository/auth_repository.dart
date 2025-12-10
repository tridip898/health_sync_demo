import 'package:health_sync_question/app/core/config/network/apis.dart';
import 'package:health_sync_question/app/data/model/login_response_model.dart';
import 'package:network/network.dart';

class AuthRepository extends BaseRepository {
  Future<Either<ErrorResponse, LoginResponseModel>> login({
    required String phoneNumber,
    required String password,
  }) {
    return post(
      path: Apis.login,
      data: {"phoneNumber": phoneNumber, "password": password},
      responseCompiler: LoginResponseModel.fromJson,
    );
  }
}
