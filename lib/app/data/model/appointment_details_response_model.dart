import 'package:health_sync_question/app/data/model/doctor_model.dart';
import 'package:health_sync_question/app/data/model/organization_response_model.dart';
import 'package:network/network.dart';
import 'package:health_sync_question/app/data/model/profile_response_model.dart';

class AppointmentDetailsResponseModel
    extends BaseResponseModel<AppointmentDetails> {
  bool? status;
  int? statusCode;

  AppointmentDetailsResponseModel({
    this.status,
    super.message,
    this.statusCode,
    super.data,
  });

  AppointmentDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    data = json['data'] != null
        ? new AppointmentDetails.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class AppointmentDetails {
  String? appointmentId;
  String? status;
  String? appointmentDate;
  String? createdAt;
  String? updatedAt;
  String? patientId;
  String? doctorId;
  String? organizationId;
  Extra? extra;
  Null note;
  Patient? patient;
  DoctorModel? doctor;
  OrganizationModel? organization;
  DoctorPrescription? doctorPrescription;

  AppointmentDetails({
    this.appointmentId,
    this.status,
    this.appointmentDate,
    this.createdAt,
    this.updatedAt,
    this.patientId,
    this.doctorId,
    this.organizationId,
    this.extra,
    this.note,
    this.patient,
    this.doctor,
    this.organization,
    this.doctorPrescription,
  });

  AppointmentDetails.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointmentId'];
    status = json['status'];
    appointmentDate = json['appointmentDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    patientId = json['patientId'];
    doctorId = json['doctorId'];
    organizationId = json['organizationId'];
    extra = json['extra'] != null ? new Extra.fromJson(json['extra']) : null;
    note = json['note'];
    patient = json['patient'] != null
        ? new Patient.fromJson(json['patient'])
        : null;
    doctor = json['doctor'] != null
        ? new DoctorModel.fromJson(json['doctor'])
        : null;
    organization = json['organization'] != null
        ? new OrganizationModel.fromJson(json['organization'])
        : null;
    doctorPrescription = json['doctorPrescription'] != null
        ? new DoctorPrescription.fromJson(json['doctorPrescription'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointmentId'] = this.appointmentId;
    data['status'] = this.status;
    data['appointmentDate'] = this.appointmentDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['patientId'] = this.patientId;
    data['doctorId'] = this.doctorId;
    data['organizationId'] = this.organizationId;
    if (this.extra != null) {
      data['extra'] = this.extra?.toJson();
    }
    data['note'] = this.note;
    if (this.patient != null) {
      data['patient'] = this.patient?.toJson();
    }
    if (this.doctor != null) {
      data['doctor'] = this.doctor?.toJson();
    }
    if (this.organization != null) {
      data['organization'] = this.organization?.toJson();
    }
    if (this.doctorPrescription != null) {
      data['doctorPrescription'] = this.doctorPrescription?.toJson();
    }
    return data;
  }
}

class Extra {
  String? note;

  Extra({this.note});

  Extra.fromJson(Map<String, dynamic> json) {
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['note'] = this.note;
    return data;
  }
}

class DoctorPrescription {
  String? prescriptionId;
  String? prescriptionText;
  String? pdfPath;
  bool? isDeleted;
  String? previousId;
  String? nextId;
  String? createdBy;
  bool? isOngoing;
  String? createdAt;
  String? updatedAt;
  List<PrescriptionItems>? prescriptionItems;
  List<LabTests>? labTests;

  DoctorPrescription({
    this.prescriptionId,
    this.prescriptionText,
    this.pdfPath,
    this.isDeleted,
    this.previousId,
    this.nextId,
    this.createdBy,
    this.isOngoing,
    this.createdAt,
    this.updatedAt,
    this.prescriptionItems,
    this.labTests,
  });

  DoctorPrescription.fromJson(Map<String, dynamic> json) {
    prescriptionId = json['prescriptionId'];
    prescriptionText = json['prescriptionText'];
    pdfPath = json['pdfPath'];
    isDeleted = json['isDeleted'];
    previousId = json['previousId'];
    nextId = json['nextId'];
    createdBy = json['createdBy'];
    isOngoing = json['isOngoing'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['prescriptionItems'] != null) {
      prescriptionItems = <PrescriptionItems>[];
      json['prescriptionItems'].forEach((v) {
        prescriptionItems?.add(new PrescriptionItems.fromJson(v));
      });
    }
    if (json['labTests'] != null) {
      labTests = <LabTests>[];
      json['labTests'].forEach((v) {
        labTests?.add(new LabTests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prescriptionId'] = this.prescriptionId;
    data['prescriptionText'] = this.prescriptionText;
    data['pdfPath'] = this.pdfPath;
    data['isDeleted'] = this.isDeleted;
    data['previousId'] = this.previousId;
    data['nextId'] = this.nextId;
    data['createdBy'] = this.createdBy;
    data['isOngoing'] = this.isOngoing;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.prescriptionItems != null) {
      data['prescriptionItems'] = this.prescriptionItems
          ?.map((v) => v.toJson())
          .toList();
    }
    if (this.labTests != null) {
      data['labTests'] = this.labTests?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrescriptionItems {
  String? prescriptionItemId;
  String? medicineName;
  String? strength;
  String? dosage;
  int? frequency;
  int? durationDays;
  String? instructions;
  String? createdAt;
  bool? isOngoing;
  String? prescriptionId;

  PrescriptionItems({
    this.prescriptionItemId,
    this.medicineName,
    this.strength,
    this.dosage,
    this.frequency,
    this.durationDays,
    this.instructions,
    this.createdAt,
    this.isOngoing,
    this.prescriptionId,
  });

  PrescriptionItems.fromJson(Map<String, dynamic> json) {
    prescriptionItemId = json['prescriptionItemId'];
    medicineName = json['medicineName'];
    strength = json['strength'];
    dosage = json['dosage'];
    frequency = json['frequency'];
    durationDays = json['durationDays'];
    instructions = json['instructions'];
    createdAt = json['createdAt'];
    isOngoing = json['isOngoing'];
    prescriptionId = json['prescriptionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prescriptionItemId'] = this.prescriptionItemId;
    data['medicineName'] = this.medicineName;
    data['strength'] = this.strength;
    data['dosage'] = this.dosage;
    data['frequency'] = this.frequency;
    data['durationDays'] = this.durationDays;
    data['instructions'] = this.instructions;
    data['createdAt'] = this.createdAt;
    data['isOngoing'] = this.isOngoing;
    data['prescriptionId'] = this.prescriptionId;
    return data;
  }
}

class LabTests {
  String? prescripitonLabTestId;
  String? testName;
  String? notes;
  String? createdAt;
  bool? isOngoing;
  String? prescriptionId;

  LabTests({
    this.prescripitonLabTestId,
    this.testName,
    this.notes,
    this.createdAt,
    this.isOngoing,
    this.prescriptionId,
  });

  LabTests.fromJson(Map<String, dynamic> json) {
    prescripitonLabTestId = json['prescripitonLabTestId'];
    testName = json['testName'];
    notes = json['notes'];
    createdAt = json['createdAt'];
    isOngoing = json['isOngoing'];
    prescriptionId = json['prescriptionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prescripitonLabTestId'] = this.prescripitonLabTestId;
    data['testName'] = this.testName;
    data['notes'] = this.notes;
    data['createdAt'] = this.createdAt;
    data['isOngoing'] = this.isOngoing;
    data['prescriptionId'] = this.prescriptionId;
    return data;
  }
}
