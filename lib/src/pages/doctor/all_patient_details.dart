import 'package:flutter/material.dart';
import 'package:smart_health_care/src/model/patient_appointment.dart';
import 'package:smart_health_care/src/pages/doctor/patient_details_page.dart';


class ALlPatientDetails extends StatefulWidget {

  List<PatientAppointment> appointmentDataList;
  int index;
  ALlPatientDetails(this.appointmentDataList, this.index);

  @override
  _ALlPatientDetailsState createState() => _ALlPatientDetailsState();
}

class _ALlPatientDetailsState extends State<ALlPatientDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: widget.appointmentDataList.length,
        controller: PageController(initialPage: widget.index, keepPage: true, viewportFraction: 1),
        itemBuilder: (BuildContext context, int itemIndex) {
          return PatientDetailsPage(widget.appointmentDataList[itemIndex]);
        },
      ),
    );
  }
}
