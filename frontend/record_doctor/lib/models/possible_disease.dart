import 'package:record_doctor/models/medicine.dart';

class PossibleDisease {
  int id;
  String name;
  List<String> symptoms;
  List<Medicine> medicines;

  PossibleDisease({this.id, this.name, this.symptoms, this.medicines});

  PossibleDisease.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symptoms = json['symptoms'].cast<String>();
    if (json['medicines'] != null) {
      medicines = new List<Medicine>();
      json['medicines'].forEach((v) {
        medicines.add(new Medicine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symptoms'] = this.symptoms;
    if (this.medicines != null) {
      data['medicines'] = this.medicines.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
