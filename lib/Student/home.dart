import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sats/Student/Course/view/course_list_view.dart';
import 'package:sats/Student/drawer.dart';

class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SATS'),
      ),
      drawer: CustomDrawer(),
      body: Container(
        color: Color.fromRGBO(0, 0, 0, 0.08),
        child: Column(
          children: <Widget>[
            _getStudentStatsUI(),
            Flexible(
              child: CourseListView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _generatedetails(String detail,String percentage) {
    return RichText(
      text: TextSpan(
          text: detail,
          style: TextStyle(color: Colors.black, fontSize: 17),
          children: <TextSpan>[
            TextSpan(
              text: percentage,
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ]),
    );
  }

  Widget _getsemesterdetail(){
    var now = DateTime.now();
    var sem ;
    var academicyear;
    var midyear = DateTime.utc(now.year,6,30);
    if (now.isBefore(midyear)){
      sem = "2nd Sem of AY ";
      academicyear = (now.year - 1).toString() + '-' + (now.year % 100).toString();
    }
    else{
      sem = "1st Sem of AY ";
      academicyear = (now.year).toString() + '-' + ((now.year + 1) % 100).toString();
    }
    return RichText(
      text: TextSpan(
          text: sem+academicyear,
          style: TextStyle(color: Colors.black, fontSize: 17),
          ),
    );
  }

  Widget _getStudentStatsUI() {
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
                    Icons.flag,
                    size: 20,
                  ),
                  _generatedetails("Goal", " 75%")
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    size: 20,
                  ),
                  _generatedetails("Overall Attendance", " 75%")
                ],
              ),
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
