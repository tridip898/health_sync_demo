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
  List<String>? category;

  QuestionnaireModel({this.summary, this.category});

  QuestionnaireModel.fromJson(Map<String, dynamic> json) {
    summary = json['summary'];
    category = json['category'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['summary'] = summary;
    data['category'] = category;
    return data;
  }
}
