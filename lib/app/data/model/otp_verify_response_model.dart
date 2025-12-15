import 'package:network/network.dart';

class OtpVerifyResponseModel
    extends BaseResponseModel<OtpVerifyData> {
  bool? status;
  int? statusCode;

  OtpVerifyResponseModel({
    this.status,
    super.message,
    this.statusCode,
    super.data,
  });

  OtpVerifyResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    data = json['data'] != null
        ? OtpVerifyData.fromJson(json['data'])
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

class OtpVerifyData {
  String? otpToken;

  OtpVerifyData({this.otpToken});

  OtpVerifyData.fromJson(Map<String, dynamic> json) {
    otpToken = json['otpToken'];
  }

  Map<String, dynamic> toJson() {
    return {
      "otpToken": otpToken,
    };
  }
}
