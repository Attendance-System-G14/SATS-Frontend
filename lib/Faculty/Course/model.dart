class Course {
  String name;
  String code;
  int id;
  Course(this.name, this.code, this.id);

  Course.fromJson(Map json) {
    this.id = json['id'];
    this.code = json['code'];
    this.name = json['name'];
  }
}
