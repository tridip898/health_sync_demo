import 'package:network/network.dart';

class MedicalHistoryListResponseModel
    extends BaseResponseModel<List<MedicalHistoryModel>> {
  bool? status;
  int? statusCode;

  MedicalHistoryListResponseModel({
    this.status,
    this.statusCode,
    super.message,
    super.data,
  });

  MedicalHistoryListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];

    if (json['data'] != null) {
      data = <MedicalHistoryModel>[];
      json['data'].forEach((v) {
        data!.add(MedicalHistoryModel.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['status_code'] = statusCode;
    json['message'] = message;

    if (data != null) {
      json['data'] = data!.map((v) => v.toJson()).toList();
    }
    return json;
  }
}

class MedicalHistoryModel {
  String? patientMedicalHistoryId;
  String? title;
  String? description;
  String? date;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  String? patientId;
  List<MedicalHistoryCategoryModel>? categories;

  MedicalHistoryModel({
    this.patientMedicalHistoryId,
    this.title,
    this.description,
    this.date,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.patientId,
    this.categories,
  });

  MedicalHistoryModel.fromJson(Map<String, dynamic> json) {
    patientMedicalHistoryId = json['patientMedicalHistoryId'];
    title = json['title'];
    description = json['description'];
    date = json['date'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    patientId = json['patientId'];

    if (json['categories'] != null) {
      categories = <MedicalHistoryCategoryModel>[];
      json['categories'].forEach((v) {
        categories!.add(MedicalHistoryCategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['patientMedicalHistoryId'] = patientMedicalHistoryId;
    json['title'] = title;
    json['description'] = description;
    json['date'] = date;
    json['createdBy'] = createdBy;
    json['createdAt'] = createdAt;
    json['updatedAt'] = updatedAt;
    json['patientId'] = patientId;

    if (categories != null) {
      json['categories'] =
          categories!.map((v) => v.toJson()).toList();
    }
    return json;
  }
}

class MedicalHistoryCategoryModel {
  String? historyId;
  String? diseaseCategoryId;
  DiseaseCategoryModel? category;

  MedicalHistoryCategoryModel({
    this.historyId,
    this.diseaseCategoryId,
    this.category,
  });

  MedicalHistoryCategoryModel.fromJson(Map<String, dynamic> json) {
    historyId = json['historyId'];
    diseaseCategoryId = json['diseaseCategoryId'];
    category = json['category'] != null
        ? DiseaseCategoryModel.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['historyId'] = historyId;
    json['diseaseCategoryId'] = diseaseCategoryId;
    if (category != null) {
      json['category'] = category!.toJson();
    }
    return json;
  }
}
class DiseaseCategoryModel {
  String? diseaseCategoryId;
  String? name;
  bool? isApproved;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  DiseaseCategoryModel({
    this.diseaseCategoryId,
    this.name,
    this.isApproved,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  DiseaseCategoryModel.fromJson(Map<String, dynamic> json) {
    diseaseCategoryId = json['diseaseCategoryId'];
    name = json['name'];
    isApproved = json['isApproved'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['diseaseCategoryId'] = diseaseCategoryId;
    json['name'] = name;
    json['isApproved'] = isApproved;
    json['createdBy'] = createdBy;
    json['createdAt'] = createdAt;
    json['updatedAt'] = updatedAt;
    return json;
  }
}



