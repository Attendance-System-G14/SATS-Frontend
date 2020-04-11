class Attendance{
  DateTime dateTime;
  int presentStudents;
  int totalStudents;
  String lectureType;

  Attendance(this.dateTime, this.presentStudents, this.totalStudents, this.lectureType);

  Attendance.fromJson(Map json){
    this.dateTime = DateTime.parse(json['date_time']);
    this.presentStudents = json['present_students'];
    this.totalStudents = json['total_students'];
    this.lectureType = json['lecture_type'];
  }
}

class Student{
  String name;
  String entryNumber;
  int classessAttended;

  Student(this.name, this.entryNumber, this.classessAttended);

  Student.fromJson(Map json){
    this.name = json['name'];
    this.entryNumber = json['entry_number'];
    this.classessAttended = json['classess_attended'];
  }
}