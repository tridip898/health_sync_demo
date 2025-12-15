class RoleModel {
  String? roleId;
  String? name;
  String? description;
  String? accountType;
  String? createdBy;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  Map<String, dynamic>? rolePermissions;

  RoleModel({
    this.roleId,
    this.name,
    this.description,
    this.accountType,
    this.createdBy,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.rolePermissions,
  });

  RoleModel.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    name = json['name'];
    description = json['description'];
    accountType = json['accountType'];
    createdBy = json['createdBy'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    rolePermissions = json['rolePermissions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roleId'] = roleId;
    data['name'] = name;
    data['description'] = description;
    data['accountType'] = accountType;
    data['createdBy'] = createdBy;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['rolePermissions'] = rolePermissions;
    return data;
  }
}