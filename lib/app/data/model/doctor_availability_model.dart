import 'package:health_sync_question/app/data/model/organization_response_model.dart';

class DoctorOrganizationModel {
  OrganizationModel? organization;
  List<DoctorAvailabilityModel>? doctorAvailability;

  DoctorOrganizationModel({this.organization, this.doctorAvailability});

  DoctorOrganizationModel.fromJson(Map<String, dynamic> json) {
    organization = json['organization'] != null
        ? OrganizationModel.fromJson(json['organization'])
        : null;
    if (json['doctorAvailability'] != null) {
      doctorAvailability = <DoctorAvailabilityModel>[];
      json['doctorAvailability'].forEach((v) {
        doctorAvailability!.add(DoctorAvailabilityModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (organization != null) {
      data['organization'] = organization!.toJson();
    }
    if (doctorAvailability != null) {
      data['doctorAvailability'] = doctorAvailability!
          .map((v) => v.toJson())
          .toList();
    }
    return data;
  }

  Map<DateTime, bool> getNext7DaysAvailability() {
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);

    if (doctorAvailability == null) return {};
    // creating a set of available days e.g => 0, 1, 2, ... 6
    final availableUiDays = doctorAvailability!
        .map((e) => e.dayOfType)
        .where((e) => e != -1)
        .toSet();

    final Map<DateTime, bool> result = {};

    for (int i = 0; i < 7; i++) {
      final date = normalizedToday.add(Duration(days: i));
      final uiWeekdayIndex = date.weekday % 7;
      result[date] = availableUiDays.contains(uiWeekdayIndex);
    }

    return result;
  }
}

class DoctorAvailabilityModel {
  String? id;
  String? type;
  int? dayOfType;
  num? targetPatients;
  String? startTime;
  String? endTime;
  String? activationDate;
  String? deActivationDate;
  String? doctorOrganizationId;
  String? createdAt;
  String? updatedAt;

  DoctorAvailabilityModel({
    this.id,
    this.type,
    this.dayOfType,
    this.targetPatients,
    this.startTime,
    this.endTime,
    this.activationDate,
    this.deActivationDate,
    this.doctorOrganizationId,
    this.createdAt,
    this.updatedAt,
  });

  DoctorAvailabilityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    dayOfType = json['dayOfType'];
    targetPatients = json['targetPatients'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    activationDate = json['activationDate'];
    deActivationDate = json['deActivationDate'];
    doctorOrganizationId = json['doctorOrganizationId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['dayOfType'] = dayOfType;
    data['targetPatients'] = targetPatients;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['activationDate'] = activationDate;
    data['deActivationDate'] = deActivationDate;
    data['doctorOrganizationId'] = doctorOrganizationId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
