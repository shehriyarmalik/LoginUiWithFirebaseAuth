import 'package:Login/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static final String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF527DAA),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              color: Colors.white,
              onPressed: AuthService.logout,
            ),
          ],
        ),
        body: Center(
          child: Container(
            child: Text(
              'Home',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ));
  }
}
