import 'package:flutter/material.dart';
import 'package:sats/Faculty/Course/CoursePage/models.dart';
import 'package:sats/common/views/progress_bar.dart';

class StudentTile extends StatefulWidget {
  final Student student;
  StudentTile(this.student);

  @override
  _StudentTileState createState() => _StudentTileState();
}

class _StudentTileState extends State<StudentTile>
    with SingleTickerProviderStateMixin {
  AnimationController progressController;

  _getCircleProgressWidget() {
    progressController.forward();
    return CustomPaint(
        foregroundPainter: CircleProgress(
            (widget.student.classessAttended / 60) *
                100.0), // this will add custom painter after child
        child: Container(
          width: 80,
          height: 80,
          child: Center(
              child: Text(
            "${widget.student.classessAttended}/${60}",
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
                        widget.student.entryNumber,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.student.name,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      'kuchh bhi'),
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
