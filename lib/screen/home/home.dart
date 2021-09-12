import 'package:flutter/material.dart';
import 'package:online_musci_app/screen/home/browse_page.dart';
import 'package:online_musci_app/screen/home/profile_page.dart';
import 'package:online_musci_app/screen/home/search_page.dart';
import 'package:online_musci_app/service/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService _auth = AuthService();

  int _currentIndex = 0;
  String _title = "Home";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text(_title),
      ),
      body: body(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.queue_music_outlined),
            title: Text("Browse")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
              title: Text("Search")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
              title: Text("Profile")
          )
        ],
        onTap: onTapHandler,
      ),
    );
  }

  Widget body() {
    if(_currentIndex == 0) {
      return BrowsePage();
    } else if (_currentIndex ==1) {
      return SearchPage();
    } else {
      return ProfilePage();
    }
  }

  void onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
      switch(index) {
        case 0: {_title = "Browse";}
        break;
        case 1: {_title = "Search";}
        break;
        case 2: {_title = "Profile";}
        break;
      }
    });
  }
}

