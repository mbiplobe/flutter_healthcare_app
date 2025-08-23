class Appointment {
  final String patientUid;
  final String doctorId;
  final String date;
  final String timeId;
  final String reason;
  final String payment;

  Appointment({
    required this.patientUid,
    required this.doctorId,
    required this.date,
    required this.timeId,
    required this.reason,
    required this.payment,
  });
}