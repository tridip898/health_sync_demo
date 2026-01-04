import 'package:network/network.dart';

class UserCurrentRoleModel extends BaseResponseModel<CurrentUserRole> {
  bool? status;
  int? statusCode;

  UserCurrentRoleModel({
    this.status,
    super.message,
    this.statusCode,
    super.data,
  });

  UserCurrentRoleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    data = json['data'] != null
        ? new CurrentUserRole.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class CurrentUserRole {
  String? accessToken;
  String? refreshToken;
  User? user;

  CurrentUserRole({this.accessToken, this.refreshToken, this.user});

  CurrentUserRole.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    return data;
  }
}

class User {
  String? userId;
  Null email;
  String? phoneNumber;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? profileId;
  List<UserRoles>? userRoles;
  Profile? profile;
  CurrentRole? currentRole;

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
    this.currentRole,
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
        userRoles?.add(new UserRoles.fromJson(v));
      });
    }
    profile = json['profile'] != null
        ? new Profile.fromJson(json['profile'])
        : null;
    currentRole = json['currentRole'] != null
        ? new CurrentRole.fromJson(json['currentRole'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['profileId'] = this.profileId;
    data['userRoles'] = this.userRoles?.map((v) => v.toJson()).toList();
    data['profile'] = this.profile?.toJson();
    data['currentRole'] = this.currentRole?.toJson();
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
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userRoleId'] = this.userRoleId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['userId'] = this.userId;
    data['roleId'] = this.roleId;
    data['role'] = this.role?.toJson();
    return data;
  }
}

class Role {
  String? roleId;
  String? name;
  String? description;
  String? accountType;
  Null createdBy;
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
        ? new RolePermissions.fromJson(json['rolePermissions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roleId'] = this.roleId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['accountType'] = this.accountType;
    data['createdBy'] = this.createdBy;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.rolePermissions != null) {
      data['rolePermissions'] = this.rolePermissions?.toJson();
    }
    return data;
  }
}

class RolePermissions {
  List<String>? dOCTOR;
  List<String>? cABINET;
  List<String>? pATIENT;
  List<String>? mEDICINE;
  List<String>? eXPERIENCE;
  List<String>? aCHIEVEMENTS;
  List<String>? aCADEMICQUALIFICATION;
  List<String>? oRGANIZATION;
  List<String>? oRGANIZATIONFACILITYTYPE;
  List<String>? aLARMSCHEDULE;
  List<String>? dISEASECATEGORY;
  List<String>? pATIENTMEDICALHISTORY;

  RolePermissions({
    this.dOCTOR,
    this.cABINET,
    this.pATIENT,
    this.mEDICINE,
    this.eXPERIENCE,
    this.aCHIEVEMENTS,
    this.aCADEMICQUALIFICATION,
    this.oRGANIZATION,
    this.oRGANIZATIONFACILITYTYPE,
    this.aLARMSCHEDULE,
    this.dISEASECATEGORY,
    this.pATIENTMEDICALHISTORY,
  });

  RolePermissions.fromJson(Map<String, dynamic> json) {
    dOCTOR = json['DOCTOR'] != null ? List<String>.from(json['DOCTOR']) : [];
    cABINET = json['CABINET'] != null ? List<String>.from(json['CABINET']) : [];
    pATIENT = json['PATIENT'] != null ? List<String>.from(json['PATIENT']) : [];
    mEDICINE = json['MEDICINE'] != null
        ? List<String>.from(json['MEDICINE'])
        : [];
    eXPERIENCE = json['EXPERIENCE'] != null
        ? List<String>.from(json['EXPERIENCE'])
        : [];
    aCHIEVEMENTS = json['ACHIEVEMENTS'] != null
        ? List<String>.from(json['ACHIEVEMENTS'])
        : [];
    aCADEMICQUALIFICATION = json['ACADEMIC_QUALIFICATION'] != null
        ? List<String>.from(json['ACADEMIC_QUALIFICATION'])
        : [];
    oRGANIZATION = json['ORGANIZATION'] != null
        ? List<String>.from(json['ORGANIZATION'])
        : [];
    oRGANIZATIONFACILITYTYPE = json['ORGANIZATION_FACILITY_TYPE'] != null
        ? List<String>.from(json['ORGANIZATION_FACILITY_TYPE'])
        : [];
    aLARMSCHEDULE = json['ALARM_SCHEDULE'] != null
        ? List<String>.from(json['ALARM_SCHEDULE'])
        : [];
    dISEASECATEGORY = json['DISEASE_CATEGORY'] != null
        ? List<String>.from(json['DISEASE_CATEGORY'])
        : [];
    pATIENTMEDICALHISTORY = json['PATIENT_MEDICAL_HISTORY'] != null
        ? List<String>.from(json['PATIENT_MEDICAL_HISTORY'])
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DOCTOR'] = this.dOCTOR;
    data['CABINET'] = this.cABINET;
    data['PATIENT'] = this.pATIENT;
    data['MEDICINE'] = this.mEDICINE;
    data['EXPERIENCE'] = this.eXPERIENCE;
    data['ACHIEVEMENTS'] = this.aCHIEVEMENTS;
    data['ACADEMIC_QUALIFICATION'] = this.aCADEMICQUALIFICATION;
    data['ORGANIZATION'] = this.oRGANIZATION;
    data['ORGANIZATION_FACILITY_TYPE'] = this.oRGANIZATIONFACILITYTYPE;
    data['ALARM_SCHEDULE'] = this.aLARMSCHEDULE;
    data['DISEASE_CATEGORY'] = this.dISEASECATEGORY;
    data['PATIENT_MEDICAL_HISTORY'] = this.pATIENTMEDICALHISTORY;
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

class CurrentRole {
  String? userRoleId;
  String? createdAt;
  String? updatedAt;
  String? userId;
  String? roleId;

  CurrentRole({
    this.userRoleId,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.roleId,
  });

  CurrentRole.fromJson(Map<String, dynamic> json) {
    userRoleId = json['userRoleId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    roleId = json['roleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userRoleId'] = this.userRoleId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['userId'] = this.userId;
    data['roleId'] = this.roleId;
    return data;
  }
}
