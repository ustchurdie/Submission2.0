import 'dart:math';

import 'package:cust_hackerman/Models/foodbase.dart';
import 'package:cust_hackerman/Pages/foodtemplate_2.dart';
import 'package:cust_hackerman/Widgets/FoodCardScrollBar/FoodCard.dart';
import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  static Random random = new Random();

  final String resultword;
  final String result;

  const SearchResultPage({this.result, this.resultword});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('$result',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Color.fromRGBO(203, 241, 245, 1),
        leading: IconButton(
          iconSize: kToolbarHeight * 0.5,
          color: Colors.black,
          icon: Icon(Icons.arrow_left_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(child: Text('$resultword')),
    );
  }
}
