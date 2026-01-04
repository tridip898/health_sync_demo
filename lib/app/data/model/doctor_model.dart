import 'package:health_sync_question/app/data/model/academic_qualification_model.dart';
import 'package:health_sync_question/app/data/model/achievement_model.dart';
import 'package:health_sync_question/app/data/model/doctor_availability_model.dart';
import 'package:health_sync_question/app/data/model/doctor_experience_model.dart';
import 'package:health_sync_question/app/data/model/doctor_specialty_model.dart';
import 'package:health_sync_question/app/data/model/organization_response_model.dart';
import 'package:health_sync_question/app/data/model/profile_model.dart';

class DoctorModel {
  String? doctorId;
  num? consultationFee;
  String? licenseNumber;
  int? yearExperience;
  bool? verified;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? userRoleId;
  String? profileId;
  ProfileModel? profile;
  List<AchievementModel>? achievements;
  List<DoctorSpecialtyModel>? doctorSpecialties;
  List<AcademicQualificationModel>? doctorAcademicQualification;
  List<DoctorOrganizationModel>? doctorOrganizations;
  List<DoctorExperienceModel>? doctorExperiences;

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
    this.achievements,
    this.doctorSpecialties,
    this.doctorAcademicQualification,
    this.doctorOrganizations,
    this.doctorExperiences,
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
    if (json['achievements'] != null) {
      achievements = <AchievementModel>[];
      json['achievements'].forEach((v) {
        achievements!.add(AchievementModel.fromJson(v));
      });
    }
    if (json['doctorSpecialties'] != null) {
      doctorSpecialties = <DoctorSpecialtyModel>[];
      json['doctorSpecialties'].forEach((v) {
        doctorSpecialties!.add(DoctorSpecialtyModel.fromJson(v));
      });
    }
    if (json['doctorAcademicQualification'] != null) {
      doctorAcademicQualification = <AcademicQualificationModel>[];
      json['doctorAcademicQualification'].forEach((v) {
        doctorAcademicQualification!.add(
          AcademicQualificationModel.fromJson(v),
        );
      });
    }
    if (json['doctorOrganizations'] != null) {
      doctorOrganizations = <DoctorOrganizationModel>[];
      json['doctorOrganizations'].forEach((v) {
        doctorOrganizations!.add(DoctorOrganizationModel.fromJson(v));
      });
    }
    if (json['doctorExperiences'] != null) {
      doctorExperiences = <DoctorExperienceModel>[];
      json['doctorExperiences'].forEach((v) {
        doctorExperiences!.add(DoctorExperienceModel.fromJson(v));
      });
    }
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
      data['profile'] = profile?.toJson();
    }
    if (achievements != null) {
      data['achievements'] = achievements!.map((v) => v.toJson()).toList();
    }
    if (doctorSpecialties != null) {
      data['doctorSpecialties'] = doctorSpecialties!
          .map((v) => v.toJson())
          .toList();
    }
    if (doctorAcademicQualification != null) {
      data['doctorAcademicQualification'] = doctorAcademicQualification!
          .map((v) => v.toJson())
          .toList();
    }
    if (doctorOrganizations != null) {
      data['doctorOrganizations'] = doctorOrganizations!
          .map((v) => v.toJson())
          .toList();
    }
    if (doctorExperiences != null) {
      data['doctorExperiences'] = doctorExperiences!
          .map((v) => v.toJson())
          .toList();
    }
    return data;
  }
}
