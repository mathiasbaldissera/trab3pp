class Medicine {
  int id;
  String name;
  List<String> functions;

  Medicine({this.id, this.name, this.functions});

  Medicine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    functions = json['functions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['functions'] = this.functions;
    return data;
  }
}
