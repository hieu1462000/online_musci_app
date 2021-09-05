import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_musci_app/service/auth.dart';

class SignIn extends StatefulWidget {
  final Function swapView;

  SignIn({this.swapView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool _showPassword = true;
  String error = "";
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Center(
          child: Text("Sign in "),
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 20, left: 40, right: 40),
          child: Form(
            key: _formKey,
            child: Stack(children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("Email address")),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      hintText: 'Type your email address here.',
                      hintStyle:
                          TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                      border: OutlineInputBorder(),
                    ),
                    validator: (val) => val.isEmpty ? "Enter an email" : null,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.bottomLeft, child: Text("Password")),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      hintText: "Type your password here.",
                      hintStyle:
                          TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                      suffix: GestureDetector(
                        child: Icon(
                          _showPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 22,
                        ),
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (val) => val.length < 6
                        ? "Enter a password at least 6 characters"
                        : null,
                    obscureText: _showPassword,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error =
                                  "Wrong password or couldn't find your email";
                            });
                          }
                        }
                      },
                      color: Colors.blue[800],
                      child: Text(
                        "Get started",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    error,
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Positioned(
                  bottom: 20,
                  left: 25,
                  child: RichText(
                      text: TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Register now!',
                        style: TextStyle(color: Colors.orange[900]),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Single tapped.
                            widget.swapView();
                          },
                      ),
                    ],
                  )))
            ]),
          )),
    );
  }
}
