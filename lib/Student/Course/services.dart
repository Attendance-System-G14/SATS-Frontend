import 'package:sats/Student/Course/model.dart';

Future<List<Course>>loadcourses() async{
  List<Course> courses = [];
  for(int i = 1; i < 21 ; i++){
    Course tempCourse = new Course("Computer Network"+i.toString(),"CS"+i.toString(),i,i-1,1);
    courses.add(tempCourse);
  }
  return courses;
}