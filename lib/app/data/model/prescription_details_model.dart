import 'package:health_sync_question/app/data/model/prescription_list_response_model.dart';
import 'package:network/network.dart';

class PrescriptionDetailsResponseModel
    extends BaseResponseModel<PrescriptionData> {
  bool? status;
  int? statusCode;

  PrescriptionDetailsResponseModel({
    this.status,
    super.message,
    this.statusCode,
    super.data,
  });

  PrescriptionDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    data = json['data'] != null
        ? new PrescriptionData.fromJson(json['data'])
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
