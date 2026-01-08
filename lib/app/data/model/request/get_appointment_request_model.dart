enum AppointmentStatus {
  pending,
  paymentPending,
  paymentDone,
  confirmed,
  canceled,
  completed,
  rescheduled,
  prescribed,
}

extension AppointmentStatusX on AppointmentStatus {
  String get value {
    switch (this) {
      case AppointmentStatus.pending:
        return 'PENDING';
      case AppointmentStatus.paymentPending:
        return 'PAYMENT_PENDING';
      case AppointmentStatus.paymentDone:
        return 'PAYMENT_DONE';
      case AppointmentStatus.confirmed:
        return 'CONFIRMED';
      case AppointmentStatus.canceled:
        return 'CANCELED';
      case AppointmentStatus.completed:
        return 'COMPLETED';
      case AppointmentStatus.rescheduled:
        return 'RESCHEDULED';
      case AppointmentStatus.prescribed:
        return 'PRESCRIBED';
    }
  }

  static AppointmentStatus fromValue(String value) {
    return AppointmentStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => AppointmentStatus.pending,
    );
  }
}

class GetAppointmentsRequest {
  final int? page;
  final int? limit;

  final String? doctorId;
  final String? patientId;
  final String? organizationId;
  final AppointmentStatus? status;

  // 'asc' | 'desc'
  final String? dateSort;
  final DateTime? startDate;
  final DateTime? endDate;

  const GetAppointmentsRequest({
    this.page,
    this.limit,
    this.doctorId,
    this.patientId,
    this.organizationId,
    this.status,
    this.dateSort,
    this.startDate,
    this.endDate,
  });

  Map<String, dynamic> toQuery() {
    return {
      if (page != null) 'page': page,
      if (limit != null) 'limit': limit,
      if (doctorId != null) 'doctorId': doctorId,
      if (patientId != null) 'patientId': patientId,
      if (organizationId != null) 'organizationId': organizationId,
      if (status != null) 'status': status!.value,
      if (dateSort != null) 'dateSort': dateSort,
      if (startDate != null) 'startDate': _formatDate(startDate!),
      if (endDate != null) 'endDate': _formatDate(endDate!),
    };
  }

  String _formatDate(DateTime date) {
    final dd = date.day.toString().padLeft(2, '0');
    final mm = date.month.toString().padLeft(2, '0');
    final yyyy = date.year;
    return '$dd-$mm-$yyyy';
  }
}
