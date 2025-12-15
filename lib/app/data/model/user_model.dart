import 'package:health_sync_question/app/data/model/profile_model.dart';
import 'package:health_sync_question/app/data/model/user_role_model.dart';

class UserModel {
  String? userId;
  String? email;
  String? phoneNumber;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? profileId;
  List<UserRoleModel>? userRoles;
  ProfileModel? profile;

  UserModel({
    this.userId,
    this.email,
    this.phoneNumber,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.profileId,
    this.userRoles,
    this.profile,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    profileId = json['profileId'];
    if (json['userRoles'] != null) {
      userRoles = <UserRoleModel>[];
      json['userRoles'].forEach((v) {
        userRoles!.add(UserRoleModel.fromJson(v));
      });
    }
    profile = json['profile'] != null
        ? ProfileModel.fromJson(json['profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['profileId'] = profileId;
    if (userRoles != null) {
      data['userRoles'] = userRoles!.map((v) => v.toJson()).toList();
    }
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}