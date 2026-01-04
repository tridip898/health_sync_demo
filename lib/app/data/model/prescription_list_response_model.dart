import 'package:health_sync_question/app/data/model/meta_model.dart';
import 'package:network/network.dart';

class PrescriptionListResponseModel
    extends BaseResponseModel<List<PrescriptionData>> {
  bool? status;
  int? statusCode;
  MetaModel? meta;

  PrescriptionListResponseModel({
    this.status,
    this.statusCode,
    super.message,
    super.data,
    this.meta,
  });

  PrescriptionListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PrescriptionData>[];
      json['data'].forEach((v) {
        data?.add(new PrescriptionData.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new MetaModel.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta?.toJson();
    }
    return data;
  }
}

class PrescriptionData {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? prescriptionId;
  String? appointmentId;
  String? doctorId;
  String? patientId;
  String? organizationId;
  Prescription? prescription;

  PrescriptionData({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.prescriptionId,
    this.appointmentId,
    this.doctorId,
    this.patientId,
    this.organizationId,
    this.prescription,
  });

  PrescriptionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    prescriptionId = json['prescriptionId'];
    appointmentId = json['appointmentId'];
    doctorId = json['doctorId'];
    patientId = json['patientId'];
    organizationId = json['organizationId'];
    prescription = json['prescription'] != null
        ? new Prescription.fromJson(json['prescription'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['prescriptionId'] = this.prescriptionId;
    data['appointmentId'] = this.appointmentId;
    data['doctorId'] = this.doctorId;
    data['patientId'] = this.patientId;
    data['organizationId'] = this.organizationId;
    if (this.prescription != null) {
      data['prescription'] = this.prescription?.toJson();
    }
    return data;
  }
}

class Prescription {
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

  Prescription({
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

  Prescription.fromJson(Map<String, dynamic> json) {
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
