import 'package:flutter/material.dart';

class RestaurantPage extends StatelessWidget {

  final String title;

  const RestaurantPage({Key key, @required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true,),

      //TODO: Add the detail of the type of restaurant e.g. what does it provides etc.
    );
  }
}