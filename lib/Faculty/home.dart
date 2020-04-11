import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _getFacultyStatsUI(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 3.0,
                  ),
                ),
              ),
              child: Text(
                'Courses',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Flexible(
              child: CourseListView(),
            )
          ],
        ),
      ),
    );
  }

  Widget _getsemesterdetail() {
    var now = DateTime.now();
    var sem;
    var academicyear;
    var midyear = DateTime.utc(now.year, 6, 30);
    if (now.isBefore(midyear)) {
      sem = " 2nd Sem of AY ";
      academicyear =
          (now.year - 1).toString() + '-' + (now.year % 100).toString();
    } else {
      sem = " 1st Sem of AY ";
      academicyear =
          (now.year).toString() + '-' + ((now.year + 1) % 100).toString();
    }
    return RichText(
      text: TextSpan(
        text: sem + academicyear,
        style: TextStyle(color: Colors.black, fontSize: 17),
      ),
    );
  }

  Widget _getFacultyStatsUI() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: Color.fromRGBO(0, 0, 0, 0.09),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.calendar_today,
                    size: 20,
                  ),
                  _getsemesterdetail(),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 6.0,
              animation: true,
              animationDuration: 2000,
              animateFromLastPercent: false,
              percent: 3 / 5,
              center: new Text("3/5"),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.green[600],
              backgroundColor: Colors.blueGrey[300],
            ),
          ),
        ],
      ),
    );
  }
}
