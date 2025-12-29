import 'package:health_sync_question/app/data/model/meta_model.dart';
import 'package:network/network.dart';

class OrganizationResponseModel
    extends BaseResponseModel<List<OrganizationModel>> {
  bool? status;
  int? statusCode;
  MetaModel? meta;

  OrganizationResponseModel({
    this.status,
    this.statusCode,
    super.message,
    super.data,
    this.meta,
  });

  OrganizationResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OrganizationModel>[];
      json['data'].forEach((v) {
        data!.add(OrganizationModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? MetaModel.fromJson(json['meta']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class OrganizationModel {
  String? organizationId;
  String? name;
  String? address;
  List<String>? phoneNumber;
  List<String>? email;
  String? website;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  Map<String, dynamic>? extra;
  String? organizationOwnerId;

  OrganizationModel({
    this.organizationId,
    this.name,
    this.address,
    this.phoneNumber,
    this.email,
    this.website,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.extra,
    this.organizationOwnerId,
  });

  OrganizationModel.fromJson(Map<String, dynamic> json) {
    organizationId = json['organizationId'];
    name = json['name'];
    address = json['address'];
    phoneNumber = json['phoneNumber'].cast<String>();
    email = json['email'].cast<String>();
    website = json['website'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    extra = json['extra'];
    organizationOwnerId = json['organizationOwnerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['organizationId'] = organizationId;
    data['name'] = name;
    data['address'] = address;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['website'] = website;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['extra'] = extra;
    data['organizationOwnerId'] = organizationOwnerId;
    return data;
  }
}
