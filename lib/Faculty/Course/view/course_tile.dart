import 'package:flutter/material.dart';
import 'package:sats/Faculty/Course/model.dart';

class CourseTile extends StatelessWidget {
  final Course course;
  CourseTile(this.course);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(72, 129, 219, .9),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    course.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          course.code,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
