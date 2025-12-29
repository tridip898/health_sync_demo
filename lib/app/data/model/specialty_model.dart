class SpecialtyModel {
  String? specialtyId;
  String? title;
  String? description;
  bool? isApproved;
  String? createdBy;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  SpecialtyModel({
    this.specialtyId,
    this.title,
    this.description,
    this.isApproved,
    this.createdBy,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  SpecialtyModel.fromJson(Map<String, dynamic> json) {
    specialtyId = json['specialtyId'];
    title = json['title'];
    description = json['description'];
    isApproved = json['isApproved'];
    createdBy = json['createdBy'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['specialtyId'] = specialtyId;
    data['title'] = title;
    data['description'] = description;
    data['isApproved'] = isApproved;
    data['createdBy'] = createdBy;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}