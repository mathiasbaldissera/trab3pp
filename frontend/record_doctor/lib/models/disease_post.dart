import 'package:record_doctor/models/disease.dart';

class DiseasePost {
  String name;
  List<String> symptoms;
  List<Medicines> medicines;

  DiseasePost({this.name, this.symptoms, this.medicines});

  DiseasePost.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symptoms = json['symptoms'].cast<String>();
    if (json['medicines'] != null) {
      medicines = new List<Medicines>();
      json['medicines'].forEach((v) {
        medicines.add(new Medicines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['symptoms'] = this.symptoms;
    if (this.medicines != null) {
      data['medicines'] = this.medicines.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
