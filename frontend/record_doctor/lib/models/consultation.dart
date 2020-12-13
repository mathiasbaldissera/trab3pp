class Consultation {
  Patient patient;
  List<String> symptoms;
  List<AcceptedDiseases> acceptedDiseases;

  Consultation({this.patient, this.symptoms, this.acceptedDiseases});

  Consultation.fromJson(Map<String, dynamic> json) {
    patient =
        json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
    symptoms = json['symptoms'].cast<String>();
    if (json['acceptedDiseases'] != null) {
      acceptedDiseases = new List<AcceptedDiseases>();
      json['acceptedDiseases'].forEach((v) {
        acceptedDiseases.add(new AcceptedDiseases.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.patient != null) {
      data['patient'] = this.patient.toJson();
    }
    data['symptoms'] = this.symptoms;
    if (this.acceptedDiseases != null) {
      data['acceptedDiseases'] =
          this.acceptedDiseases.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Patient {
  int id;

  Patient({this.id});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class AcceptedDiseases {
  int id;

  AcceptedDiseases({this.id});

  AcceptedDiseases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
