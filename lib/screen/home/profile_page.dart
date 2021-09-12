import 'package:flutter/material.dart';
import 'package:online_musci_app/service/auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          color: Colors.blue[800],
          child: Text("Log out"),
          onPressed: () async {
            await _auth.signOut();
          },
        )
      ),
    );
  }
}
