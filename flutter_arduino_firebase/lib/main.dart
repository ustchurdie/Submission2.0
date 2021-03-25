import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_arduino_firebase/Pages/InfoPage.dart';
import 'package:flutter_arduino_firebase/Pages/loadingPage.dart';
import 'Pages/HomePage.dart';
import 'Widgets/CustomAppBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: '/home',
      routes: {
        '/': (context) => LoadingPage(),
        '/home': (context) => Home(),
        '/info': (context) => InfoPage(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      key: _scaffoldKey,
      appBar: CustomAppBar(title: 'test',onPressed: null, child: Icon(Icons.menu)),
      body: HomePage(),
    );
  }
}