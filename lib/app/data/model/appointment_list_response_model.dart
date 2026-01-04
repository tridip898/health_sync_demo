import 'package:health_sync_question/app/data/model/doctor_model.dart';
import 'package:health_sync_question/app/data/model/meta_model.dart';
import 'package:health_sync_question/app/data/model/organization_response_model.dart';
import 'package:health_sync_question/app/data/model/profile_response_model.dart';
import 'package:network/network.dart';

class AppointmentResponseModel
    extends BaseResponseModel<List<AppointmentModel>> {
  bool? status;
  int? statusCode;
  MetaModel? meta;

  AppointmentResponseModel({
    this.status,
    this.statusCode,
    this.meta,
    super.message,
    super.data,
  });

  AppointmentResponseModel.fromJson(Map<String, dynamic> json) {
    try {
      status = json['status'];
      statusCode = json['status_code'];
      message = json['message'];
      if (json['data'] != null) {
        data = <AppointmentModel>[];
        json['data'].forEach((v) {
          data!.add(AppointmentModel.fromJson(v));
        });
      }
      meta = json['meta'] != null ? MetaModel.fromJson(json['meta']) : null;
    } catch (error) {
      print('model conversion error');
      print(error);
    }
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

class AppointmentModel {
  String? appointmentId;
  String? status;
  String? appointmentDate;
  String? createdAt;
  String? updatedAt;
  String? patientId;
  String? doctorId;
  String? organizationId;
  String? extra;
  String? note;
  Patient? patient;
  DoctorModel? doctor;
  OrganizationModel? organization;

  AppointmentModel({
    this.appointmentId,
    this.status,
    this.appointmentDate,
    this.createdAt,
    this.updatedAt,
    this.patientId,
    this.doctorId,
    this.organizationId,
    this.extra,
    this.note,
    this.patient,
    this.doctor,
    this.organization,
  });

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointmentId'];
    status = json['status'];
    appointmentDate = json['appointmentDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    patientId = json['patientId'];
    doctorId = json['doctorId'];
    organizationId = json['organizationId'];
    extra = json['extra'];
    note = json['note'];
    patient = json['patient'] != null
        ? Patient.fromJson(json['patient'])
        : null;
    doctor = json['doctor'] != null
        ? DoctorModel.fromJson(json['doctor'])
        : null;
    organization = json['organization'] != null
        ? OrganizationModel.fromJson(json['organization'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointmentId'] = appointmentId;
    data['status'] = status;
    data['appointmentDate'] = appointmentDate;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['patientId'] = patientId;
    data['doctorId'] = doctorId;
    data['organizationId'] = organizationId;
    data['extra'] = extra;
    data['note'] = note;
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    if (organization != null) {
      data['organization'] = organization!.toJson();
    }
    return data;
  }
}
