import 'package:network/network.dart';

class LoginResponseModel extends BaseResponseModel {
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
  User? user;

  LoginData({this.accessToken, this.refreshToken, this.user});

  LoginData.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
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

class User {
  String? userId;
  String? email;
  String? phoneNumber;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? profileId;
  List<UserRoles>? userRoles;
  Profile? profile;

  User({
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

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    profileId = json['profileId'];
    if (json['userRoles'] != null) {
      userRoles = <UserRoles>[];
      json['userRoles'].forEach((v) {
        userRoles!.add(UserRoles.fromJson(v));
      });
    }
    profile = json['profile'] != null
        ? Profile.fromJson(json['profile'])
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

class UserRoles {
  String? userRoleId;
  String? createdAt;
  String? updatedAt;
  String? userId;
  String? roleId;
  Role? role;

  UserRoles({
    this.userRoleId,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.roleId,
    this.role,
  });

  UserRoles.fromJson(Map<String, dynamic> json) {
    userRoleId = json['userRoleId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    roleId = json['roleId'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
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

class Role {
  String? roleId;
  String? name;
  String? description;
  String? accountType;
  String? createdBy;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  RolePermissions? rolePermissions;

  Role({
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

  Role.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    name = json['name'];
    description = json['description'];
    accountType = json['accountType'];
    createdBy = json['createdBy'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    rolePermissions = json['rolePermissions'] != null
        ? RolePermissions.fromJson(json['rolePermissions'])
        : null;
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
    if (rolePermissions != null) {
      data['rolePermissions'] = rolePermissions!.toJson();
    }
    return data;
  }
}

class RolePermissions {
  List<String>? aLL;
  List<String>? dOCTOR;
  List<String>? cABINET;
  List<String>? pATIENT;
  List<String>? mEDICINE;
  List<String>? eXPERIENCE;
  List<String>? aPPOINTMENT;
  List<String>? aCHIEVEMENTS;
  List<String>? pRESCRIPTION;
  List<String>? dOCTORAVAILABILITY;
  List<String>? aCADEMICQUALIFICATION;

  RolePermissions({
    this.aLL,
    this.dOCTOR,
    this.cABINET,
    this.pATIENT,
    this.mEDICINE,
    this.eXPERIENCE,
    this.aPPOINTMENT,
    this.aCHIEVEMENTS,
    this.pRESCRIPTION,
    this.dOCTORAVAILABILITY,
    this.aCADEMICQUALIFICATION,
  });

  RolePermissions.fromJson(Map<String, dynamic> json) {
    aLL = json['ALL'].cast<String>();
    dOCTOR = json['DOCTOR'].cast<String>();
    cABINET = json['CABINET'].cast<String>();
    pATIENT = json['PATIENT'].cast<String>();
    mEDICINE = json['MEDICINE'].cast<String>();
    eXPERIENCE = json['EXPERIENCE'].cast<String>();
    aPPOINTMENT = json['APPOINTMENT'].cast<String>();
    aCHIEVEMENTS = json['ACHIEVEMENTS'].cast<String>();
    pRESCRIPTION = json['PRESCRIPTION'].cast<String>();
    dOCTORAVAILABILITY = json['DOCTOR_AVAILABILITY'].cast<String>();
    aCADEMICQUALIFICATION = json['ACADEMIC_QUALIFICATION'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ALL'] = aLL;
    data['DOCTOR'] = dOCTOR;
    data['CABINET'] = cABINET;
    data['PATIENT'] = pATIENT;
    data['MEDICINE'] = mEDICINE;
    data['EXPERIENCE'] = eXPERIENCE;
    data['APPOINTMENT'] = aPPOINTMENT;
    data['ACHIEVEMENTS'] = aCHIEVEMENTS;
    data['PRESCRIPTION'] = pRESCRIPTION;
    data['DOCTOR_AVAILABILITY'] = dOCTORAVAILABILITY;
    data['ACADEMIC_QUALIFICATION'] = aCADEMICQUALIFICATION;
    return data;
  }
}

class Profile {
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

  Profile({
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

  Profile.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profileId'] = profileId;
    data['fullName'] = fullName;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    data['address'] = address;
    data['image'] = image;
    data['publicPhoneNumber'] = publicPhoneNumber;
    data['publicEmail'] = publicEmail;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
