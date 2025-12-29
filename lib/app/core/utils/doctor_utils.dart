import 'package:health_sync_question/app/core/extensions/string_extension.dart';
import 'package:health_sync_question/app/data/model/academic_qualification_model.dart';
import 'package:health_sync_question/app/data/model/doctor_specialty_model.dart';

class DoctorUtils {
  static String getSpecialty(List<DoctorSpecialtyModel>? specialtyList) {
    if (specialtyList == null || specialtyList.isEmpty) {
      return '';
    }
    String specialty = '';
    for (int i = 0; i < specialtyList.length; i++) {
      final title = specialtyList[i].title;
      if (title.notNullNotEmpty) {
        specialty += title!;
      }
      if (i != specialtyList.length - 1) {
        specialty += ', ';
      }
    }
    return specialty;
  }

  static String getAcademicQualification(
    List<AcademicQualificationModel>? academicQualificationList,
  ) {
    if (academicQualificationList == null ||
        academicQualificationList.isEmpty) {
      return '';
    }

    String academicQualification = '';
    for (int i = 0; i < academicQualificationList.length; i++) {
      final currentQualification = academicQualificationList[i];
      academicQualification += currentQualification.degree ?? '';
      if (currentQualification.major != null) {
        academicQualification += ' (${currentQualification.major})';
      }

      if (i!=academicQualificationList.length-1) {
        academicQualification += ', ';
      }
    }

    return academicQualification;
  }
}
