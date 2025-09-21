import 'package:flutter/cupertino.dart';
import 'package:flutter_healthcare_app/src/domains/usecase/doctor_usecases.dart';
import 'package:flutter_healthcare_app/src/model/available.dart';
import 'package:flutter_healthcare_app/src/model/doctor.dart';
import 'package:flutter_healthcare_app/src/theme/url.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DoctorViewModel extends ChangeNotifier {
  DoctorUsecases doctorUsecases;
  DoctorViewModel({required this.doctorUsecases});
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<List<Doctor>> getAllDoctor(
    String docName,
    String latitude,
    String longitude,
    String gernder,
    String rating,
    String exp,
  ) async {
    _isLoading = true;
    notifyListeners();
    final response = await doctorUsecases.getDoctorList();
    _isLoading = false;
    notifyListeners();
    return response;
  }

  Future<List<Available>> getAvailibility(String docID) async {
    final response = await http.get(
      Uri.parse('${url.BASE_URL}getAvailibility?DocId=$docID'),
    );

    if (response.statusCode == 200) {
      List<Available> availableTimes;

      Iterable list = json.decode(response.body);
      availableTimes = list.map((model) => Available.fromJson(model)).toList();

      return availableTimes;
    } else {
      throw Exception('Exception: ${response.statusCode}');
    }
  }
}
