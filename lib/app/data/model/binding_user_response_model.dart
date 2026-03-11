import 'package:health_sync_question/app/data/model/user_model.dart';
import 'package:network/network.dart';

class BindingUserResponseModel extends BaseResponseModel<UserBindRequestModel> {
  bool? status;
  int? statusCode;

  BindingUserResponseModel({
    this.status,
    super.message,
    this.statusCode,
    super.data,
  });

  BindingUserResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    data = json['data'] != null
        ? UserBindRequestModel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}
