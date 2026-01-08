import 'package:health_sync_question/app/data/model/academic_qualification_model.dart';
import 'package:health_sync_question/app/data/model/doctor_model.dart';
import 'package:health_sync_question/app/data/model/doctor_specialty_model.dart';
import 'package:health_sync_question/app/data/model/meta_model.dart';
import 'package:health_sync_question/app/data/model/profile_model.dart';
import 'package:network/network.dart';

class DoctorListResponseModel extends BaseResponseModel<List<DoctorModel>> {
  bool? status;
  int? statusCode;
  MetaModel? meta;

  DoctorListResponseModel({
    this.status,
    this.statusCode,
    this.meta,
    super.message,
    super.data,
  });

  DoctorListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DoctorModel>[];
      json['data'].forEach((v) {
        data!.add(DoctorModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? MetaModel.fromJson(json['meta']) : null;
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
