import 'package:network/network.dart';

class BindingUserResponseModel extends BaseResponseModel<BindingModel> {
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
        ? new BindingModel.fromJson(json['data'])
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

class BindingModel {
  String? userBindRequestId;
  String? userBindRequestStatus;
  String? profileId;
  String? userId;

  BindingModel({
    this.userBindRequestId,
    this.userBindRequestStatus,
    this.profileId,
    this.userId,
  });

  BindingModel.fromJson(Map<String, dynamic> json) {
    userBindRequestId = json['userBindRequestId'];
    userBindRequestStatus = json['userBindRequestStatus'];
    profileId = json['profileId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userBindRequestId'] = this.userBindRequestId;
    data['userBindRequestStatus'] = this.userBindRequestStatus;
    data['profileId'] = this.profileId;
    data['userId'] = this.userId;
    return data;
  }
}
