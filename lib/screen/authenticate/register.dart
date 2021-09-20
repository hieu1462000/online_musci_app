import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_musci_app/service/auth.dart';
import 'package:online_musci_app/service/loading.dart';

class Register extends StatefulWidget {
  final Function swapView;
  Register({this.swapView});


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  bool _showPassword = true;
  String error ="";
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Center(
          child: Text("Create Account"),
        )
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
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error =
                              "Please supply a valid email!";
                              loading = false;
                            });
                          }
                        }
                      },
                      color: Colors.blue[400],
                      child: Text(
                        "Create account",
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
                  left: 43,
                  child: RichText(
                      text: TextSpan(
                        text: "Already have account?",
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Sign in!',
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
