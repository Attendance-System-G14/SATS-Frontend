import 'package:sats/Faculty/Course/CoursePage/models.dart';

Future<List<Attendance>> loadAttendanceList() async {
  List<Attendance> attendances = [];
  for (int i = 0; i < 20; i++) {
    attendances.add(Attendance(DateTime.now().subtract(Duration(days: i)), 15,
        20, i % 2 == 0 ? 'Lecture' : 'Tutorial'));
  }
  return attendances;
}
