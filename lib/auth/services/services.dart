import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:sats/auth/models.dart';

Future<String> logintoBakend(accessToken) async {
  var url = DotEnv().env['API_ADDRESS'] + '/auth_api/rest-auth/google/';
  Map<String, String> headers = {"Content-type": "application/json"};
  Map data = {"access_token": accessToken};
  final response =
      await http.post(url, headers: headers, body: json.encode(data));

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    var jsonData = json.decode(response.body);
    return jsonData['key'];
  } else {
    // If that call was not successful, throw an error.
    print(response.body);
    throw Exception('Failed to load data');
  }
}

Future<bool> serverLogout(token) async {
  var url = DotEnv().env['API_ADDRESS'] + '/auth_api/rest-auth/logout/';
  final response = await http
      .post(url, headers: {HttpHeaders.authorizationHeader: 'Token ' + token});

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    var jsonData = json.decode(response.body);
    print(jsonData);
    return jsonData['detail'] == 'Successfully logged out.';
  } else {
    // If that call was not successful, throw an error.
    print(response.body);
    throw Exception('Failed to load data');
  }
}

Future<User> getUserDetail(String token) async {
  var url = DotEnv().env['API_ADDRESS'] + '/auth_api/rest-auth/user/';
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: 'Token ' + token
  };
  final response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    var jsonData = json.decode(response.body);
    return User.fromJson(jsonData);
  } else {
    // If that call was not successful, throw an error.
    print(response.body);
    throw Exception('Failed to load data');
  }
}
