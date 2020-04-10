import 'package:flutter/material.dart';
import 'package:sats/Student/Course/model.dart';
import 'package:sats/Student/Course/services.dart';
import 'package:sats/Student/Course/view/course_tile.dart';

class CourseListView extends StatefulWidget {
  @override
  _CourseListViewState createState() => _CourseListViewState();
}

class _CourseListViewState extends State<CourseListView> {
  Widget _body;

  _buildListView() {
    return FutureBuilder(
      future: loadcourses(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          List<Course> courses = snapshot.data;
          return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: CourseTile(courses[index]),
                );
              });
        } else if (snapshot.hasError) {
          return Center(
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    _body = _buildListView();
                  });
                },
                child: Icon(Icons.replay)),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  void initState() {
    _body = _buildListView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }
}
