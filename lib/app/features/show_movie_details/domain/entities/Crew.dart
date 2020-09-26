class Crew {
  String job;
  String name;

  Crew({
    this.job,
    this.name,
  });

  Crew.fromJson(Map<dynamic, dynamic> json) {
    job = json['job'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job'] = this.job;
    data['name'] = this.name;
    return data;
  }
}
