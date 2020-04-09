class Course {
  String name;
  String code;
  int total;
  int present;
  int absent;
  Course(this.name, this.code, this.total, this.present, this.absent);

  Course.fromJson(Map json) {
    this.code = json['code'];
    this.name = json['name'];
    this.total = json['total'];
    this.present = json['present'];
    this.absent = json['absent'];
  }
}
