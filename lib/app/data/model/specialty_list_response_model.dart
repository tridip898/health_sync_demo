import 'package:health_sync_question/app/data/model/specialty_model.dart';
import 'package:network/network.dart';

class SpecialtyListResponseModel
    extends BaseResponseModel<List<SpecialtyModel>> {
  bool? status;
  int? statusCode;

  SpecialtyListResponseModel({
    this.status,
    this.statusCode,
    super.message,
    super.data,
  });

  SpecialtyListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <SpecialtyModel>[];
      json['data'].forEach((v) {
        data!.add(SpecialtyModel.fromJson(v));
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
