import 'package:network/network.dart';

class RoleListResponse extends BaseResponseModel<List<RoleData>> {
  bool? status;
  int? statusCode;

  RoleListResponse({this.status, super.message, this.statusCode, super.data});

  RoleListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <RoleData>[];
      json['data'].forEach((v) {
        data!.add(RoleData.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['status_code'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RoleData {
  String? roleId;
  String? name;
  String? description;
  String? accountType;
  String? createdBy;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  RolePermissions? rolePermissions;

  RoleData({
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

  RoleData.fromJson(Map<String, dynamic> json) {
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
  List<String>? all;
  List<String>? profile;
  List<String>? admin;
  List<String>? doctor;
  List<String>? patient;
  List<String>? organization;
  List<String>? role;
  List<String>? rolePermission;
  List<String>? userRole;
  List<String>? specialty;
  List<String>? academicQualification;
  List<String>? experience;
  List<String>? achievements;
  List<String>? doctorAvailability;
  List<String>? timeSlot;
  List<String>? appointment;
  List<String>? medicineType;
  List<String>? medicine;
  List<String>? medicineAlarm;
  List<String>? alarmSchedule;
  List<String>? cabinet;
  List<String>? cart;
  List<String>? cartItem;
  List<String>? order;
  List<String>? orderItem;
  List<String>? prescription;
  List<String>? report;
  List<String>? reportFolder;
  List<String>? sharedReport;
  List<String>? review;
  List<String>? feedback;
  List<String>? organizationType;
  List<String>? organizationFacility;
  List<String>? organizationOperator;

  RolePermissions({
    this.all,
    this.profile,
    this.admin,
    this.doctor,
    this.patient,
    this.organization,
    this.role,
    this.rolePermission,
    this.userRole,
    this.specialty,
    this.academicQualification,
    this.experience,
    this.achievements,
    this.doctorAvailability,
    this.timeSlot,
    this.appointment,
    this.medicineType,
    this.medicine,
    this.medicineAlarm,
    this.alarmSchedule,
    this.cabinet,
    this.cart,
    this.cartItem,
    this.order,
    this.orderItem,
    this.prescription,
    this.report,
    this.reportFolder,
    this.sharedReport,
    this.review,
    this.feedback,
    this.organizationType,
    this.organizationFacility,
    this.organizationOperator,
  });

  RolePermissions.fromJson(Map<String, dynamic> json) {
    all = json['ALL']?.cast<String>();
    profile = json['PROFILE']?.cast<String>();
    admin = json['ADMIN']?.cast<String>();
    doctor = json['DOCTOR']?.cast<String>();
    patient = json['PATIENT']?.cast<String>();
    organization = json['ORGANIZATION']?.cast<String>();
    role = json['ROLE']?.cast<String>();
    rolePermission = json['ROLE_PERMISSION']?.cast<String>();
    userRole = json['USER_ROLE']?.cast<String>();
    specialty = json['SPECIALTY']?.cast<String>();
    academicQualification = json['ACADEMIC_QUALIFICATION']?.cast<String>();
    experience = json['EXPERIENCE']?.cast<String>();
    achievements = json['ACHIEVEMENTS']?.cast<String>();
    doctorAvailability = json['DOCTOR_AVAILABILITY']?.cast<String>();
    timeSlot = json['TIME_SLOT']?.cast<String>();
    appointment = json['APPOINTMENT']?.cast<String>();
    medicineType = json['MEDICINE_TYPE']?.cast<String>();
    medicine = json['MEDICINE']?.cast<String>();
    medicineAlarm = json['MEDICINE_ALARM']?.cast<String>();
    alarmSchedule = json['ALARM_SCHEDULE']?.cast<String>();
    cabinet = json['CABINET']?.cast<String>();
    cart = json['CART']?.cast<String>();
    cartItem = json['CART_ITEM']?.cast<String>();
    order = json['ORDER']?.cast<String>();
    orderItem = json['ORDER_ITEM']?.cast<String>();
    prescription = json['PRESCRIPTION']?.cast<String>();
    report = json['REPORT']?.cast<String>();
    reportFolder = json['REPORT_FOLDER']?.cast<String>();
    sharedReport = json['SHARED_REPORT']?.cast<String>();
    review = json['REVIEW']?.cast<String>();
    feedback = json['FEEDBACK']?.cast<String>();
    organizationType = json['ORGANIZATION_TYPE']?.cast<String>();
    organizationFacility = json['ORGANIZATION_FACILITY']?.cast<String>();
    organizationOperator = json['ORGANIZATION_OPERATOR']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['ALL'] = all;
    data['PROFILE'] = profile;
    data['ADMIN'] = admin;
    data['DOCTOR'] = doctor;
    data['PATIENT'] = patient;
    data['ORGANIZATION'] = organization;
    data['ROLE'] = role;
    data['ROLE_PERMISSION'] = rolePermission;
    data['USER_ROLE'] = userRole;
    data['SPECIALTY'] = specialty;
    data['ACADEMIC_QUALIFICATION'] = academicQualification;
    data['EXPERIENCE'] = experience;
    data['ACHIEVEMENTS'] = achievements;
    data['DOCTOR_AVAILABILITY'] = doctorAvailability;
    data['TIME_SLOT'] = timeSlot;
    data['APPOINTMENT'] = appointment;
    data['MEDICINE_TYPE'] = medicineType;
    data['MEDICINE'] = medicine;
    data['MEDICINE_ALARM'] = medicineAlarm;
    data['ALARM_SCHEDULE'] = alarmSchedule;
    data['CABINET'] = cabinet;
    data['CART'] = cart;
    data['CART_ITEM'] = cartItem;
    data['ORDER'] = order;
    data['ORDER_ITEM'] = orderItem;
    data['PRESCRIPTION'] = prescription;
    data['REPORT'] = report;
    data['REPORT_FOLDER'] = reportFolder;
    data['SHARED_REPORT'] = sharedReport;
    data['REVIEW'] = review;
    data['FEEDBACK'] = feedback;
    data['ORGANIZATION_TYPE'] = organizationType;
    data['ORGANIZATION_FACILITY'] = organizationFacility;
    data['ORGANIZATION_OPERATOR'] = organizationOperator;
    return data;
  }
}
