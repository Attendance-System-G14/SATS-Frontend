import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sats/Student/Course/model.dart';
import 'package:sats/auth/utils.dart';

Future<List<Course>> loadcourses(context)async{
  var url = DotEnv().env['API_ADDRESS'] + '/student/courses';
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: 'Token ' + getUserToken(context)
  };
  final response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    var jsonData = json.decode(response.body);
    List<Course> courses = [];
    for (var course in jsonData)
      courses.add(Course.fromJson(course));

    return courses;
  } else {
    // If that call was not successful, throw an error.
    print(response.body);
    throw Exception('Failed to load data');
  }
}