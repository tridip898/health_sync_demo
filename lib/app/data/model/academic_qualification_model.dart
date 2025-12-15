class AcademicQualificationModel {
  String? academicQualificationId;
  String? major;
  String? degree;
  String? passingYear;
  String? institutionName;
  String? createdAt;
  String? updatedAt;

  AcademicQualificationModel({
    this.academicQualificationId,
    this.major,
    this.degree,
    this.passingYear,
    this.institutionName,
    this.createdAt,
    this.updatedAt,
  });

  AcademicQualificationModel.fromJson(Map<String, dynamic> json) {
    academicQualificationId = json['academicQualificationId'];
    major = json['major'];
    degree = json['degree'];
    passingYear = json['passingYear'];
    institutionName = json['institutionName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['academicQualificationId'] = academicQualificationId;
    data['major'] = major;
    data['degree'] = degree;
    data['passingYear'] = passingYear;
    data['institutionName'] = institutionName;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
