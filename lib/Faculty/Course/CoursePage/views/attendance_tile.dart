import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sats/Faculty/Course/CoursePage/models.dart';

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
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(height: 8,),
                  Text('${DateFormat("Hm").format(widget.attendance.dateTime)}'),
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

class CircleProgress extends CustomPainter {
  double currentProgress;

  CircleProgress(this.currentProgress);

  @override
  void paint(Canvas canvas, Size size) {
    //this is base circle
    Paint outerCircle = Paint()
      ..strokeWidth = 10
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = 10
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 10;

    canvas.drawCircle(
        center, radius, outerCircle); // this draws main outer circle

    double angle = 2 * pi * (currentProgress / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
