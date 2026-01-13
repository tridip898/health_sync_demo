import 'package:health_sync_question/app/data/model/profile_model.dart';
import 'package:network/network.dart';

class BindingUserListResponseModel
    extends BaseResponseModel<List<ProfileModel>> {
  bool? status;
  int? statusCode;

  BindingUserListResponseModel({
    this.status,
    super.message,
    this.statusCode,
    super.data,
  });

  BindingUserListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <ProfileModel>[];
      json['data'].forEach((v) {
        data?.add(new ProfileModel.fromJson(v));
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

