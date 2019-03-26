import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../pages/notifications.dart';
import '../pages/phone_login.dart';
import '../ui/style.dart';
import '../ui/user_info.dart';
import '../pages/add_routine.dart';

class SmartDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: primaryColor,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            UserHeader(),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: DrawerItems(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () => _notifications(context),
          title: Text('Notifications'),
          trailing: Icon(Icons.notifications),
        ),
        ListTile(
          onTap: () => _addRoutine(context),
          title: Text('Add Routine'),
        ),
        ListTile(
          onTap: () => _logout(context),
          title: Text('Log Out'),
          trailing: Icon(Icons.power_settings_new),
        ),
      ],
    );
  }

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(PhoneAuth.builder);
  }

  _notifications(BuildContext context) {
    Navigator.of(context).push(Notifications.builder);
  }

  _addRoutine(BuildContext context) {
    Navigator.of(context).push(AddRoutine.builder);
  }
}
