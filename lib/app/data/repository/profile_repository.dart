import 'package:health_sync_question/app/core/config/network/apis.dart';
import 'package:health_sync_question/app/data/model/create_profile_model.dart';
import 'package:health_sync_question/app/data/model/profile_response_model.dart';
import 'package:network/network.dart';

class ProfileRepository extends BaseRepository {
  Future<Either<ErrorResponse, ProfileResponseModel>> loadMe() {
    return get(
      path: Apis.loadMe,
      responseCompiler: ProfileResponseModel.fromJson,
    );
  }

  Future<Either<ErrorResponse, CreateProfileModel>> createProfile({
    required Map<String, dynamic> data,
  }) {
    return post<CreateProfileModel>(
      path: Apis.createProfile,
      data: data,
      requestType: RequestType.formData,
      responseCompiler: CreateProfileModel.fromJson,
      headers: {"Content-Type": "multipart/form-data"},
    );
  }

  Future<Either<ErrorResponse, CreateProfileModel>> updateProfile({
    required Map<String, dynamic> data,
  }) {
    return patch<CreateProfileModel>(
      path: Apis.createProfile,
      data: data,
      requestType: RequestType.formData,
      responseCompiler: CreateProfileModel.fromJson,
      headers: {"Content-Type": "multipart/form-data"},
    );
  }
}
