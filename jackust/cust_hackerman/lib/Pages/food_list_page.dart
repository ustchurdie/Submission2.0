import 'package:flutter/material.dart';

class FoodList extends StatelessWidget {

  final String type;

  const FoodList({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$type')),
    );
  }
}