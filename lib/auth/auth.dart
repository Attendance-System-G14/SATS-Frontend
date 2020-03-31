import 'package:flutter/material.dart';
import 'package:sats/auth/models.dart';
import 'package:sats/auth/services/google_login.dart';
import 'package:sats/auth/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  String token;
  String name;
  bool logined = false;

  Future<void> init() async {
    await loadLoginPrefs();
    this.logined = (token == null) ? false : true;

    notifyListeners();
  }

  Future<bool> login() async {
    Map<String, String> credential = await handleGoogleSignIn();
    token = await logintoBakend(credential['accessToken']);
    try {
      User user = await getUserDetail(token);
      this.name = user.firstName + ' ' + user.lastName;
    } catch (e) {
      print("Token: ");
      print(token);
      print(e);
    }
    await setLoginPrefs();
    this.logined = (token == null) ? false : true;

    notifyListeners();
    return this.logined;
  }

  Future<void> logout() async {
    await handleGoogleSignOut();

    await serverLogout(token);
    this.token = null;
    this.logined = false;
    await setLoginPrefs();

    notifyListeners();
  }

  setLoginPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('DJANGO_TOKEN', this.token);
    prefs.setString('FULL_NAME', this.name);
  }

  loadLoginPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.token = prefs.getString('DJANGO_TOKEN') ?? null;
    this.name = prefs.getString('FULL_NAME') ?? null;
  }

  Future<bool> checkLogin(BuildContext context) async {
    if (this.logined) {
      return true;
    }

    await Navigator.pushNamed(context, '/login');

    if (this.logined) {
      return true;
    }

    return false;
  }
}
