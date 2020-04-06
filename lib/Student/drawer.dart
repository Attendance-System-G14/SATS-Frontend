import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sats/auth/auth.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Consumer<Auth>(
      builder: (BuildContext context, Auth auth, Widget child) {
        return ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(auth.name),
              accountEmail: Text(auth.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  auth.name[0],
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () async {
                await auth.logout();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    ));
  }
}
