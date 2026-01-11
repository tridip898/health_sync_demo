import 'package:network/network.dart';

class CreateMedicalHistoryResponse
    extends BaseResponseModel<MedicalHistoryData> {
  bool? status;
  int? statusCode;

  CreateMedicalHistoryResponse({
    this.status,
    super.message,
    this.statusCode,
    super.data,
  });

  CreateMedicalHistoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    data = json['data'] != null
        ? MedicalHistoryData.fromJson(json['data'])
        : null;
  }
}

class MedicalHistoryData {
  String? patientMedicalHistoryId;
  String? title;
  String? description;
  String? date;
  List<HistoryCategory>? categories;

  MedicalHistoryData.fromJson(Map<String, dynamic> json) {
    patientMedicalHistoryId = json['patientMedicalHistoryId'];
    title = json['title'];
    description = json['description'];
    date = json['date'];

    if (json['categories'] != null) {
      categories = (json['categories'] as List)
          .map((e) => HistoryCategory.fromJson(e))
          .toList();
    }
  }
}

class HistoryCategory {
  String? diseaseCategoryId;
  Category? category;

  HistoryCategory.fromJson(Map<String, dynamic> json) {
    diseaseCategoryId = json['diseaseCategoryId'];
    category =
    json['category'] != null ? Category.fromJson(json['category']) : null;
  }
}

class Category {
  String? diseaseCategoryId;
  String? name;
  bool? isApproved;

  Category.fromJson(Map<String, dynamic> json) {
    diseaseCategoryId = json['diseaseCategoryId'];
    name = json['name'];
    isApproved = json['isApproved'];
  }
}
