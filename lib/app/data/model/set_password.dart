import 'package:network/network.dart';

class SetNewPasswordResponseModel extends BaseResponseModel<SetNewPasswordData> {
  bool? status;
  int? statusCode;

  SetNewPasswordResponseModel({
    this.status,
    super.message,
    this.statusCode,
    super.data,
  });

  SetNewPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    data = json['data'] != null
        ? SetNewPasswordData.fromJson(json['data'])
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

class SetNewPasswordData {
  String? accessToken;
  String? refreshToken;
  User? user;

  SetNewPasswordData({this.accessToken, this.refreshToken, this.user});

  SetNewPasswordData.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? userId;
  String? email;
  String? phoneNumber;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? profileId;

  User({
    this.userId,
    this.email,
    this.phoneNumber,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.profileId,
  });

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    profileId = json['profileId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userId'] = userId;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['profileId'] = profileId;
    return data;
  }
}
