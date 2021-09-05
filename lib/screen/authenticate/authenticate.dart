import 'package:flutter/material.dart';
import 'package:online_musci_app/screen/authenticate/register.dart';
import 'package:online_musci_app/screen/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(swapView: toggleView,);
    } else {
      return Register(swapView: toggleView,);
    }
  }
}
