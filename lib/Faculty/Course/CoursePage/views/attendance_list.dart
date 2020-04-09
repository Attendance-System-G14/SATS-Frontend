import 'package:flutter/material.dart';
import 'package:sats/Faculty/Course/CoursePage/models.dart';
import 'package:sats/Faculty/Course/CoursePage/services.dart';
import 'package:sats/Faculty/Course/CoursePage/views/attendance_tile.dart';

class AttendanceList extends StatefulWidget {
  AttendanceList({Key key}) : super(key: key);

  @override
  AttendanceListState createState() => AttendanceListState();
}

class AttendanceListState extends State<AttendanceList> {
  Widget _body;
  List<Attendance> allAttendances = [];
  DateTime startdateTime, enddateTime;
  String lectureType;

  _buildAttendanceList() {
    return FutureBuilder(
      future: loadAttendanceList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (snapshot.hasData) {
          allAttendances = snapshot.data;
          return ListView.builder(
            itemCount: allAttendances.length,
            itemBuilder: (context, index) {
              return AttendanceTile(allAttendances[index]);
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

  void filterAttendance(DateTime startdate, DateTime enddate, String lectureT) {
    if (startdate != null) startdateTime = startdate;
    if (enddate != null) enddateTime = enddate;
    if (lectureT != null) lectureType = lectureT;

    List<Attendance> fillteredattendance = [];

    for (Attendance attendance in allAttendances) {
      bool pass = true;
      if (startdateTime != null && enddateTime != null) {
        if (!(attendance.dateTime.isAfter(startdateTime) &&
            attendance.dateTime
                .isBefore(enddateTime.add(const Duration(days: 1)))))
          pass = false;
      }
      if (lectureType != null && lectureType != 'All') {
        if (attendance.lectureType != lectureType) pass = false;
      }
      if (pass) fillteredattendance.add(attendance);
    }

    setState(() {
      _body = ListView.builder(
        itemCount: fillteredattendance.length,
        itemBuilder: (context, index) {
          return AttendanceTile(fillteredattendance[index]);
        },
      );
    });
  }
}
