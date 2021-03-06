import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sats/Faculty/Course/CoursePage/models.dart';
import 'package:sats/common/views/progress_bar.dart';

class AttendanceTile extends StatefulWidget {
  final Attendance attendance;
  AttendanceTile(this.attendance);

  @override
  _AttendanceTileState createState() => _AttendanceTileState();
}

class _AttendanceTileState extends State<AttendanceTile>
    with SingleTickerProviderStateMixin {
  AnimationController progressController;

  _getCircleProgressWidget() {
    progressController.forward();
    return CustomPaint(
        foregroundPainter: CircleProgress((widget.attendance.presentStudents /
                widget.attendance.totalStudents) *
            100.0), // this will add custom painter after child
        child: Container(
          width: 80,
          height: 80,
          child: Center(
              child: Text(
            "${widget.attendance.presentStudents}/${widget.attendance.totalStudents}",
            style: TextStyle(fontSize: 12),
          )),
        ));
  }

  @override
  void initState() {
    super.initState();
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color lTypeColor = Colors.blueGrey;
    if (widget.attendance.lectureType == 'Lecture')
      lTypeColor = Colors.blueAccent;
    return Padding(
      padding: EdgeInsets.all(4),
      child: Card(
        elevation: 2.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '${DateFormat("dd, MMM").format(widget.attendance.dateTime)}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.attendance.lectureType,
                        style: TextStyle(color: lTypeColor),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      '${DateFormat("Hm").format(widget.attendance.dateTime)}'),
                ],
              ),
            ),
            _getCircleProgressWidget()
          ],
        ),
      ),
    );
  }
}
