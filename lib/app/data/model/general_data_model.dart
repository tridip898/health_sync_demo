import 'package:network/network.dart';

class GeneralResponseModel extends BaseResponseModel {
  bool? status;
  int? statusCode;

  GeneralResponseModel({
    this.status,
    this.statusCode,
    super.message,
    super.data,
  });

  GeneralResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    data = json['data'];
  }
}
