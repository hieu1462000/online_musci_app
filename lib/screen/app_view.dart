import 'package:flutter/material.dart';
import 'package:online_musci_app/model/user_model.dart';
import 'package:online_musci_app/screen/authenticate/authenticate.dart';
import 'package:online_musci_app/screen/home/home.dart';
import 'package:provider/provider.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
