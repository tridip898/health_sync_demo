import 'package:health_sync_question/app/data/model/role_model.dart';

class UserRoleModel {
  String? userRoleId;
  String? createdAt;
  String? updatedAt;
  String? userId;
  String? roleId;
  RoleModel? role;

  UserRoleModel({
    this.userRoleId,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.roleId,
    this.role,
  });

  UserRoleModel.fromJson(Map<String, dynamic> json) {
    userRoleId = json['userRoleId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    roleId = json['roleId'];
    role = json['role'] != null ? RoleModel.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userRoleId'] = userRoleId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['userId'] = userId;
    data['roleId'] = roleId;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    return data;
  }
}
