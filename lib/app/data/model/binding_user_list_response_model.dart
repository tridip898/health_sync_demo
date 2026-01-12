import 'package:network/network.dart';

class BindingUserListResponseModel
    extends BaseResponseModel<List<BindingUserModel>> {
  bool? status;
  int? statusCode;

  BindingUserListResponseModel({
    this.status,
    super.message,
    this.statusCode,
    super.data,
  });

  BindingUserListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <BindingUserModel>[];
      json['data'].forEach((v) {
        data?.add(new BindingUserModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BindingUserModel {
  String? profileId;
  String? fullName;
  String? gender;
  String? dateOfBirth;
  String? address;
  String? image;
  String? publicPhoneNumber;
  String? publicEmail;
  String? createdAt;
  String? updatedAt;

  BindingUserModel({
    this.profileId,
    this.fullName,
    this.gender,
    this.dateOfBirth,
    this.address,
    this.image,
    this.publicPhoneNumber,
    this.publicEmail,
    this.createdAt,
    this.updatedAt,
  });

  BindingUserModel.fromJson(Map<String, dynamic> json) {
    profileId = json['profileId'];
    fullName = json['fullName'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    address = json['address'];
    image = json['image'];
    publicPhoneNumber = json['publicPhoneNumber'];
    publicEmail = json['publicEmail'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profileId'] = this.profileId;
    data['fullName'] = this.fullName;
    data['gender'] = this.gender;
    data['dateOfBirth'] = this.dateOfBirth;
    data['address'] = this.address;
    data['image'] = this.image;
    data['publicPhoneNumber'] = this.publicPhoneNumber;
    data['publicEmail'] = this.publicEmail;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
