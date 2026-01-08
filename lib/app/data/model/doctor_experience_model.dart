class DoctorExperienceModel {
  String? experienceId;
  String? institutionName;
  String? department;
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;

  DoctorExperienceModel({
    this.experienceId,
    this.institutionName,
    this.department,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
  });

  DoctorExperienceModel.fromJson(Map<String, dynamic> json) {
    experienceId = json['experienceId'];
    institutionName = json['institutionName'];
    department = json['department'];
    title = json['title'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['experienceId'] = experienceId;
    data['institutionName'] = institutionName;
    data['department'] = department;
    data['title'] = title;
    data['description'] = description;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
