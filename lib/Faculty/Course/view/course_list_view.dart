import 'package:flutter/material.dart';
import 'package:sats/Faculty/Course/model.dart';
import 'package:sats/Faculty/Course/services.dart';

class CourseListView extends StatefulWidget {
  @override
  _CourseListViewState createState() => _CourseListViewState();
}

class _CourseListViewState extends State<CourseListView> {
  _buildListView() {
    return FutureBuilder(
      future: loadcourses(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Course> courses = snapshot.data;
          return ListView.builder(
              itemCount: courses.length, itemBuilder: (context, index) {
                return Text(courses[index].name);
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildListView();
  }
}
