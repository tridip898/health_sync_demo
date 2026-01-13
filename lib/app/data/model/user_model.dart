import 'package:health_sync_question/app/data/model/current_role_model.dart';
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
  CurrentRoleModel? currentRole;
  UserBindRequestId? userBindRequestId;

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
    this.currentRole,
    this.userBindRequestId,
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
    currentRole = json['currentRole'] != null
        ? CurrentRoleModel.fromJson(json['currentRole'])
        : null;
    userBindRequestId = json['userBindRequestId'] != null
        ? new UserBindRequestId.fromJson(json['userBindRequestId'])
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
    if (currentRole != null) {
      data['currentRole'] = currentRole!.toJson();
    }
    if (this.userBindRequestId != null) {
      data['userBindRequestId'] = this.userBindRequestId?.toJson();
    }
    return data;
  }
}

class UserBindRequestId {
  String? userBindRequestId;
  String? userBindRequestStatus;
  String? profileId;
  String? userId;
  ProfileModel? profile;

  UserBindRequestId({
    this.userBindRequestId,
    this.userBindRequestStatus,
    this.profileId,
    this.userId,
    this.profile,
  });

  UserBindRequestId.fromJson(Map<String, dynamic> json) {
    userBindRequestId = json['userBindRequestId'];
    userBindRequestStatus = json['userBindRequestStatus'];
    profileId = json['profileId'];
    userId = json['userId'];
    profile = json['profile'] != null
        ? ProfileModel.fromJson(json['profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userBindRequestId'] = this.userBindRequestId;
    data['userBindRequestStatus'] = this.userBindRequestStatus;
    data['profileId'] = this.profileId;
    data['userId'] = this.userId;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}
