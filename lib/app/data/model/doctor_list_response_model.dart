import 'package:health_sync_question/app/data/model/meta_model.dart';
import 'package:health_sync_question/app/data/model/profile_model.dart';
import 'package:network/network.dart';

class DoctorListResponseModel extends BaseResponseModel<List<DoctorModel>> {
  bool? status;
  int? statusCode;
  MetaModel? meta;

  DoctorListResponseModel({
    this.status,
    this.statusCode,
    this.meta,
    super.message,
    super.data,
  });

  DoctorListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DoctorModel>[];
      json['data'].forEach((v) {
        data!.add(DoctorModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? MetaModel.fromJson(json['meta']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class DoctorModel {
  String? doctorId;
  int? consultationFee;
  String? licenseNumber;
  int? yearExperience;
  bool? verified;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? userRoleId;
  String? profileId;
  ProfileModel? profile;

  DoctorModel({
    this.doctorId,
    this.consultationFee,
    this.licenseNumber,
    this.yearExperience,
    this.verified,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.userRoleId,
    this.profileId,
    this.profile,
  });

  DoctorModel.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctorId'];
    consultationFee = json['consultationFee'];
    licenseNumber = json['licenseNumber'];
    yearExperience = json['yearExperience'];
    verified = json['verified'];
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
    data['doctorId'] = doctorId;
    data['consultationFee'] = consultationFee;
    data['licenseNumber'] = licenseNumber;
    data['yearExperience'] = yearExperience;
    data['verified'] = verified;
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
