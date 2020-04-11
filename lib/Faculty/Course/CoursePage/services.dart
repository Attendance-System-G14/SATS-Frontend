import 'package:sats/Faculty/Course/CoursePage/models.dart';

Future<List<Attendance>> loadAttendanceList() async {
  List<Attendance> attendances = [];
  for (int i = 0; i < 20; i++) {
    attendances.add(Attendance(DateTime.now().subtract(Duration(days: i)), 15,
        20, i % 2 == 0 ? 'Lecture' : 'Tutorial'));
  }
  return attendances;
}

Future<List<Student>> loadStudentList() async {
  List<Student> students = [];
  for (int i = 0; i < 20; i++) {
    students.add(
        Student('Student ' + i.toString(), '2017csb107' + i.toString(), i));
  }
  return students;
}
