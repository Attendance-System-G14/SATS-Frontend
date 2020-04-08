import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sats/Faculty/Course/CoursePage/models.dart';
import 'package:sats/Faculty/Course/CoursePage/services.dart';

class AttendanceList extends StatefulWidget {
  @override
  _AttendanceListState createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  Widget _body;

  _buildAttendanceList() {
    return FutureBuilder(
      future: loadAttendanceList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (snapshot.hasData) {
          List<Attendance> attendances = snapshot.data;
          return ListView.builder(
            itemCount: attendances.length,
            itemBuilder: (context, index) {
              return Text(
                  '${DateFormat("dd, MMM").format(attendances[index].dateTime)}');
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
