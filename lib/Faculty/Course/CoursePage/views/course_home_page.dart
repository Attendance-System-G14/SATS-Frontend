import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sats/Faculty/Course/CoursePage/views/attendance_list.dart';
import 'package:sats/Faculty/Course/CoursePage/views/custom_calendar/calendar_popup_view.dart';
import 'package:sats/Faculty/Course/model.dart';

class CourseHomePage extends StatefulWidget {
  final Course course;
  CourseHomePage(this.course);

  @override
  _CourseHomePageState createState() => _CourseHomePageState();
}

class _CourseHomePageState extends State<CourseHomePage> {
  final GlobalKey<AttendanceListState> _courseHomePageState =
      GlobalKey<AttendanceListState>();

  DateTime startDate = DateTime.now().subtract(const Duration(days: 5));
  DateTime endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('(' + widget.course.code + ') ' + widget.course.name),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _getFilterbarUI(),
            Flexible(
              child: AttendanceList(
                key: _courseHomePageState,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.photo_camera),
        onPressed: () {},
      ),
    );
  }

  _getFilterbarUI() {
    String lectureType = 'All';
    return Container(
      color: Color.fromRGBO(0, 0, 0, 0.08),
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              showDemoDialog(context: context);
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Choose date',
                    style: TextStyle(
                        fontSize: 16, color: Colors.grey.withOpacity(0.8)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          VerticalDivider(
            thickness: 3,
            indent: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Lecture Type',
                  style: TextStyle(
                      fontSize: 16, color: Colors.grey.withOpacity(0.8)),
                ),
                DropdownButton<String>(
                  value: lectureType,
                  items: <String>['All', 'Lecture', 'Tutorial']
                      .map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (_value) {
                    setState(() {
                      lectureType = _value;
                      _courseHomePageState.currentState
                          .filterAttendance(null, null, lectureType);
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showDemoDialog({BuildContext context}) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => CalendarPopupView(
        barrierDismissible: true,
        maximumDate: DateTime.now(),
        initialEndDate: endDate,
        initialStartDate: startDate,
        onApplyClick: (DateTime startData, DateTime endData) {
          setState(() {
            if (startData != null && endData != null) {
              startDate = startData;
              endDate = endData;
              _courseHomePageState.currentState
                  .filterAttendance(startDate, endDate, null);
            }
          });
        },
        onCancelClick: () {},
      ),
    );
  }
}
