import 'package:flutter/material.dart';
import 'package:sats/Student/Course/view/course_list_view.dart';
import 'package:sats/Student/drawer.dart';

class StudentHomePage extends StatefulWidget {

  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SATS'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: CourseListView()
      ),
    );
  }
}
