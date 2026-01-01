import 'package:health_sync_question/app/data/model/profile_model.dart';
import 'package:health_sync_question/app/data/model/profile_model.dart';
import 'package:health_sync_question/app/data/model/user_model.dart';
import 'package:network/network.dart';

class ProfileResponseModel extends BaseResponseModel<UserModel> {
  bool? status;
  int? statusCode;

  ProfileResponseModel({
    this.status,
    this.statusCode,
    super.message,
    super.data,
  });

  ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
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

class Patient {
  String? patientId;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? userRoleId;
  String? profileId;
  ProfileModel? profile;

  Patient({
    this.patientId,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.userRoleId,
    this.profileId,
    this.profile,
  });

  Patient.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userRoleId = json['userRoleId'];
    profileId = json['profileId'];
    profile = json['profile'] != null
        ? ProfileModel.fromJson(json['profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patientId'] = patientId;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['userRoleId'] = userRoleId;
    data['profileId'] = profileId;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}
