import 'package:health_sync_question/app/data/model/doctor_model.dart';
import 'package:network/network.dart';

class DoctorDetailsResponseModel extends BaseResponseModel<DoctorModel> {
  bool? status;
  int? statusCode;

  DoctorDetailsResponseModel({
    this.status,
    this.statusCode,
    super.message,
    super.data,
  });

  DoctorDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    data = json['data'] != null ? DoctorModel.fromJson(json['data']) : null;
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
