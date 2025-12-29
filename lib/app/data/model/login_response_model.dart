import 'package:health_sync_question/app/data/model/user_model.dart';
import 'package:network/network.dart';

class LoginResponseModel extends BaseResponseModel<LoginData> {
  bool? status;
  int? statusCode;

  LoginResponseModel({this.status, super.message, this.statusCode, super.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['status_code'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginData {
  String? accessToken;
  String? refreshToken;
  UserModel? user;

  LoginData({this.accessToken, this.refreshToken, this.user});

  LoginData.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
