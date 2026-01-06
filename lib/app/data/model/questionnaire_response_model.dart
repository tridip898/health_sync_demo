import 'package:network/network.dart';

class QuestionnaireResponseModel extends BaseResponseModel<QuestionnaireModel> {
  bool? status;
  int? statusCode;

  QuestionnaireResponseModel({
    this.status,
    this.statusCode,
    super.message,
    super.data,
  });

  QuestionnaireResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    data = json['data'] != null
        ? QuestionnaireModel.fromJson(json['data'])
        : null;
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

class QuestionnaireModel {
  String? summary;
  List<Category>? category;

  QuestionnaireModel({this.summary, this.category});

  QuestionnaireModel.fromJson(Map<String, dynamic> json) {
    summary = json['summary'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category?.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['summary'] = summary;
    if (this.category != null) {
      data['category'] = this.category?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String? specialty;
  String? reason;

  Category({this.specialty, this.reason});

  Category.fromJson(Map<String, dynamic> json) {
    specialty = json['specialty'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['specialty'] = this.specialty;
    data['reason'] = this.reason;
    return data;
  }
}
