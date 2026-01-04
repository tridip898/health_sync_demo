class CreateAppointmentRequest {
  final String patientId;
  final String doctorId;
  final String? organizationId;
  final DateTime appointmentDate;
  final List<Map<String, String>>? questionnaire;
  final String? note;

  CreateAppointmentRequest({
    required this.patientId,
    required this.doctorId,
    this.organizationId,
    required this.appointmentDate,
    this.questionnaire,
    this.note,
  });

  Map<String, dynamic> toJson() {
    return {
      'patientId': patientId,
      'doctorId': doctorId,
      if (organizationId != null) 'organizationId': organizationId,
      'appointmentDate': _formatDate(appointmentDate),
      if (questionnaire != null) 'questionnaire': questionnaire,
      if (note != null) 'note': note,
    };
  }

  factory CreateAppointmentRequest.fromJson(Map<String, dynamic> json) {
    return CreateAppointmentRequest(
      patientId: json['patientId'],
      doctorId: json['doctorId'],
      organizationId: json['organizationId'],
      appointmentDate: DateTime.parse(json['appointmentDate']),
      questionnaire: json['questionnaire'] != null
          ? List<Map<String, String>>.from(
              (json['questionnaire'] as List).map(
                (e) => Map<String, String>.from(e),
              ),
            )
          : null,
      note: json['note'],
    );
  }

  /// Matches your backend dd-mm-yyyy expectation
  static String _formatDate(DateTime date) {
    final dd = date.day.toString().padLeft(2, '0');
    final mm = date.month.toString().padLeft(2, '0');
    final yyyy = date.year.toString();
    return '$dd-$mm-$yyyy';
  }
}
