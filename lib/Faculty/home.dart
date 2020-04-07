import 'package:flutter/material.dart';
import 'package:sats/Faculty/Course/view/course_list_view.dart';
import 'package:sats/Faculty/drawer.dart';

class FacultyHomePage extends StatefulWidget {

  @override
  _FacultyHomePageState createState() => _FacultyHomePageState();
}

class _FacultyHomePageState extends State<FacultyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SATS'),
      ),
      drawer: CustomDrawer(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(child: CourseListView(),)
          ],
        ),
      ),
    );
  }
}
