
class ProductionCompany {
  String name;

  ProductionCompany({this.name});

  ProductionCompany.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

