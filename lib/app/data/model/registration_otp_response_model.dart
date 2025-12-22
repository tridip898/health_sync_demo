import 'package:network/network.dart';

class RegistrationOtpResponseModel
    extends BaseResponseModel<RegistrationOtpData> {
  bool? status;
  int? statusCode;

  RegistrationOtpResponseModel({
    this.status,
    super.message,
    this.statusCode,
    super.data,
  });

  RegistrationOtpResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    data = json['data'] != null
        ? RegistrationOtpData.fromJson(json['data'])
        : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['status'] = status;
    json['message'] = message;
    json['status_code'] = statusCode;
    if (data != null) {
      json['data'] = data!.toJson();
    }
    return json;
  }
}

class RegistrationOtpData {
  String? otp;
  String? otpPrefix;

  RegistrationOtpData({this.otp, this.otpPrefix});

  RegistrationOtpData.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    otpPrefix = json['otpPrefix'];
  }

  Map<String, dynamic> toJson() {
    return {"otp": otp, "otpPrefix": otpPrefix};
  }
}
