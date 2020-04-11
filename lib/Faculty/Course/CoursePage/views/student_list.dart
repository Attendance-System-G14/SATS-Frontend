import 'package:flutter/material.dart';
import 'package:sats/Faculty/Course/CoursePage/models.dart';
import 'package:sats/Faculty/Course/CoursePage/services.dart';
import 'package:sats/Faculty/Course/CoursePage/views/student_tile.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  Widget _body;

  _buildAttendanceList() {
    return FutureBuilder(
      future: loadStudentList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (snapshot.hasData) {
          List<Student> students = snapshot.data;
          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              return StudentTile(students[index]);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: FlatButton(
              child: Icon(Icons.replay),
              onPressed: () {
                setState(() {
                  _body = _buildAttendanceList();
                });
              },
            ),
          );
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }

  @override
  void initState() {
    _body = _buildAttendanceList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }
}
