import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:routine/ui/style.dart';

class UserHeader extends StatefulWidget {
  final _userFuture = FirebaseAuth.instance.currentUser();

  @override
  UserHeaderState createState() => UserHeaderState();
}

class UserHeaderState extends State<UserHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      color: primaryColor,
      child: SafeArea(
        child: FutureBuilder<FirebaseUser>(
          future: widget._userFuture,
          builder: (context, snapshot) => snapshot.hasData
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: accentColor,
                      child: Text(
                        snapshot.data.displayName[0],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      snapshot.data.displayName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      snapshot.data.phoneNumber,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
