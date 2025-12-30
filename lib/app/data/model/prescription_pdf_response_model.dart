import 'package:network/network.dart';

class GeneratePDFResponseModel extends BaseResponseModel {
  bool? status;
  int? statusCode;

  GeneratePDFResponseModel({
    this.status,
    super.message,
    this.statusCode,
    super.data,
  });

  GeneratePDFResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    data['data'] = this.data;
    return data;
  }
}
