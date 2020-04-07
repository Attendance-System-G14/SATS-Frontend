import 'package:sats/Faculty/Course/model.dart';

Future<List<Course>> loadcourses()async{
  List<Course> courses = [];
  for (int i = 0 ; i < 20 ; i++){
    courses.add(Course("course" + i.toString(), "cs20" + i.toString(), i));
  }
  return courses;
}