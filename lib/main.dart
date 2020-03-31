import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:sats/auth/auth.dart';
import 'package:sats/auth/views/login_page.dart';
import 'package:sats/home.dart';

Future<void> main() async {
  await DotEnv().load('.env'); // load environment variable
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        Auth _auth = Auth();
        _auth.init();
        return _auth;
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer<Auth>(
        builder: (BuildContext context, Auth value, Widget child) {
          if(value.logined)
            return MyHomePage(title: 'Flutter Demo Home Page');
          else
            return LoginPageView();
        },
      ),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginPageView(),
      },
    );
  }
}
