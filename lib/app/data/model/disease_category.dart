import 'package:network/network.dart';

class DiseaseCategoryResponse
    extends BaseResponseModel<List<DiseaseCategoryModel>> {
  bool? status;
  int? statusCode;

  DiseaseCategoryResponse({
    this.status,
    this.statusCode,
    super.message,
    super.data,
  });

  DiseaseCategoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <DiseaseCategoryModel>[];
      json['data'].forEach((v) {
        data!.add(DiseaseCategoryModel.fromJson(v));
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

class DiseaseCategoryModel {
  String? diseaseCategoryId;
  String? name;
  String? createdBy;
  bool? isApproved;
  String? createdAt;
  String? updatedAt;

  DiseaseCategoryModel({
    this.diseaseCategoryId,
    this.name,
    this.createdBy,
    this.isApproved,
    this.createdAt,
    this.updatedAt,
  });

  // From JSON
  factory DiseaseCategoryModel.fromJson(Map<String, dynamic> json) {
    return DiseaseCategoryModel(
      diseaseCategoryId: json['diseaseCategoryId'] as String?,
      name: json['name'] as String?,
      createdBy: json['createdBy'] as String?,
      isApproved: json['isApproved'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'diseaseCategoryId': diseaseCategoryId,
      'name': name,
      'createdBy': createdBy,
      'isApproved': isApproved,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
