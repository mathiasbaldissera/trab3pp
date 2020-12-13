import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:record_doctor/models/disease_post.dart';
import 'package:record_doctor/models/medicine.dart';
import 'package:record_doctor/models/patient.dart';
import 'package:record_doctor/models/possible_disease.dart';

class RecordDoctorApi {
  static final RecordDoctorApi _recordDoctorApi = RecordDoctorApi._internal();

  RecordDoctorApi._internal();

  factory RecordDoctorApi() {
    return _recordDoctorApi;
  }

  Dio _dio = new Dio(
    new BaseOptions(
        baseUrl: "http://localhost:8080",
        connectTimeout: 5000,
        receiveTimeout: 100000),
  );

  Future<bool> createPatient(Patient patient) async {
    try {
      Response _response = await _recordDoctorApi._dio.post(
        "/patient",
        data: {
          "name": patient.name,
          "age": patient.age,
          "sex": describeEnum(patient.sex).toUpperCase(),
        },
      );
      if (_response.statusCode == 200 || _response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (_) {
      return false;
    }
  }

  Future<bool> createMedication(Medicine medicine) async {
    try {
      Response _response = await _recordDoctorApi._dio.post(
        "/medicine",
        data: {
          "name": medicine.name,
          "functions": medicine.functions,
        },
      );
      if (_response.statusCode == 200 || _response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (_) {
      return false;
    }
  }

  Future<bool> createDisease(DiseasePost disease) async {
    try {
      Response _response = await _recordDoctorApi._dio.post(
        "/disease",
        data: {
          "name": disease.name,
          "symptoms": disease.symptoms,
          "medicines": disease.medicines
        },
      );
      if (_response.statusCode == 200 || _response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (_) {
      return false;
    }
  }

  Future<List<Medicine>> getMedications() async {
    List<Medicine> _medications = [];
    try {
      Response _response = await _recordDoctorApi._dio.get(
        "/medicine",
      );
      var jsonData = (_response.data["content"] as List)
          .map((e) => Medicine.fromJson(e))
          .toList();
      for (var i in jsonData) {
        Medicine medicine = Medicine(
          id: i.id,
          name: i.name,
          functions: i.functions,
        );
        _medications.add(medicine);
      }
      return _medications;
    } on DioError catch (_) {
      return [];
    }
  }

  Future<List<Patient>> getPatients() async {
    List<Patient> _patients = [];
    try {
      Response _response = await _recordDoctorApi._dio.get(
        "/patient/",
      );
      var jsonData = (_response.data["content"] as List)
          .map((e) => Patient.fromJson(e))
          .toList();
      for (var i in jsonData) {
        Patient patient = Patient(name: i.name, age: i.age, sex: i.sex);
        _patients.add(patient);
      }
      return _patients;
    } on DioError catch (_) {
      return [];
    }
  }

  Future<List<PossibleDisease>> getPossibleDisease(
      List<String> symptoms) async {
    List<PossibleDisease> _possibleDiseases = [];
    try {
      String urlParameters;
      var parameters = StringBuffer();
      if (symptoms.length > 1) {
        symptoms.forEach((element) {
          parameters.write(element + ", ");
        });
        urlParameters =
            parameters.toString().substring(0, parameters.length - 2);
      } else {
        urlParameters = symptoms[0];
      }

      Response _response = await _recordDoctorApi._dio.get(
        "/disease/possibleDiseases?symptoms=$urlParameters",
      );
      var jsonData = (_response.data as List)
          .map((e) => PossibleDisease.fromJson(e))
          .toList();
      for (var i in jsonData) {
        PossibleDisease possibleDIsease = PossibleDisease(
            id: i.id,
            name: i.name,
            medicines: i.medicines,
            symptoms: i.symptoms);
        _possibleDiseases.add(possibleDIsease);
      }
      return _possibleDiseases;
    } on DioError catch (_) {
      return [];
    }
  }
}
