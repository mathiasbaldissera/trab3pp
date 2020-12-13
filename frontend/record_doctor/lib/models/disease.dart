class Disease {
  String name;
  List<String> symptoms;
  List<Medicines> medicines;

  Disease({this.name, this.symptoms, this.medicines});

  Disease.fromJson(Map<String, dynamic> json) {
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

class Medicines {
  int id;

  Medicines({this.id});

  Medicines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
