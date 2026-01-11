import 'package:network/network.dart';

import 'medical_history_response_model.dart';

class MedicalHistoryDetailsResponseModel
    extends BaseResponseModel<MedicalHistoryModel> {
  bool? status;
  int? statusCode;

  MedicalHistoryDetailsResponseModel({
    this.status,
    this.statusCode,
    super.message,
    super.data,
  });

  MedicalHistoryDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];

    if (json['data'] != null) {
      data = MedicalHistoryModel.fromJson(json['data']);
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'status_code': statusCode,
      'message': message,
      'data': data?.toJson(),
    };
  }
}
class MedicalHistoryListResponseModel
    extends BaseResponseModel<List<MedicalHistoryModel>> {
  bool? status;
  int? statusCode;

  MedicalHistoryListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];

    if (json['data'] != null) {
      data = (json['data'] as List)
          .map((e) => MedicalHistoryModel.fromJson(e))
          .toList();
    }
  }
}
