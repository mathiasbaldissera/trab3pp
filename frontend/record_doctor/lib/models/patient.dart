import 'package:record_doctor/models/sex.dart';

class Patient {
  String name;
  int age;
  Sex sex;

  Patient({this.name, this.age, this.sex});

  Patient.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    sex = _convertStringToEnum(json['sex']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['sex'] = this.sex;
    return data;
  }

  Sex _convertStringToEnum(String sex) {
    if (sex == "MALE") {
      return Sex.MALE;
    } else {
      return Sex.FEMALE;
    }
  }
}
