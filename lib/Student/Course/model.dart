class Course {
  String name;
  String code;
  String falulty;
  int total;
  int present;
  Course(this.name, this.code, this.falulty, this.total, this.present);

  Course.fromJson(Map json) {
    this.code = json['course']['code'];
    this.name = json['course']['name'];
    this.falulty = json['faculty'];
    this.total = json['classess_total'];
    this.present = json['classess_present'];
  }
}
