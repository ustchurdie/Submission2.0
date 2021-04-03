import 'package:flutter/material.dart';

class FoodTemplate3 extends StatelessWidget {

  final String foodName;
  final String foodId;

  const FoodTemplate3({Key key,@required this.foodName, this.foodId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$foodId'),),
      body: Text('$foodName'),
    );
  }
}