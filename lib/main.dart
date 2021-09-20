import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_musci_app/model/user_model.dart';
import 'package:online_musci_app/screen/app_view.dart';
import 'package:online_musci_app/service/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: AppView()
      ),
    );
  }
}

