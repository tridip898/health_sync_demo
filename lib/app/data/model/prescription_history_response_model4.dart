import 'package:health_sync_question/app/data/model/prescription_list_response_model.dart';
import 'package:network/network.dart';

class PrescriptionHistoryResponseModel
    extends BaseResponseModel<List<Prescription>> {
  bool? status;
  int? statusCode;

  PrescriptionHistoryResponseModel({
    this.status,
    super.message,
    this.statusCode,
    super.data,
  });

  PrescriptionHistoryResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <Prescription>[];
      json['data'].forEach((v) {
        data?.add(new Prescription.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
