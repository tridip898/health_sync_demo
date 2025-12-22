import 'package:health_sync_question/app/core/config/network/apis.dart';
import 'package:health_sync_question/app/data/model/login_response_model.dart';
import 'package:network/network.dart';

import '../model/otp_verify_response_model.dart';
import '../model/registration_otp_response_model.dart';
import '../model/set_password.dart';

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

  Future<Either<ErrorResponse, RegistrationOtpResponseModel>>
  sendRegistrationOtp({required String phoneNumber}) {
    return post(
      path: Apis.registrationSendOtp,
      data: {"phoneNumber": phoneNumber},
      responseCompiler: RegistrationOtpResponseModel.fromJson,
    );
  }

  Future<Either<ErrorResponse, RegistrationOtpResponseModel>>
  sendForgotPasswordOtp({required String phoneNumber}) {
    return post(
      path: Apis.forgotPasswordSendOtp,
      data: {"phoneNumber": phoneNumber},
      responseCompiler: RegistrationOtpResponseModel.fromJson,
    );
  }

  Future<Either<ErrorResponse, OtpVerifyResponseModel>> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) {
    return post(
      path: Apis.verifyOtp,
      data: {"phoneNumber": phoneNumber, "otp": otp},
      responseCompiler: OtpVerifyResponseModel.fromJson,
    );
  }

  Future<Either<ErrorResponse, SetNewPasswordResponseModel>> setNewPassword({
    required String tempToken,
    required String password,
  }) async {
    return post(
      path: Apis.set_password,
      data: {"tempToken": tempToken, "password": password},
      responseCompiler: SetNewPasswordResponseModel.fromJson,
    );
  }

  Future<Either<ErrorResponse, SetNewPasswordResponseModel>> resetNewPassword({
    required String tempToken,
    required String password,
  }) async {
    return post(
      path: Apis.reset_password,
      data: {"tempToken": tempToken, "password": password},
      responseCompiler: SetNewPasswordResponseModel.fromJson,
    );
  }
}
