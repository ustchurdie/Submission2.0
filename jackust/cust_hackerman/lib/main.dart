import 'package:flutter/material.dart';

void main(){
  runApp(MyWeb());
}

class MyWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {},
      initialRoute: '',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}